<?xml version='1.0' ?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY step "&#160;&#160;&#160;&#160;&#160;&#160;">
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<xsl:template name="generate_hierarchy"/>

<xsl:template name="get_parent_class">
 <xsl:param name="classname"/>

 <xsl:choose>
  <xsl:when test="$classname!=''">
   <xsl:variable name="classid">
    <xsl:call-template name="get_id_from_name">
     <xsl:with-param name="classname">
      <xsl:value-of select="$classname" />
     </xsl:with-param>
    </xsl:call-template>
   </xsl:variable>
    <xsl:variable name="classentry" select="id($classid)"/>
    <xsl:value-of select="$classentry/classmeta/classparent" />
  </xsl:when>
  <xsl:otherwise />
 </xsl:choose>
</xsl:template>

<xsl:template name="current-depth">
 <xsl:param name="classname"/>

 <xsl:choose>
  <xsl:when test="$classname!=''">
   <xsl:variable name="preceeding-depth">
    <xsl:call-template name="current-depth">
     <xsl:with-param name="classname">
      <xsl:call-template name="get_parent_class">
       <xsl:with-param name="classname" select="$classname"/>
      </xsl:call-template>
     </xsl:with-param>
    </xsl:call-template>
   </xsl:variable>
   <xsl:value-of select="$preceeding-depth+1"/>
  </xsl:when>
  <xsl:otherwise>
   <xsl:value-of select="0"/>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<!--
Makes the indent for the class hierarchy
 depending on the depth
-->
<xsl:template name="hierarchy.indent">
 <xsl:param name="depth" />
 <xsl:choose>
  <xsl:when test="$depth=0">
   <xsl:text></xsl:text>
  </xsl:when>
  <xsl:when test="$depth=1">
   <xsl:text disable-output-escaping="yes">
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=2">
   <xsl:text disable-output-escaping="yes">
