<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

 <xsl:template match="funcprototype">
  <p>
      <xsl:apply-templates mode="func.prototype"/>
  </p>
 </xsl:template>

 <xsl:template match="funcdef" mode="func.prototype">
  <code>
    <xsl:apply-templates/>
  </code>
 </xsl:template>

 <xsl:template match="paramdef" mode="func.prototype">
  <xsl:variable name="optional" select="count(./parameter/optional)"/>
  <xsl:variable name="paramnum">
   <xsl:number count="paramdef" format="1"/>
  </xsl:variable>
  <xsl:if test="$paramnum=1">(</xsl:if>
  <xsl:if test="$optional&gt;0">[</xsl:if>
  <xsl:choose>
   <xsl:when test="$funcsynopsis.style='ansi'">
    <xsl:apply-templates/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates/>
   </xsl:otherwise>
  </xsl:choose>
  <xsl:if test="$optional&gt;0">]</xsl:if>
  <xsl:choose>
   <xsl:when test="following-sibling::paramdef">
    <xsl:text>, </xsl:text>
   </xsl:when>
   <xsl:otherwise>
    <xsl:text>);</xsl:text> 
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="optional">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="funcprototype/paramdef"/>
 <xsl:template match="funcprototype/funcdef"/>

<xsl:template match="copyright" mode="titlepage.mode">
  <xsl:variable name="years" select="year"/>
  <xsl:variable name="holders" select="holder"/>

  <p class="{name(.)}">

    <a>
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="//legalnotice[@id='copyright']"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:call-template name="gentext.element.name"/>
    </a>
    <xsl:call-template name="gentext.space"/>
    <xsl:call-template name="dingbat">
      <xsl:with-param name="dingbat">copyright</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="gentext.space"/>
    <xsl:apply-templates select="$years" mode="titlepage.mode"/>
    <xsl:call-template name="gentext.space"/>
    <xsl:call-template name="gentext.by"/>
    <xsl:call-template name="gentext.space"/>
    <xsl:apply-templates select="$holders" mode="titlepage.mode"/>
  </p>
</xsl:template>

</xsl:stylesheet>