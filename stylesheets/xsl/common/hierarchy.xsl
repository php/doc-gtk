<?xml version='1.0' encoding='ISO-8859-1' ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<!-- $Id: hierarchy.xsl,v 1.3 2001-08-10 10:40:51 jmoore Exp $ -->
		
<!-- ================== Common Hierarchy Functions ============================ -->

<!--
  * Function: 	get.class.hierarchy.as.nodes
  * Params:	classentry : The class entry that we want the hierarchy for.
  * Returns: 	Each of the current classes parent classentry's as nodes
  *          	returns no if the class does not have a parent.
  *             The function returns the classes going up the tree.
  * Notes:	This function is implmented using the parent entry in the 
  *		xml definition of the class.
-->
 <xsl:template name="get.class.hierarchy.as.nodes">
  <xsl:param name="classentry"/>

  <xsl:if test="$classentry!='no'">
   <xsl:copy select="$classentry"/>
   <xsl:call-template name="get.class.hierarchy.as.nodes">
    <xsl:with-param name="classentry">
     <xsl:call-template name="get.parent.node.from.child.node">
      <xsl:with-param name="classentry" select="$classentry"/>
     </xsl:call-template>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:if>
    
 </xsl:template>

<!--
  * Function:	get.parent.node.from.child.node
  * Params:     classentry: the childs class entry node
  * Returns:	The parents classentry node.
-->
 <xsl:template name="get.parent.node.from.child.node">
  <xsl:param name="classentry"/>
  <xsl:variable name="parentname"/>
   <xsl:value-of select="$classentry/classmeta/classparent"/>
  </xsl:variable>
  <xsl:if test="$parentname!=''">
   <xsl:copy select="//classentry[classmeta/classtitle=$parentname]" />
  </xsl:if>
 </xsl:template>

<!--
  * Function: 	get.function.id.from.name
  * Params:	funcname - The functions name
  *		[root - The root node to start searching from. Default is top node]
  * Returns:  	the functions id.
-->
 <xsl:template name="get.function.id.from.name">
  <xsl:param name="funcname" />
  <xsl:param name="root" select="no" />

  <xsl:choose>
   <xsl:when test="$root='no'">
    <xsl:variable name="method" select="//*[funcsynopsis/funcprototype/funcdef/function=$funcname]"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="method" select="$root//*[funcsynopsis/funcprototype/funcdef/function=$funcname]"/>
   </xsl:otherwise>
   <xsl:value-of select="$method/attribute::id" />
 </xsl:template>

<!--
  * Function: 	get.class.id.from.name
  * Params:	classname - The classes' name
  *		[root - The root node to start searching from. Default is top node]
  * Returns:  	the classes' id.
-->
 <xsl:template name="get.class.id.from.name">
  <xsl:param name="classname" />
  <xsl:param name="root" select="no" />

  <xsl:choose>
   <xsl:when test="$root='no'">
    <xsl:variable name="classentry" select="//classentry[classmeta/classtitle=$classname]" />
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="classentry" select="$root//classentry[classmeta/classtitle=$classname]" />
   </xsl:otherwise>
   <xsl:value-of select="$classentry/attribute::id" />
 </xsl:template>
 
<!--
  * Function: 	get.signal.id.from.name
  * Params:	signalname - The signals' name
  *		[root - The root node to start searching from. Default is top node]
  * Returns:  	the signals' id.
-->
  <xsl:template name="get.class.id.from.name">
  <xsl:param name="signalname" />
  <xsl:param name="root" select="no" />

  <xsl:choose>
   <xsl:when test="$root='no'">
   <xsl:variable name="signal" select="//signal[signalname=$signame]"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="signal" select="$root//signal[signalname=$signame]"/>
   </xsl:otherwise>
   <xsl:value-of select="$signal/attribute::id" />
 </xsl:template>

 <!-- ========================================================================== -->
 
</xsl:stylesheet>
