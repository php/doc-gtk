<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<!-- 
	English Localisation file.

	See: locale.xsl.in for more information.

	$Id: en.xsl,v 1.3 2001-08-11 16:12:23 jmoore Exp $

-->
		
		
 <xsl:template name="get.locale.text">
  <xsl:param name="text"/>

  <!-- Pass through to default template for english -->
  <xsl:call-template name="get.default.text">
   <xsl:with-param name="text" select="$text"/>
  </xsl:call-template>
  
 </xsl:template>
		
</xsl:stylesheet>

