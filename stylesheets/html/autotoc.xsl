<?xml version='1.0'?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<!-- ********************************************************************
     $Id: autotoc.xsl,v 1.5 2003-12-30 23:43:45 sfox Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<xsl:template name="href.target">
  <xsl:param name="object" select="."/>
  <xsl:text>#</xsl:text>
  <xsl:call-template name="object.id">
    <xsl:with-param name="object" select="$object"/>
  </xsl:call-template>
</xsl:template>

<xsl:variable name="toc.listitem.type">
  <xsl:choose>
    <xsl:when test="$toc.list.type = 'dl'">dt</xsl:when>
    <xsl:when test="$toc.list.type = 'table'">tr</xsl:when>
    <xsl:otherwise>li</xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!-- this is just hack because dl and ul aren't completely isomorphic -->
<!-- this 'just hack' screws up when you reach subtocs - sf april 03 -->
<xsl:variable name="toc.dd.type">
  <xsl:choose>
    <xsl:when test="$toc.list.type = 'dl'">dd</xsl:when>
    <xsl:when test="$toc.list.type = 'table'">td</xsl:when>
    <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:template name="spaceholder">
  <xsl:text disable-output-escaping="yes">&nbsp;</xsl:text>
</xsl:template>

<xsl:template name="set.toc">
  <xsl:variable name="nodes" select="book"/>
  <xsl:if test="$nodes">
    <div class="toc">
      <p>
        <b>
          <xsl:call-template name="gentext">
            <xsl:with-param name="key">tableofcontents</xsl:with-param>
          </xsl:call-template>
        </b>
      </p>
      <xsl:element name="{$toc.list.type}">
        <xsl:apply-templates select="$nodes" mode="toc"/>
      </xsl:element>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template name="division.toc">
  <xsl:if test="$generate.division.toc != 0">
   <xsl:variable name="nodes" select="part|classset|enumset
                                       |chapter|appendix
                                       |refentry|bridgehead"/>
    <xsl:if test="$nodes">
      <div class="toc">
        <p>
          <b>
           <xsl:call-template name="gentext">
             <xsl:with-param name="key">tableofcontents</xsl:with-param>
           </xsl:call-template>
          </b>
        </p>
        <xsl:element name="{$toc.list.type}">
          <xsl:apply-templates select="$nodes" mode="toc"/>
        </xsl:element>
      </div>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template name="component.toc">
  <xsl:if test="$generate.component.toc != 0">
    <xsl:variable name="nodes" select="section|sect1|sect2|refentry
    				       |classentry[@hide='0']
    				       |enums/enum[@hide='0']
                           |bridgehead[not(@renderas)]
                           |.//bridgehead[@renderas='sect1']"/>
    <xsl:if test="$nodes">
      <div class="toc">
        <p>
          <b>
           <xsl:call-template name="gentext">
             <xsl:with-param name="key">tableofcontents</xsl:with-param>
           </xsl:call-template>
          </b>
        </p>
        <xsl:element name="{$toc.list.type}">
          <xsl:apply-templates select="$nodes" mode="toc"/>
        </xsl:element>
      </div>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="book" mode="toc">
  <xsl:variable name="nodes" select="bridgehead"/>

  <xsl:variable name="subtoc">
    <xsl:element name="{$toc.list.type}">
      <xsl:apply-templates mode="toc" select="$nodes"/>
    </xsl:element>
  </xsl:variable>

  <xsl:variable name="subtoc.list">
    <xsl:choose>
      <xsl:when test="$toc.dd.type = ''">
        <xsl:copy-of select="$subtoc"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{$toc.dd.type}">
          <xsl:copy-of select="$subtoc"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:element name="{$toc.listitem.type}">
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="title.markup"/>
    </a>
    <xsl:if test="$toc.listitem.type = 'li'
                  and $toc.section.depth>0 and count($nodes)&gt;0">
      <xsl:copy-of select="$subtoc.list"/>
    </xsl:if>
  </xsl:element>
  <xsl:if test="$toc.listitem.type != 'li'
                and $toc.section.depth>0 and count($nodes)&gt;0">
    <xsl:copy-of select="$subtoc.list"/>
  </xsl:if>
</xsl:template>

<xsl:template match="appendix|chapter|classset|enumset|part|sect1" mode="toc">
  <xsl:variable name="nodes" select="bridgehead"/>

  <xsl:variable name="subtoc">
    <xsl:element name="{$toc.list.type}">
      <xsl:apply-templates select="$nodes" mode="toc"/>
    </xsl:element>
  </xsl:variable>

  <xsl:variable name="subtoc.list">
    <xsl:choose>
      <xsl:when test="$toc.dd.type = ''">
        <xsl:copy-of select="$subtoc"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{$toc.dd.type}">
          <xsl:copy-of select="$subtoc"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:element name="{$toc.listitem.type}">
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="title.markup"/>
    </a>
    <xsl:if test="$toc.listitem.type = 'li'
                  and $toc.section.depth>0 and count($nodes) &gt; 0">
      <xsl:copy-of select="$subtoc.list"/>
    </xsl:if>
  </xsl:element>
  <xsl:if test="$toc.listitem.type != 'li'
                and $toc.section.depth>0 and count($nodes) &gt; 0">
    <xsl:copy-of select="$subtoc.list"/>
  </xsl:if>
</xsl:template>

<xsl:template match="bridgehead" mode="toc">
  <xsl:if test="$bridgehead.in.toc != 0">
    <xsl:element name="{$toc.listitem.type}">
      <a>
        <xsl:attribute name="href">
          <xsl:call-template name="href.target"/>
        </xsl:attribute>
        <xsl:apply-templates/>
      </a>
    </xsl:element>
  </xsl:if>
</xsl:template>

<xsl:template match="refentry" mode="toc">
  <xsl:variable name="refmeta" select="./refmeta"/>
  <xsl:variable name="refentrytitle" select="$refmeta/refentrytitle"/>
  <xsl:variable name="title">
        <xsl:apply-templates select="$refentrytitle[1]" mode="title"/>
  </xsl:variable>
  <xsl:variable name="shortdesc" select="$refmeta/shortdesc"/>

  <xsl:element name="{$toc.listitem.type}">
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:copy-of select="$title"/>
    </a>
  </xsl:element>
    <dd>
     <xsl:apply-templates select="$shortdesc"/>
    </dd>
</xsl:template>

<xsl:template match="title" mode="toc">
  <a>
    <xsl:attribute name="href">
      <xsl:call-template name="href.target">
        <xsl:with-param name="object" select=".."/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>

<xsl:template match="classentry" mode="toc">
  <xsl:variable name="classmeta" select="./classmeta"/>
  <xsl:variable name="classentrytitle" select="$classmeta/classtitle"/>
  <xsl:variable name="title">
        <xsl:apply-templates select="$classentrytitle[1]" mode="title"/>
  </xsl:variable>
  <xsl:variable name="shortdesc" select="$classmeta/shortdesc"/>

  <xsl:element name="{$toc.listitem.type}">
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:copy-of select="$title"/>
    </a>
  </xsl:element>
   <dd>
     <xsl:call-template name="spaceholder"/>
     <xsl:apply-templates select="$shortdesc"/>
   </dd>
</xsl:template>

<xsl:template match="enum" mode="toc">
 <xsl:element name="{$toc.listitem.type}">
  <a>
   <xsl:attribute name="href">
    <xsl:call-template name="href.target"/>
   </xsl:attribute>
   <xsl:apply-templates select="./enumname" mode="title" />
  </a>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>

