<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
                exclude-result-prefixes="doc"
                version='1.0'>

<!-- ********************************************************************
     $Id: xref.xsl,v 1.2 2003-06-13 19:53:21 sfox Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:template match="anchor">
  <a>
    <xsl:attribute name="name">
      <xsl:call-template name="object.id"/>
    </xsl:attribute>
  </a>
</xsl:template>

<xsl:template match="link">
  <xsl:variable name="targets" select="id(@linkend)"/>
  <xsl:variable name="target" select="$targets[1]"/>

  <xsl:call-template name="check.id.unique">
    <xsl:with-param name="linkend" select="@linkend"/>
  </xsl:call-template>

  <a>
    <xsl:if test="@id">
      <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>

    <xsl:attribute name="href">
      <xsl:call-template name="href.target">
        <xsl:with-param name="object" select="$target"/>
      </xsl:call-template>
    </xsl:attribute>

    <!-- FIXME: is there a better way to tell what elements have a title? -->
    <xsl:if test="local-name($target) = 'book'
                  or local-name($target) = 'set'
                  or local-name($target) = 'chapter'
                  or local-name($target) = 'part'
                  or local-name($target) = 'refentry'
                  or local-name($target) = 'example'
                  or local-name($target) = 'table'
                  or local-name($target) = 'figure'
                  or starts-with(local-name($target),'sect')">
      <xsl:attribute name="title">
        <xsl:apply-templates select="$target"
                             mode="object.title.markup.textonly"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:apply-templates/>
  </a>
</xsl:template>

<xsl:template match="ulink">
  <a>
    <xsl:if test="@id">
      <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
    </xsl:if>
    <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
    <xsl:if test="$ulink.target != ''">
      <xsl:attribute name="target">
        <xsl:value-of select="$ulink.target"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="count(child::node())=0">
	<xsl:value-of select="@url"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </a>
</xsl:template>

<xsl:template match="olink">
  <xsl:if test="@id">
    <a name="{@id}"/>
  </xsl:if>
  <xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
