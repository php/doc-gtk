<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<!-- ********************************************************************
     $Id: toc.xsl,v 1.2 2001-06-02 17:57:09 jmoore Exp $
     ********************************************************************
-->

<xsl:template name="division.toc">
  <xsl:if test="$generate.division.toc != 0">
    <xsl:variable name="nodes" select="part|reference|classset
                                       |preface|chapter|appendix
                                       |bibliography|glossary|index
                                       |refentry"/>
    <xsl:if test="$nodes">
      <div class="toc">
        <p>
          <b>
           <xsl:call-template name="gentext.element.name">
             <xsl:with-param name="element.name">TableofContents</xsl:with-param>
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
    <xsl:variable name="nodes" select="section|sect1|refentry|classentry"/>
    <xsl:if test="$nodes">
      <div class="toc">
        <p>
          <b>
           <xsl:call-template name="gentext.element.name">
             <xsl:with-param name="element.name">TableofContents</xsl:with-param>
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

<xsl:template name="section.toc">
  <xsl:variable name="nodes" select="section|sect1|sect2|sect3|sect4|sect5|refentry|classentry"/>
  <xsl:if test="$nodes">
    <div class="toc">
      <p>
        <b>
          <xsl:call-template name="gentext.element.name">
            <xsl:with-param name="element.name">TableofContents</xsl:with-param>
          </xsl:call-template>
        </b>
      </p>
      <xsl:element name="{$toc.list.type}">
        <xsl:apply-templates select="$nodes" mode="toc"/>
      </xsl:element>
    </div>
  </xsl:if>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="book|setindex" mode="toc">
  <xsl:variable name="nodes" select="part|reference
                                     |preface|chapter|appendix
                                     |bibliography|glossary|index
                                     |refentry|classset"/>

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
    <xsl:apply-templates select="." mode="label.content"/>
    <xsl:text> </xsl:text>
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="title.content"/>
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

<xsl:template match="set" mode="toc">
  <xsl:variable name="nodes" select="book|part|reference
                                     |preface|chapter|appendix
                                     |bibliography|glossary|index
                                     |refentry|classset"/>

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
    <xsl:apply-templates select="." mode="label.content"/>
    <xsl:text> </xsl:text>
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="title.content"/>
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


<xsl:template match="part|reference|preface|chapter|appendix|classset"
              mode="toc">
  <xsl:variable name="subtoc">
    <xsl:element name="{$toc.list.type}">
      <xsl:apply-templates select="section|sect1|classsentry" mode="toc"/>
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
    <xsl:apply-templates select="." mode="label.content"/>
    <xsl:text> </xsl:text>
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target"/>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="title.content"/>
    </a>
    <xsl:if test="$toc.listitem.type = 'li'
                  and $toc.section.depth>0 and section|sect1">
      <xsl:copy-of select="$subtoc.list"/>
    </xsl:if>
  </xsl:element>
  <xsl:if test="$toc.listitem.type != 'li'
                and $toc.section.depth>0 and section|sect1">
    <xsl:copy-of select="$subtoc.list"/>
  </xsl:if>
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
    - <xsl:apply-templates select="$shortdesc"/>
  </xsl:element>
</xsl:template>
</xsl:stylesheet>

