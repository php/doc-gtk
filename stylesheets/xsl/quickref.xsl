<?xml version='1.0'?>
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	version="1.0">

 <xsl:param name="output.mode" select="'html'"/>
	
 <xsl:include href="common/util.xsl"/> 
 <xsl:include href="locale.xsl"/>


 
 <xsl:template match="/">
  <HTML>
   <HEAD>
    <TITLE>
     <xsl:call-template name="get.locale.text">
      <xsl:with-param name="text">
       <xsl:text>quickref.title</xsl:text>
      </xsl:with-param>
     </xsl:call-template>
    </TITLE>
   </HEAD>
   <BODY>
    <xsl:apply-templates select="//classset"/>
   </BODY>
  </HTML>
 </xsl:template>

 <xsl:template match="classset">
  <P class="classset.title">
   <xsl:call-template name="get.locale.text">
    <xsl:with-param name="text">
     <xsl:value-of select="@id"/>
     <xsl:text>.classset</xsl:text>	   
    </xsl:with-param>
   </xsl:call-template>
  </P>
  <b>
  <xsl:call-template name="get.locale.text">
   <xsl:with-param name="text">
    <xsl:text>classes</xsl:text>	   
   </xsl:with-param>
  </xsl:call-template>
  </b>
  <xsl:call-template name="new.line"/>
  <xsl:apply-templates select="./classentry"/>
  <xsl:call-template name="new.line"/>
  <b>
  <xsl:call-template name="get.locale.text">
   <xsl:with-param name="text">
    <xsl:text>enum</xsl:text>
   </xsl:with-param>
  </xsl:call-template>
  </b>
  <xsl:call-template name="new.line"/>
  <xsl:apply-templates select="./enum"/>
 </xsl:template>

 <xsl:template match="classentry">
  <xsl:call-template name="get.class.title">
   <xsl:with-param name="classentry" select="."/>
  </xsl:call-template>
  <br />
 </xsl:template>

 <xsl:template match="enum">
  <xsl:call-template name="get.enum.title">
   <xsl:with-param name="enum" select="."/>
  </xsl:call-template>
  <br />
 </xsl:template>

</xsl:stylesheet>
