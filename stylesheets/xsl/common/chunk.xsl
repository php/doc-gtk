<?xml version='1.0' encoding='ISO-8859-1' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<!-- $Id: chunk.xsl,v 1.1 2001-08-12 10:41:08 jmoore Exp $ -->
		
<!-- ================== Common Chunk Functions ============================ -->

<!--
  * Function:	is.chunk
  * Params:	node - node to check
  * Returns:	1 if it is a chunk, 0 if it isnt
-->
 <xsl:template name="is.chunk">
  <xsl:param name="node" select="."/>
  <xsl:choose>
   <xsl:when test="name($node)='sect1'
	   and count($node/preceeding-sibling::sect1) > 0">1</xsl:when>
   <xsl:when test="name($node)='section'
                    and count($node/parent::section) = 0
                    and count($node/preceding-sibling::section) > 0">1</xsl:when>
   <xsl:when test="name($node)='preface'">1</xsl:when>
   <xsl:when test="name($node)='chapter'">1</xsl:when>
   <xsl:when test="name($node)='appendix'">1</xsl:when>
   <xsl:when test="name($node)='article'">1</xsl:when>
   <xsl:when test="name($node)='part'">1</xsl:when>
   <xsl:when test="name($node)='reference'">1</xsl:when>
   <xsl:when test="name($node)='refentry'">1</xsl:when>
   <xsl:when test="name($node)='index'
                   and (name($node/parent::*) = 'article'
                   or name($node/parent::*) = 'book')">1</xsl:when>
       <xsl:when test="name($node)='bibliography'
                    and (name($node/parent::*) = 'article'
                         or name($node/parent::*) = 'book')">1</xsl:when>
    <xsl:when test="name($node)='glossary'
                    and (name($node/parent::*) = 'article'
                         or name($node/parent::*) = 'book')">1</xsl:when>
    <xsl:when test="name($node)='colophon'">1</xsl:when>
    <xsl:when test="name($node)='book'">1</xsl:when>
    <xsl:when test="name($node)='set'">1</xsl:when>
    <xsl:when test="name($node)='setindex'">1</xsl:when>
    <xsl:when test="name($node)='classset'">1</xsl:when>
    <xsl:when test="name($node)='classentry'">1</xsl:when>
    <xsl:when test="name($node)='method'">1</xsl:when>
    <xsl:when test="name($node)='attribute'">1</xsl:when>
    <xsl:when test="name($node)='signal'">1</xsl:when>
    <xsl:when test="name($node)='constructor'">1</xsl:when>
    <xsl:when test="name($node)='legalnotice'">1</xsl:when>
    <xsl:when test="name($node)='enum'">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  <xsl:choose>
 </xsl:template>

<!--
  * Function:	chunk.filename
  * Params:	node - the node to get the filename for
  * Returns:	filename if its a chunk, filename#partname otherwise.
-->
 <xsl:template name="chunk.filename">
  <xsl:param name="node" select="."/>

  <xsl:variable name="is-chunk">
   <xsl:call-template name="is.chunk">
    <xsl:with-param name="node" select="$node"/>
   </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
   <xsl:when test="$is-chunk='0'">
     <xsl:when test="count(parent::*)>0">
      <xsl:call-template name="chunk.filename">
       <xsl:with-param name="node" select="$node/parent::*"/>
      </xsl:call-template>
     </xsl:when>
     <!-- unless there is no up, in which case return "" -->
     <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
   </xsl:when> 

   <xsl:when test="@id != '' and name($node) != 'set'">
    <xsl:value-of select="@id"/>
    <xsl:value-of select="$html.ext"/>
   </xsl:when>
   <xsl:when test="name($node) = 'set'">
    <xsl:value-of select="$root.filename"/>
   </xsl:when>
  
   <xsl:otherwise>
    <xsl:text>chunk-filename-error-</xsl:text>
    <xsl:value-of select="name(.)"/>
    <xsl:number level="any" format="01" from="set"/>
    <xsl:if test="not($recursive)">
     <xsl:value-of select="$html.ext"/>
    </xsl:if>
   </xsl:otherwise>

  </xsl:choose>
  
 </xsl:template>

</xsl:stylesheet>
