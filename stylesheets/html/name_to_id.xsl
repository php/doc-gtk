<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
 <!ENTITY lowercase "'abcdefghijklmnopqrstuvwxyz'">
 <!ENTITY uppercase "'ABCDEFGHIJKLMNOPQRSTUVWXYZ'">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0">

 <!--
 Checks if a given ID exists in the document
 If yes, it is returned. If no, "no" is returned
 
 currently unused
 -->
 <xsl:template name="check_if_id_exists">
  <xsl:param name="id"/>
  <xsl:choose>
   <xsl:when test="name(id('$id'))=''">
    <xsl:text>no</xsl:text>
    <xsl:message>Warning: ID #<xsl:value-of select="$id"/> doesn't exist</xsl:message>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$id"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
 
 
 <!--
  returns the id for a given classname
  e.g. gtk.gtkbutton for GtkButton
  
  puts out "no" if none is found
 -->
 <xsl:template name="get_id_from_name">
  <xsl:param name="classname" />
  
  <xsl:variable name="classname_lowercase" select="translate($classname,&uppercase;,&lowercase;)"/>

  <xsl:choose>
   <xsl:when test="string-length($classname_lowercase) > 3 and (starts-with($classname_lowercase,'gtk') or starts-with($classname_lowercase,'gdk') or starts-with($classname_lowercase,'atk'))">
    <!-- it's an known object from gtk, gdk or atk -->
    <xsl:value-of select="substring($classname_lowercase,1,3)"/><xsl:text>.</xsl:text><xsl:value-of select="$classname_lowercase"/>
   </xsl:when>
   <xsl:when test="string-length($classname_lowercase) > 5 and substring($classname_lowercase,1,5)='pango'">
    <!-- known with 5 letters prefix -->
    <xsl:value-of select="substring($classname_lowercase,1,5)"/><xsl:text>.</xsl:text><xsl:value-of select="$classname_lowercase"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:text>no</xsl:text>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template><!--xsl:template name="get_id_from_name"-->

 
 
 <!--
  returns the id for a given function of a given class
  e.g. gtk.gtkaccelgroup.method.lock for function "lock" and class "GtkAccelGroup"
  
  puts out "no" if none is found
 -->
 <xsl:template name="get_func_id_from_name">
  <!-- FIXME: check if id exists. How? -->
  <xsl:param name="funcname" />
  <xsl:param name="class" select="'no'" />

  <xsl:variable name="class_lowercase" select="translate($class,&uppercase;,&lowercase;)"/>
  
  <xsl:variable name="classid"><xsl:call-template name="get_id_from_name">
   <xsl:with-param name="classname"><xsl:value-of select="$class"/></xsl:with-param>
  </xsl:call-template></xsl:variable>

  <!-- static class factory method -->
  <xsl:choose>
  
   <xsl:when test="contains($funcname,'::')">
    <!-- seems to be a static one: factory method (constructor) -->
    <xsl:variable name="realclassid"><xsl:call-template name="get_id_from_name">
     <xsl:with-param name="classname"><xsl:value-of select="substring-before($funcname,'::')"/></xsl:with-param>
    </xsl:call-template></xsl:variable>
    <xsl:choose>
    
     <xsl:when test="$realclassid='no'">
      <!-- static "gdk::funcname" or "atk::funcname" or such -->
      <xsl:value-of select="substring-before($funcname,'::')"/>.method.<xsl:value-of select="$funcname"/>
     </xsl:when>
     
     <xsl:otherwise>
      <!-- constructor of class like "GtkButton::new_from_stock" -->
      <xsl:value-of select="$realclassid"/><xsl:text>.constructor.</xsl:text><xsl:value-of select="substring-after($funcname,'::')"/>
     </xsl:otherwise>
    
    </xsl:choose>
   </xsl:when>
   
   <xsl:otherwise>
    <!-- object function OR static gtk/gdk/atk/pango function -->
    <xsl:variable name="staticmethodid" select="/descendant::refentry/method[funcsynopsis/funcprototype/funcdef/function=$funcname]/@id"/>
    <xsl:choose>
     <xsl:when test="$staticmethodid!=''">
      <!-- static gtk:: or gdk:: function -->
      <xsl:value-of select="$staticmethodid"/>
     </xsl:when>
     <xsl:otherwise>
      <!-- no gdk:: or gtk:: function but normal class method -->
      <xsl:choose>
       <xsl:when test="$classid='no'">
        <!-- seems as it is the constructor of a class like "GtkButton" just as function name -->
        <xsl:variable name="realclassid"><xsl:call-template name="get_id_from_name">
         <xsl:with-param name="classname"><xsl:value-of select="$funcname"/></xsl:with-param>
         </xsl:call-template></xsl:variable>
        <xsl:value-of select="$realclassid"/><xsl:text>.constructor</xsl:text>
       </xsl:when>
       <xsl:otherwise>
        <!-- we've got a good class id -->
        <xsl:value-of select="$classid"/><xsl:text>.method.</xsl:text><xsl:value-of select="$funcname"/>
       </xsl:otherwise>
       </xsl:choose>
     </xsl:otherwise>
     
    </xsl:choose>
   </xsl:otherwise>
  
  </xsl:choose>
  
 </xsl:template><!--xsl:template name="get_func_id_from_name"-->

 
 
 <!--
 returns the id for a given property of a given class
 e.g. "gtk.gtkadjustment.property.value" for property "value" of class "GtkAdjustment"
 
 returns "no" if none is found
 -->
 <xsl:template name="get_prop_id_from_name">
  <xsl:param name="propname" />
  <xsl:param name="class" select="no" />

  <xsl:variable name="classid"><xsl:call-template name="get_id_from_name">
   <xsl:with-param name="classname"><xsl:value-of select="$class"/></xsl:with-param>
  </xsl:call-template></xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$classid='no'">
    <!-- class couldn't be found... strange -->
    <xsl:message>ERROR: classid for property <xsl:value-of select="$propname"/> not found</xsl:message>
    <xsl:text>no</xsl:text>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$classid"/><xsl:text>.property.</xsl:text><xsl:value-of select="$propname"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template><!--xsl:template name="get_prop_id_from_name"-->

 
 
 <!-- 
 returns the id for a given signal name
 -->
 <xsl:template name="get_sig_id_from_name">
  <xsl:param name="signame" />
  <xsl:param name="class" select="no" />
  
  <xsl:variable name="classid"><xsl:call-template name="get_id_from_name">
   <xsl:with-param name="classname"><xsl:value-of select="$class"/></xsl:with-param>
  </xsl:call-template></xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$classid='no'">
    <!-- class couldn't be found... strange -->
    <xsl:message>ERROR: classid for signal <xsl:value-of select="$signame"/> not found</xsl:message>
    <xsl:text>no</xsl:text>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$classid"/><xsl:text>.signal.</xsl:text><xsl:value-of select="$signame"/>
   </xsl:otherwise>
  </xsl:choose>

 </xsl:template><!--xsl:template name="get_sig_id_from_name"-->

</xsl:stylesheet> 