<!--

  Implements HTML Specific Stylesheets

  $Id: html-common.xsl,v 1.1.1.1 2001-06-01 14:33:46 andrei Exp $

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      version="1.0">

 <xsl:template match="authorgroup" mode="titlepage.mode">
  <b>
   <xsl:call-template name="authorgroup-title">
    <xsl:with-param name="id">
	 <xsl:value-of select="@id" />
	</xsl:with-param>
   </xsl:call-template>
  </b>
  <xsl:apply-templates mode="titlepage.mode" /> 
 </xsl:template>

 <xsl:template match="author" mode="titlepage.mode">
  <div xsl:use-attribute-sets="book.titlepage.recto.style">
   <xsl:call-template name="editor-author-text" />
  </div>
 </xsl:template>

 <xsl:template match="editor/contrib|author/contrib" mode="titlepage.mode">
  <xsl:text> : </xsl:text><xsl:apply-templates mode="titlepage.mode" />
 </xsl:template>

 <xsl:template name="editor-author-text" >
  <xsl:element name="A">
   <xsl:attribute name="HREF">
    <xsl:call-template name="author-email-link" />
   </xsl:attribute>
   <xsl:apply-templates select="honorific|firstname|othername|surname|lineage"  mode="titlepage.mode" />
  </xsl:element>
  <xsl:apply-templates select="affiliation|authorblurb|contrib" mode="titlepage.mode" />
 </xsl:template>

 <xsl:template match="editor" mode="titlepage.mode">
  <div xsl:use-attribute-sets="book.titlepage.recto.style">
   <xsl:if test="count(preceding-sibling::node())=0">
    <xsl:element name="h4">
     <xsl:attribute name="class">editedby</xsl:attribute>
     <xsl:call-template name="php.gtk.edited.by.text"/>
    </xsl:element>
   </xsl:if>
   <xsl:call-template name="editor-author-text"  />
  </div>
 </xsl:template>

 <xsl:template match="firstname" mode="titlepage.mode">
  <xsl:value-of select="." /><xsl:text> </xsl:text>
  <xsl:value-of select="following-sibling::surname" />
 </xsl:template>

 <xsl:template match="surname" mode="titlepage.mode" />
	  
</xsl:stylesheet>
