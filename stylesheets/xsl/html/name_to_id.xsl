<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0">



 <xsl:template name="get_id_from_name">
  <xsl:param name="classname" />

  <xsl:variable name="classentry" select="//classentry[classmeta/classtitle=$classname]" />
  <xsl:value-of select="$classentry/attribute::id" />
 </xsl:template>

 
 <xsl:template name="get_func_id_from_name">
  <xsl:param name="funcname" />

  <xsl:variable name="method" select="//method[funcsynopsis/funcprototype/funcdef/function=$funcname]"/>
  <xsl:value-of select="$method/attribute::id" />
 </xsl:template>
 
 <xsl:template name="get_sig_id_from_name">
  <xsl:param name="signame" />

  <xsl:variable name="signal" select="//signal[signalname=$signame]"/>
  <xsl:value-of select="$signal/attribute::id" />
 </xsl:template>

</xsl:stylesheet>
 