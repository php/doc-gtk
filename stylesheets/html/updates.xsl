<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
                xmlns:lxslt="http://xml.apache.org/xslt"
                xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
                version="1.1"
                exclude-result-prefixes="doc"
                extension-element-prefixes="saxon xalanredirect lxslt">

<!-- This stylesheet works with Saxon and Xalan; for XT use xtchunk.xsl -->

<xsl:output method="html"
	        encoding="UTF-8"
			indent="no"/>

<xsl:strip-space elements="*"/>

<xsl:template name="last">
	<xsl:param name="nodes"/>
	<xsl:param name="titlename"/>
	<xsl:for-each select="$nodes">
		<xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
		<a href="http://gtk.php.net/manual/en/{$id}.php"><xsl:value-of select="descendant::*[name()=$titlename]"/><xsl:if test="contains(@id, 'tutorial')"> (tutorial)</xsl:if></a>
<xsl:text>
</xsl:text>
	</xsl:for-each>
</xsl:template>

<xsl:template match="book">
<xsl:text>
</xsl:text>
<p>
		<xsl:call-template name="last">
			<xsl:with-param name="nodes" select="./classset/classentry"/>
			<xsl:with-param name="titlename">classtitle</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="last">
			<xsl:with-param name="nodes" select="//refentry"/>
			<xsl:with-param name="titlename">refentrytitle</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="last">
			<xsl:with-param name="nodes" select="//chapter"/>
			<xsl:with-param name="titlename">title</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="last">
			<xsl:with-param name="nodes" select="//appendix"/>
			<xsl:with-param name="titlename">title</xsl:with-param>
		</xsl:call-template>
</p>
</xsl:template>

</xsl:stylesheet>
