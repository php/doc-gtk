<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
                exclude-result-prefixes="doc"
                version='1.0'>

<!-- ============================================================ -->
<!-- title markup -->

<doc:mode mode="title.markup" xmlns="">
<refpurpose>Provides access to element titles</refpurpose>
<refdescription>
<para>Processing an element in the
<literal role="mode">title.markup</literal> mode produces the
title of the element. This does not include the label.
</para>
</refdescription>
</doc:mode>

<xsl:template match="*" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:choose>
    <xsl:when test="title">
      <xsl:apply-templates select="title[1]" mode="title.markup">
	<xsl:with-param name="allow-anchors" select="$allow-anchors"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="local-name(.) = 'partintro'">
      <!-- partintro's don't have titles, use the parent (part or reference)
           title instead. -->
      <xsl:apply-templates select="parent::*" mode="title.markup"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message>
       <xsl:text>Request for title of unexpected element: </xsl:text>
       <xsl:value-of select="name(.)"/>
      </xsl:message>
      <xsl:text>???TITLE???</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="title" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:choose>
    <xsl:when test="$allow-anchors != 0">
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates mode="no.anchor.mode"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="set" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:variable name="title" select="./title"/>
  <xsl:apply-templates select="$title" mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="setinfo" mode="title.markup" />

<xsl:template match="book" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:apply-templates select="(bookinfo/title|title)[1]"
                       mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="part" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:apply-templates select="(partinfo/title|docinfo/title|title)[1]"
                       mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="preface|chapter|appendix" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>

  <xsl:variable name="title" select="(docinfo/title
                                      |prefaceinfo/title
                                      |chapterinfo/title
                                      |appendixinfo/title
                                      |title)[1]"/>
  <xsl:apply-templates select="$title" mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="dedication" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:choose>
    <xsl:when test="title">
      <xsl:apply-templates select="title" mode="title.markup">
        <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'Dedication'"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="reference" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:apply-templates select="(referenceinfo/title|docinfo/title|title)[1]"
                       mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="refentry" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:variable name="refmeta" select=".//refmeta"/>
  <xsl:variable name="refentrytitle" select="$refmeta//refentrytitle"/>
  <xsl:variable name="refnamediv" select=".//refnamediv"/>
  <xsl:variable name="refname" select="$refnamediv//refname"/>

  <xsl:variable name="title">
    <xsl:choose>
      <xsl:when test="$refentrytitle">
        <xsl:apply-templates select="$refentrytitle[1]" mode="title.markup"/>
      </xsl:when>
      <xsl:when test="$refname">
        <xsl:apply-templates select="$refname[1]" mode="title.markup"/>
      </xsl:when>
      <xsl:otherwise>REFENTRY WITHOUT TITLE???</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:copy-of select="$title"/>
</xsl:template>

<xsl:template match="refentrytitle|refname" mode="title.markup">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="sect1|sect2" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:variable name="title" select="(sect1info/title
                                      |sect2info/title
                                      |title)[1]"/>

  <xsl:apply-templates select="$title" mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="figure|table|example" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:apply-templates select="title" mode="title.markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="caution|tip|warning|important|note" mode="title.markup">
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:variable name="title" select="title[1]"/>
  <xsl:choose>
    <xsl:when test="$title">
      <xsl:apply-templates select="$title" mode="title.markup">
        <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="gentext">
        <xsl:with-param name="key">
          <xsl:choose>
            <xsl:when test="local-name(.)='note'">Note</xsl:when>
            <xsl:when test="local-name(.)='important'">Important</xsl:when>
            <xsl:when test="local-name(.)='caution'">Caution</xsl:when>
            <xsl:when test="local-name(.)='warning'">Warning</xsl:when>
            <xsl:when test="local-name(.)='tip'">Tip</xsl:when>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="title|classtitle" mode="title.markup">
  <xsl:param name="text-only" select="'0'"/>
  <xsl:param name="allow-anchors" select="'0'"/>
  <xsl:choose>
    <xsl:when test="$text-only != 0">
      <xsl:value-of select="."/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$allow-anchors != 0">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates mode="no.anchor.mode"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="classset|enumset" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:apply-templates select="(./title)[1]"
                        mode="title.content">
      <xsl:with-param name="text-only" select="$text-only"/>
	  <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
 </xsl:apply-templates>
</xsl:template>

<xsl:template match="enums" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="enumset" select="ancestor::enumset"/>
 <xsl:value-of select="$enumset/title"/>
</xsl:template>

<xsl:template match="classentry" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <span dir="ltr">
 <xsl:apply-templates select="(./classmeta/classtitle)[1]"
                      mode="title.content">
    <xsl:with-param name="text-only" select="$text-only"/>
	<xsl:with-param name="allow-anchors" select="$allow-anchors"/>
 </xsl:apply-templates>
 </span>
</xsl:template>

<xsl:template match="constructor" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <span dir="ltr">
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
 </span>
 <xsl:text> </xsl:text>
 <xsl:call-template name="gentext">
  <xsl:with-param name="key">constructor</xsl:with-param>
 </xsl:call-template>
</xsl:template>

<xsl:template match="constructors|methods" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
</xsl:template>

<xsl:template match="method" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <span dir="ltr">
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
 <xsl:if test="count($classentry)>0">
  <xsl:text>::</xsl:text>
 </xsl:if>
 <xsl:value-of select="(./funcsynopsis/funcprototype/funcdef/function)[1]" />
 </span>
</xsl:template>

<xsl:template match="method" mode="title.markup.phpweb.leftnav">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <span dir="ltr">
 <xsl:value-of select="(./funcsynopsis/funcprototype/funcdef/function)[1]" />
 </span>
</xsl:template>

<xsl:template match="properties|styleproperties|fields" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
</xsl:template>

<xsl:template match="prop|field" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <span dir="ltr">
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
 <xsl:if test="count($classentry)>0">
  <xsl:text>::</xsl:text>
 </xsl:if>
 <xsl:value-of select="(./fieldname|./propname)" />
 </span>
</xsl:template>

<xsl:template match="prop|field" mode="title.markup.phpweb.leftnav">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <span dir="ltr">
 <xsl:value-of select="(./fieldname|./propname)" />
 </span>
</xsl:template>

<xsl:template match="signals" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
</xsl:template>

<xsl:template match="signal" mode="title.markup">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <span dir="ltr">
 <xsl:value-of select="(./signalname)[1]" />
 </span>
</xsl:template>

<xsl:template match="enum" mode="title.markup" >
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <span dir="ltr">
 <xsl:value-of select="./enumname"/>
 </span>
</xsl:template>

<!-- ============================================================ -->

<xsl:template match="*" mode="no.anchor.mode">
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="anchor" mode="no.anchor.mode">
  <!-- nop, suppressed -->
</xsl:template>

<xsl:template match="ulink" mode="no.anchor.mode">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="link" mode="no.anchor.mode">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="olink" mode="no.anchor.mode">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="indexterm" mode="no.anchor.mode">
  <!-- nop, suppressed -->
</xsl:template>

<xsl:template match="xref" mode="no.anchor.mode">
  <!-- FIXME: this should generate the text without the link... -->
</xsl:template>

</xsl:stylesheet>

