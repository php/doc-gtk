<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<!-- ********************************************************************
     $Id: division.xsl,v 1.7 2005-04-11 21:54:44 cweiske Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:template match="set">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
  <div class="{name(.)}" id="{$id}">
  <div dir="rtl">
    <xsl:call-template name="set.titlepage"/>
    <xsl:if test="$generate.set.toc != '0'">
      <xsl:call-template name="set.toc"/>
    </xsl:if>
	</div>
    <xsl:apply-templates/>
  </div>
 </xsl:when>
 <xsl:otherwise>
  <div class="{name(.)}" id="{$id}">
    <xsl:call-template name="set.titlepage"/>
    <xsl:if test="$generate.set.toc != '0'">
      <xsl:call-template name="set.toc"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template match="set/setinfo">
</xsl:template>

<xsl:template match="set/title"></xsl:template>

<!-- ==================================================================== -->

<xsl:template match="book">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
  <div class="{name(.)}" id="{$id}">
   <div dir="rtl">
    <xsl:call-template name="book.titlepage"/>
    <xsl:if test="$generate.book.toc != '0'">
      <xsl:call-template name="division.toc"/>
    </xsl:if>
   </div>
    <xsl:apply-templates/>
  </div>
  </xsl:when>
  <xsl:otherwise>
  <div class="{name(.)}" id="{$id}">
    <xsl:call-template name="book.titlepage"/>
    <xsl:if test="$generate.book.toc != '0'">
      <xsl:call-template name="division.toc"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="book/bookinfo"></xsl:template>
<xsl:template match="book/title"></xsl:template>

<!-- ==================================================================== -->

<xsl:template match="part">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
  <div class="{name(.)}" id="{$id}">
   <div dir="rtl">
    <xsl:call-template name="part.titlepage"/>
    <xsl:if test="not(partintro) and $generate.part.toc != '0'">
      <xsl:call-template name="division.toc"/>
    </xsl:if>
	</div>
    <xsl:apply-templates/>
  </div>
  </xsl:when>
  <xsl:otherwise>
  <div class="{name(.)}" id="{$id}">
    <xsl:call-template name="part.titlepage"/>
    <xsl:if test="not(partintro) and $generate.part.toc != '0'">
      <xsl:call-template name="division.toc"/>
    </xsl:if>
    <xsl:apply-templates/>
  </div>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template match="part" mode="make.part.toc">
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
   <div dir="rtl">
  <xsl:call-template name="division.toc"/>
  </div>
  </xsl:when>
  <xsl:otherwise>
  <xsl:call-template name="division.toc"/>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="part/title"></xsl:template>

<xsl:template match="partintro">
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
  <div class="{name(.)}" dir="rtl">
    <xsl:call-template name="partintro.titlepage"/>
    <xsl:apply-templates/>
    <xsl:if test="not(ancestor::enumset) and not(ancestor::classset) and $generate.part.toc != '0'">
      <xsl:apply-templates select="parent::*" mode="make.part.toc"/>
    </xsl:if>
  </div>
  </xsl:when>
  <xsl:otherwise>
  <div class="{name(.)}">
    <xsl:call-template name="partintro.titlepage"/>
    <xsl:apply-templates/>
    <xsl:if test="not(ancestor::enumset) and not(ancestor::classset) and $generate.part.toc != '0'">
      <xsl:apply-templates select="parent::*" mode="make.part.toc"/>
    </xsl:if>
  </div>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="partintro/title"></xsl:template>

<xsl:template match="partintro/title" mode="partintro.title.mode">
  <xsl:variable name="id">
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select=".."/>
    </xsl:call-template>
  </xsl:variable>
  <h2>
    <a name="{$id}">
      <xsl:apply-templates/>
    </a>
  </h2>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="book" mode="division.number">
  <xsl:number from="set" count="book" format="1."/>
</xsl:template>

<xsl:template match="part" mode="division.number">
  <xsl:number from="book" count="part" format="I."/>
</xsl:template>

</xsl:stylesheet>

