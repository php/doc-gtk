<?xml version="1.0" encoding="utf-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- This stylesheet was created by template/titlepage.xsl; do not edit it by hand. -->

<xsl:template name="classset.titlepage.recto"><xsl:apply-templates mode="classset.titlepage.recto.auto.mode" select="classsetinfo/xsl:element|docinfo/xsl:element|classsetinfo/desc|docinfo/desc"/>
</xsl:template>

<xsl:template match="xsl:element" mode="classset.titlepage.recto.auto.mode"><xsl:apply-templates select="classsettitle" mode="classset.titlepage.recto.auto.mode"/>
</xsl:template>

<xsl:template name="classset.titlepage.verso">
</xsl:template>

<xsl:template name="classset.titlepage.separator"><hr/>
</xsl:template>

<xsl:template name="classset.titlepage.before.recto">
</xsl:template>

<xsl:template name="classset.titlepage.before.verso">
</xsl:template>

<xsl:template name="classset.titlepage">
  <div class="classset_titlepage">
    <xsl:call-template name="classset.titlepage.before.recto"/>
    <xsl:call-template name="classset.titlepage.recto"/>
    <xsl:call-template name="classset.titlepage.before.verso"/>
    <xsl:call-template name="classset.titlepage.verso"/>
    <xsl:call-template name="classset.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="classset.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="classset.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="xsl:element" mode="classset.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="classset.titlepage.recto.style">
<xsl:apply-templates select="." mode="classset.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="desc" mode="classset.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="classset.titlepage.recto.style">
<xsl:apply-templates select="." mode="classset.titlepage.recto.mode"/>
</div>
</xsl:template>

</xsl:stylesheet>