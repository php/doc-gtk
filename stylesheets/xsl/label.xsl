<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
                xmlns:lxslt="http://xml.apache.org/xslt"
                xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
		version="1.0"
                exclude-result-prefixes="doc"
                extension-element-prefixes="saxon xalanredirect lxslt">

<xsl:template match="classset" mode="label.content">
 <xsl:param name="punct">.</xsl:param>
 <xsl:choose>
  <xsl:when test="@label">
   <xsl:value-of select="@label"/>
   <xsl:value-of select="$punct"/>
  </xsl:when>
  <xsl:when test="$part.autolabel != 0">
   <xsl:number from="book" count="classset" format="I" level="any"/>
   <xsl:value-of select="$punct"/>
  </xsl:when>
 </xsl:choose>
</xsl:template>

<xsl:template match="classentry" mode="label.content">
 <xsl:param name="punct">.</xsl:param>
 <xsl:if test="@label">
  <xsl:value-of select="@label"/>
  <xsl:value-of select="$punct"/>
 </xsl:if>
</xsl:template>

<xsl:template match="method|signal|attribute|constructor|legalnotice" mode="label.content">
 <xsl:param name="punct">.</xsl:param>
 <xsl:if test="@label">
  <xsl:value-of select="@label"/>
  <xsl:value-of select="$punct"/>
 </xsl:if>
</xsl:template>

</xsl:stylesheet>
