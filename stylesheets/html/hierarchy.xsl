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

 <xsl:variable name="bad.hack">
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
  <xsl:when test="$depth=3">
   <xsl:text disable-output-escaping="yes">
&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=4">
   <xsl:text disable-output-escaping="yes">
&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=5">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=6">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=7">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=8">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=9">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=10">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=11">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;&step;&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:when test="$depth=12">
   <xsl:text disable-output-escaping="yes">
&step;&step;&step;&step;&step;&step;&step;&step;&step;&step;`--
   </xsl:text>
  </xsl:when>
  <xsl:otherwise>
   <xsl:message>
    <xsl:text>
     You need to modify hierarchy.xsl to allow for a depth greater than 12
    </xsl:text>
   </xsl:message>
  </xsl:otherwise>
 </xsl:choose>
 </xsl:variable>

 <xsl:choose>
  <xsl:when test="$id!='no'">
   <xsl:variable name="link">
    <xsl:call-template name="href.target">
     <xsl:with-param name="object" select="id($id)"/>
    </xsl:call-template>
   </xsl:variable>
   <xsl:value-of select="$bad.hack"/>
   <a>
    <xsl:attribute name="href">
     <xsl:value-of select="$link" />
    </xsl:attribute>
    <xsl:value-of select="$classname" />
   </a>
   <xsl:call-template name="output.br" />
  </xsl:when>
  <xsl:otherwise>
   <xsl:value-of select="$bad.hack"/>
   <xsl:value-of select="$classname" />
  </xsl:otherwise>
 </xsl:choose>
 
</xsl:template>

</xsl:stylesheet>