`--
   </xsl:text>
  </xsl:when>
  <xsl:otherwise>
   <xsl:text disable-output-escaping="yes">
     &step;
   </xsl:text>
   <xsl:call-template name="hierarchy.indent">
    <xsl:with-param name="depth" select="$depth - 1" />
   </xsl:call-template>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template name="get_class_hierarchy">
 <xsl:param name="classname" />

 <xsl:variable name="depth">
  <xsl:call-template name="current-depth">
   <xsl:with-param name="classname" select="$classname" />
  </xsl:call-template>
 </xsl:variable>

 <xsl:variable name="id">
  <xsl:call-template name="get_id_from_name">
   <xsl:with-param name="classname">
    <xsl:value-of select="$classname"/>
   </xsl:with-param>
  </xsl:call-template>
 </xsl:variable>

 <xsl:if test="$depth>0">
  <xsl:call-template name="get_class_hierarchy">
   <xsl:with-param name="classname">
    <xsl:call-template name="get_parent_class">
     <xsl:with-param name="classname" select="$classname"/>
    </xsl:call-template>
   </xsl:with-param>
  </xsl:call-template>
 </xsl:if>

 <xsl:variable name="indent">
  <xsl:call-template name="hierarchy.indent">
   <xsl:with-param name="depth" select="$depth" />
  </xsl:call-template>
 </xsl:variable>
 
 <xsl:choose>
  <xsl:when test="$id!='no'">
   <xsl:variable name="link">
    <xsl:call-template name="href.target">
     <xsl:with-param name="object" select="id($id)"/>
    </xsl:call-template>
   </xsl:variable>
   <xsl:value-of select="$indent"/>
   <span dir="ltr">
   <a>
    <xsl:attribute name="href">
     <xsl:value-of select="$link" />
    </xsl:attribute>
    <xsl:value-of select="$classname" />
   </a>
   </span>
   <br/>
  </xsl:when>
  <xsl:otherwise>
   <!-- first call to this function has always empty classname -->
   <xsl:if test="$classname != ''">
    <xsl:value-of select="$indent"/>
    <xsl:value-of select="$classname" />
    <br/>
   </xsl:if>
  </xsl:otherwise>
 </xsl:choose>
 
</xsl:template>

<xsl:template name="get_direct_subclasses">
 <xsl:param name="classname" />
 
 <xsl:if test="count(/set/book/classset/classentry[classmeta/classparent=$classname])=0">
<!--  <xsl:call-template name="gentext">
   <xsl:with-param name="key">nosubclasses</xsl:with-param>
  </xsl:call-template>-->
  <xsl:text>no</xsl:text>  
 </xsl:if>
 <xsl:for-each select="/set/book/classset/classentry[classmeta/classparent=$classname]">
  <xsl:variable name="link">
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="id(./@id)"/>
   </xsl:call-template>
  </xsl:variable>
  <span dir="ltr">
  <a>
   <xsl:attribute name="href">
    <xsl:value-of select="$link" />
   </xsl:attribute>
   <xsl:value-of select="classmeta/classtitle" />
  </a>
  </span>
  <xsl:if test="position()!=last()">
   <xsl:text>, </xsl:text> 
  </xsl:if>
 </xsl:for-each> 
</xsl:template>

<!--
 creates a class tree beginning from
 one top class with all its subclasses
-->
<xsl:template name="classtree_display">
 <xsl:param name="classname"/>
 <xsl:param name="indent"/>

 <!-- display the current class -->
 <xsl:variable name="classid"><xsl:call-template name="get_id_from_name">
  <xsl:with-param name="classname" select="$classname"/>
 </xsl:call-template></xsl:variable>
 
 <xsl:if test="local-name(.) != 'classtree'">
  <xsl:value-of select="$indent"/>
  <xsl:text>+- </xsl:text>
 </xsl:if>
 
 <span dir="ltr">
  <xsl:choose>
   <xsl:when test="$classid='no'">
    <!-- we have no id for this class, so just display the name without a link -->
    <xsl:value-of select="$classname" />
   </xsl:when>
   <xsl:otherwise>
    <!-- we've got an id, so we can link the class -->
    <xsl:variable name="link">
     <xsl:call-template name="href.target">
      <xsl:with-param name="object" select="id($classid)"/>
     </xsl:call-template>
    </xsl:variable>
    <a>
     <xsl:attribute name="href">
      <xsl:value-of select="$link" />
     </xsl:attribute>
     <xsl:value-of select="$classname" />
    </a>
   </xsl:otherwise>
  </xsl:choose>
 </span>
 <br/>

 <!-- display all the other classes below the current one -->
 <xsl:variable name="newindent">
  <xsl:value-of select="$indent"/>
  <xsl:choose>
   <xsl:when test="position() = last()">
    <xsl:text>   </xsl:text>
   </xsl:when>
   <xsl:when test="local-name(.) = 'classtree'">
    <!-- don't indent when we're in the top object -->
   </xsl:when>
   <xsl:otherwise>
    <xsl:text>|  </xsl:text>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:variable>
 
 <xsl:for-each select="/set/book/classset/classentry[classmeta/classparent=$classname]">
  <xsl:call-template name="classtree_display">
   <xsl:with-param name="classname">
    <xsl:value-of select="classmeta/classtitle" />
   </xsl:with-param>
   <xsl:with-param name="indent">
    <xsl:value-of select="$newindent"/>
   </xsl:with-param>
  </xsl:call-template>
 </xsl:for-each>

</xsl:template>

<!--
 Lists all implemented interfaces of the current classset
-->
 <xsl:template name="implementedinterfaces">
  <xsl:if test="./classmeta/implements">
    <h3>
     <xsl:call-template name="gentext">
      <xsl:with-param name="key">implementedinterfaces</xsl:with-param>
     </xsl:call-template>
    </h3>
    <blockquote>
     <div class="literallayout">
    <xsl:for-each select="./classmeta/implements">
     <xsl:variable name="id">
      <xsl:call-template name="get_id_from_name">
       <xsl:with-param name="classname" select="."/>
      </xsl:call-template>
     </xsl:variable>
     <xsl:variable name="link">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="id($id)"/>
      </xsl:call-template>
     </xsl:variable>
     <span dir="ltr">
      <a>
       <xsl:attribute name="href">
        <xsl:value-of select="$link" />
       </xsl:attribute>
       <xsl:value-of select="." />
      </a>
     </span>
     <xsl:if test="position()!=last()">
      <xsl:text>, </xsl:text>
     </xsl:if>
    </xsl:for-each>
     </div>
    </blockquote>
  </xsl:if>
 </xsl:template>

<!--
 Lists all classes which implement this interface - if it's an interface
-->
 <xsl:template name="implementedby">
  <xsl:if test="@type='interface'">
    <h3>
     <xsl:call-template name="gentext">
      <xsl:with-param name="key">implementedby</xsl:with-param>
     </xsl:call-template>
    </h3>
    <blockquote>
     <div class="literallayout">
    <xsl:variable name="classname"><xsl:value-of select="classmeta/classtitle"/></xsl:variable>
    <xsl:for-each select="/set/book/classset/classentry[classmeta/implements=$classname]">
     <xsl:variable name="id">
      <xsl:call-template name="get_id_from_name">
       <xsl:with-param name="classname" select="classmeta/classtitle"/>
      </xsl:call-template>
     </xsl:variable>
     <xsl:variable name="link">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="id($id)"/>
      </xsl:call-template>
     </xsl:variable>
     <span dir="ltr">
      <a>
       <xsl:attribute name="href">
        <xsl:value-of select="$link" />
       </xsl:attribute>
       <xsl:value-of select="classmeta/classtitle" />
      </a>
     </span>
     <xsl:if test="position()!=last()">
      <xsl:text>, </xsl:text>
     </xsl:if>
    </xsl:for-each>
     </div>
    </blockquote>
  </xsl:if>
 </xsl:template>

</xsl:stylesheet>