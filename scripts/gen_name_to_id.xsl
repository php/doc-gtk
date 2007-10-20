<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0">

<xsl:output method="text"
            encoding="UTF-8"
            indent="no"/>

<xsl:template match="*" />

<xsl:template match="classentry|refentry">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="classname" >
   <xsl:choose>
    <xsl:when test="count(self::classentry)!='0'">
     <xsl:value-of select="./classmeta/classtitle"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="./refmeta/refentrytitle"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$classname='</xsl:text>
  <xsl:value-of select="$classname"/>
  <xsl:text disable-output-escaping="yes">'"&gt;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&lt;/xsl:when&gt;</xsl:text>
</xsl:template>

<xsl:template match="method|constructor">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="funcname" >
    <xsl:value-of select="./funcsynopsis/funcprototype/funcdef/function"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$funcname='</xsl:text>
  <xsl:value-of select="$funcname"/>
  <xsl:text disable-output-escaping="yes">' and $class='</xsl:text>
  <xsl:choose>
   <xsl:when test="count(ancestor::classentry)!='0'">
    <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="ancestor-or-self::refentry/refmeta/refentrytitle"/>
   </xsl:otherwise>
  </xsl:choose>
  <xsl:text disable-output-escaping="yes">'"&gt;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&lt;/xsl:when&gt;</xsl:text>
</xsl:template>

<!--
<xsl:template match="attribute">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="attrname" >
    <xsl:value-of select="./attributename"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$attrname='</xsl:text>
  <xsl:value-of select="$attrname"/>
  <xsl:text disable-output-escaping="yes">'"&gt;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&lt;/xsl:when&gt;</xsl:text>
</xsl:template>
-->

<xsl:template match="prop">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="propname" >
    <xsl:value-of select="./propname"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$propname='</xsl:text>
  <xsl:value-of select="$propname"/>
  <xsl:text disable-output-escaping="yes">' and $class='</xsl:text>
  <xsl:choose>
   <xsl:when test="count(ancestor::classentry)!='0'">
    <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="ancestor-or-self::refentry/refmeta/refentrytitle"/>
   </xsl:otherwise>
  </xsl:choose>
  <xsl:text disable-output-escaping="yes">'"&gt;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&lt;/xsl:when&gt;</xsl:text>
</xsl:template>

<xsl:template match="field">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="fieldname" >
    <xsl:value-of select="./fieldname"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$fieldname='</xsl:text>
  <xsl:value-of select="$fieldname"/>
  <xsl:text disable-output-escaping="yes">' and $class='</xsl:text>
  <xsl:choose>
   <xsl:when test="count(ancestor::classentry)!='0'">
    <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="ancestor-or-self::refentry/refmeta/refentrytitle"/>
   </xsl:otherwise>
  </xsl:choose>
  <xsl:text disable-output-escaping="yes">'"&gt;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&lt;/xsl:when&gt;</xsl:text>
</xsl:template>

<xsl:template match="signal">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="signame" >
    <xsl:value-of select="./signalname"/>
  </xsl:variable>
  <xsl:text disable-output-escaping="yes">&lt;xsl:when test="$signame='</xsl:text>
  <xsl:value-of select="$signame"/>
  <xsl:text disable-output-escaping="yes">' and $class='</xsl:text>
  <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
  <xsl:text disable-output-escaping="yes">'"&gt;&lt;xsl:text&gt;</xsl:text>
  <xsl:value-of select="$id" />
  <xsl:text disable-output-escaping="yes">&lt;/xsl:text&gt;&lt;/xsl:when&gt;</xsl:text>
</xsl:template>
 

<xsl:template match="/">
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0"&gt;

  &lt;xsl:template name="get_id_from_name"&gt;
  &lt;xsl:param name="classname" /&gt;
  &lt;xsl:choose&gt;
 </xsl:text>
 <xsl:apply-templates select=".//classentry" />
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:otherwise&gt;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;
  &lt;/xsl:otherwise&gt;
  &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;
 </xsl:text>

  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_func_id_from_name"&gt;
  &lt;xsl:param name="funcname" /&gt;
  &lt;xsl:param name="class" select="'no'" /&gt;
  &lt;xsl:choose&gt;
 </xsl:text>
 <xsl:apply-templates select=".//method|.//constructor" />
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:otherwise&gt;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;
  &lt;/xsl:otherwise&gt;
  &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;
 </xsl:text>

  <xsl:if test="count(.//prop)>0">
  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_prop_id_from_name"&gt;
  &lt;xsl:param name="propname" /&gt;
  &lt;xsl:param name="class" select="no" /&gt;
  &lt;xsl:choose&gt;
 </xsl:text>
 <xsl:apply-templates select=".//prop" />
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:otherwise&gt;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;
  &lt;/xsl:otherwise&gt;
  &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;
 </xsl:text>
 </xsl:if>

  <xsl:if test="count(.//field)>0">
  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_field_id_from_name"&gt;
  &lt;xsl:param name="fieldname" /&gt;
  &lt;xsl:param name="class" select="no" /&gt;
  &lt;xsl:choose&gt;
 </xsl:text>
 <xsl:apply-templates select=".//field" />
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:otherwise&gt;
   &lt;xsl:text&gt;no&lt;/xsl:text&gt;
  &lt;/xsl:otherwise&gt;
  &lt;/xsl:choose&gt;
  &lt;/xsl:template&gt;
 </xsl:text>
 </xsl:if>

  <xsl:text disable-output-escaping="yes">
  &lt;xsl:template name="get_sig_id_from_name"&gt;
  &lt;xsl:param name="signame" /&gt;
  &lt;xsl:param name="class" select="no" /&gt;
  </xsl:text>
   <xsl:text disable-output-escaping="yes">
    &lt;xsl:choose&gt;
   </xsl:text>
  <xsl:apply-templates select=".//signal" />
  <xsl:text disable-output-escaping="yes">
   &lt;xsl:otherwise&gt;
  </xsl:text>
 <xsl:text disable-output-escaping="yes">
  &lt;xsl:text&gt;no&lt;/xsl:text&gt;
 </xsl:text>
  <xsl:text disable-output-escaping="yes">
  &lt;/xsl:otherwise&gt;
  &lt;/xsl:choose&gt; 
 </xsl:text>
 <xsl:text>
   &lt;/xsl:template&gt;
   &lt;/xsl:stylesheet&gt;
 </xsl:text>
</xsl:template>

</xsl:stylesheet>
