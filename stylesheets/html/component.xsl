<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<!-- ********************************************************************
     $Id: component.xsl,v 1.6 2006-04-13 14:22:47 cweiske Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:template name="component.title">
  <xsl:param name="node" select="."/>
  <xsl:variable name="id">
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="$node"/>
    </xsl:call-template>
  </xsl:variable>

  <h2 class="title">
    <a name="{$id}" id="{$id}-title"/>
    <xsl:apply-templates select="$node" mode="object.title.markup"/>
  </h2>
</xsl:template>

<xsl:template name="component.separator">
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="chapter">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
  <div id="{$id}" class="{name(.)}">
   <div dir="rtl">
    <xsl:call-template name="component.separator"/>
    <xsl:call-template name="chapter.titlepage"/>
    <xsl:if test="$generate.chapter.toc != '0'">
      <xsl:call-template name="component.toc"/>
    </xsl:if>
	</div>
    <xsl:apply-templates/>
  </div>
 </xsl:when>
 <xsl:otherwise>
  <div id="{$id}" class="{name(.)}">
    <xsl:call-template name="component.separator"/>
    <xsl:call-template name="chapter.titlepage"/>
    <xsl:if test="$generate.chapter.toc != '0'">
      <xsl:call-template name="component.toc"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="title" mode="chapter.titlepage.recto.mode">
  <xsl:call-template name="component.title">
    <xsl:with-param name="node" select="ancestor::chapter[1]"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="chapter/title"></xsl:template>

<!-- ==================================================================== -->

<xsl:template match="appendix">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:choose>
   <xsl:when test="self::appendix[@rtl='1']">
  <div id="{$id}" class="{name(.)}" dir="rtl">
    <xsl:call-template name="component.separator"/>
    <xsl:call-template name="appendix.titlepage"/>
    <xsl:if test="$generate.appendix.toc != '0'">
      <xsl:call-template name="component.toc"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
  </xsl:when>
  <xsl:otherwise>
  <div id="{$id}" class="{name(.)}">
    <xsl:call-template name="component.separator"/>
    <xsl:call-template name="appendix.titlepage"/>
    <xsl:if test="$generate.appendix.toc != '0'">
      <xsl:call-template name="component.toc"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template match="title" mode="appendix.titlepage.recto.mode">
  <xsl:call-template name="component.title">
    <xsl:with-param name="node" select="ancestor::appendix[1]"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="appendix/title"></xsl:template>

</xsl:stylesheet>

