<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<!-- 
	Default Localisation file.

	See: locale.xsl.in for more information.

	$Id: default.xsl,v 1.2 2001-08-12 12:08:10 jmoore Exp $

-->
		
		
 <xsl:template name="get.default.text">
  <xsl:param name="text"/>
  
  <xsl:choose>
   <xsl:when test="$text='authors'">
    <xsl:text>PHP-GTK Authors</xsl:text>		 
   </xsl:when>
   <xsl:when test="$text='contributors'">
    <xsl:text>PHP-GTK Contributors</xsl:text>		 
   </xsl:when>
   <xsl:when test="$text='manual.contributors'">
    <xsl:text>PHP-GTK Manual Contributors</xsl:text>		 
   </xsl:when>
   <xsl:when test="$text='edited.by'"> 
    <xsl:text>Edited By</xsl:text>		 
   </xsl:when>
   <xsl:when test="$text='quickref.title'">
    <xsl:text>PHP-GTK Quick Reference</xsl:text>
   </xsl:when>
   <xsl:when test="$text='gtkclasses.classset'">
    <xsl:text>GTK Classes</xsl:text>
   </xsl:when>
   <xsl:when test="$text='classes'">
    <xsl:text>Classes</xsl:text>
   </xsl:when>
   <xsl:when test="$text='enum'">
    <xsl:text>Enumerations</xsl:text>
   </xsl:when>

   <xsl:otherwise>
    <xsl:message>
     <xsl:text>Could Not find Localisation or Default text for </xsl:text>
     <xsl:value-of select="$text"/>
    </xsl:message>
   </xsl:otherwise>
  </xsl:choose>

 </xsl:template>
		
</xsl:stylesheet>

