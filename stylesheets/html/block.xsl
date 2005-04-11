<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<!-- ********************************************************************
     $Id: block.xsl,v 1.5 2005-04-11 21:54:43 cweiske Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:template name="block.object">
  <div class="{name(.)}">
    <a>
      <xsl:attribute name="name">
        <xsl:call-template name="object.id"/>
      </xsl:attribute>
    </a>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="para">
 <xsl:choose>
  <xsl:when test="ancestor-or-self::book[@rtl='1'] or ancestor-or-self::chapter[@rtl='1']">
  <p dir="rtl">
    <xsl:if test="position() = 1 and parent::listitem">
      <a>
        <xsl:attribute name="name">
          <xsl:call-template name="object.id">
            <xsl:with-param name="object" select="parent::listitem"/>
          </xsl:call-template>
        </xsl:attribute>
      </a>
    </xsl:if>

    <xsl:if test="@id">
      <a name="{@id}"/>
    </xsl:if>
    <xsl:apply-templates/>
  </p>
  </xsl:when>
  <xsl:otherwise>
   <p>
    <xsl:if test="position() = 1 and parent::listitem">
      <a>
        <xsl:attribute name="name">
          <xsl:call-template name="object.id">
            <xsl:with-param name="object" select="parent::listitem"/>
          </xsl:call-template>
        </xsl:attribute>
      </a>
    </xsl:if>

    <xsl:if test="@id">
      <a name="{@id}"/>
    </xsl:if>
    <xsl:apply-templates/>
  </p>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="simpara">
 <xsl:choose>
  <xsl:when test="ancestor-or-self::book[@rtl='1'] or ancestor-or-self::chapter[@rtl='1']">
  <p dir="rtl">
    <xsl:if test="@id">
      <a name="{@id}"/>
    </xsl:if>
    <xsl:apply-templates/>
  </p>
  </xsl:when>
  <xsl:otherwise>
  <p>
    <xsl:if test="@id">
      <a name="{@id}"/>
    </xsl:if>
    <xsl:apply-templates/>
  </p>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="formalpara">
  <p>
    <xsl:if test="@id">
      <a name="{@id}"/>
    </xsl:if>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="formalpara/title">
  <b><xsl:apply-templates/></b>
  <xsl:call-template name="gentext.space"/>
</xsl:template>

<xsl:template match="formalpara/para">
  <xsl:apply-templates/>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="blockquote">
  <xsl:if test="@id">
    <a name="{@id}"/>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="attribution">
      <table border="0" width="100%"
	     cellspacing="0" cellpadding="0" class="blockquote"
             summary="Block quote">
	<tr>
	  <td width="10%" valign="top">&#160;</td>
	  <td width="80%" valign="top">
	    <xsl:apply-templates
	      select="child::*[local-name(.)!='attribution']"/>
	  </td>
	  <td width="10%" valign="top">&#160;</td>
	</tr>
	<tr>
	  <td colspan="2" align="right" valign="top">
	    <xsl:text>--</xsl:text>
	    <xsl:apply-templates select="attribution"/>
	  </td>
	  <td width="10%" valign="top">&#160;</td>
	</tr>
      </table>
    </xsl:when>
    <xsl:otherwise>
      <blockquote class="blockquote">
	<xsl:apply-templates/>
      </blockquote>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

</xsl:stylesheet>
