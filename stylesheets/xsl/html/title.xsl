<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
                xmlns:lxslt="http://xml.apache.org/xslt"
                xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
		version="1.0"
                exclude-result-prefixes="doc"
                extension-element-prefixes="saxon xalanredirect lxslt">

<xsl:template match="title|classtitle|classsettitle" mode="title.content">
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

<xsl:template match="classset" mode="title.content">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:apply-templates select="(./classsetmeta/classsettitle)[1]"
                        mode="title.content">
      <xsl:with-param name="text-only" select="$text-only"/>
	  <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
 </xsl:apply-templates>
</xsl:template>

<xsl:template match="classentry" mode="title.content">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:apply-templates select="(./classmeta/classtitle)[1]"
                      mode="title.content">
    <xsl:with-param name="text-only" select="$text-only"/>
	<xsl:with-param name="allow-anchors" select="$allow-anchors"/>
 </xsl:apply-templates>
</xsl:template>

<xsl:template match="method" mode="title.content">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
 <xsl:text>::</xsl:text>
 <xsl:value-of select="(./funcsynopsis/funcprototype/funcdef/function)[1]" />
</xsl:template>

<xsl:template match="constructor" mode="title.content">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
 <xsl:text> Constructor</xsl:text>
</xsl:template>

<xsl:template match="signal" mode="title.content">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:value-of select="(./signalname)[1]" />
</xsl:template>

<xsl:template match="attribute" mode="title.content">
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:variable name="classentry" select="ancestor::classentry"/>
 <xsl:value-of select="$classentry/classmeta/classtitle"/>
 <xsl:text>::</xsl:text>
 <xsl:value-of select="(./funcsynopsis/funcprototype/funcdef/function)[1]"/>
</xsl:template>

<xsl:template match="enum" mode="title.content" >
 <xsl:param name="text-only" select="'0'"/>
 <xsl:param name="allow-anchors" select="'0'"/>
 <xsl:value-of select="./enumname"/>
</xsl:template>


</xsl:stylesheet>
