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
	<xsl:param name="path"/>
	<xsl:param name="titlepath"/>
	<xsl:for-each select="$path">
		<li>
			<xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
			<a href="http://gtk.php.net/manual/en/{$id}.php"><xsl:value-of select="$titlepath"/></a>
		</li>
<xsl:text>
</xsl:text>
	</xsl:for-each>
</xsl:template>

<xsl:template match="book">
<div id="docupdates">
<h3>Latest Docs Updates</h3>
<xsl:text>
</xsl:text>
<p>
	<ul>
		<xsl:call-template name="last">
			<xsl:with-param name="path" select="//classentry"/>
			<xsl:with-param name="titlepath" select="//classtitle"/>
		</xsl:call-template>
		<xsl:call-template name="last">
			<xsl:with-param name="path" select="//refentry"/>
			<xsl:with-param name="titlepath" select="//refentrytitle"/>
		</xsl:call-template>
		<xsl:call-template name="last">
			<xsl:with-param name="path" select="//chapter"/>
			<xsl:with-param name="titlepath" select="//chapter/title"/>
		</xsl:call-template>
	</ul>
</p>
</div>
</xsl:template>

</xsl:stylesheet>
