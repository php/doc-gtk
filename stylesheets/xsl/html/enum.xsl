<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

 <xsl:template match="enumname">
  <xsl:param name="with-link" select="0" />
  <xsl:choose>
   <xsl:when test="name(parent::node())='enum' and $with-link='0'">
    <xsl:apply-templates />
   </xsl:when>
   <xsl:otherwise>
    <xsl:variable name="knownenum">
     <xsl:call-template name="is.known.enum">
      <xsl:with-param name="enumname">
       <xsl:value-of select="."/>
      </xsl:with-param>
     </xsl:call-template>
    </xsl:variable> 

    <xsl:choose>
     <xsl:when test="$knownenum='1'">
      <a>
       <xsl:attribute name="href">
        <xsl:call-template name="gen.enumname.url">
         <xsl:with-param name="enumname">
          <xsl:value-of select="."/>
         </xsl:with-param>
        </xsl:call-template>
       </xsl:attribute>
       <xsl:apply-templates />
      </a>
     </xsl:when>
     <xsl:otherwise>
      <b>
       <xsl:apply-templates />
      </b>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:otherwise>

  </xsl:choose>
 </xsl:template>

 <xsl:template match="enum">
  <table cellpadding="2" cellspacing="1">
   <tr>
    <td colspan="2">
     <h1>
      <xsl:attribute name="class">
       <xsl:value-of select="name(.)" />
      </xsl:attribute>
      <xsl:apply-templates select="./enumname" />
     </h1>
    </td>
   </tr>
    <xsl:apply-templates select="./enumoption" />
  </table>
 </xsl:template>

 <xsl:template match="enumoption">
  <tr valign="top">
   <td>
    <xsl:apply-templates select="./optionname" />
   </td>
   <td>
    <xsl:apply-templates select="./shortdesc" />
   </td>
  </tr>
 </xsl:template>

 <xsl:template match="optionname">
  <xsl:apply-templates />
 </xsl:template>

<!-- ================================================================ -->
 <xsl:template name="gen.enumname.url">
  <xsl:param name="enumname" />

  <xsl:variable name="enumnode" select="//enum[enumname[self::node()=$enumname]]" />

  <xsl:call-template name="href.target">
   <xsl:with-param name="object" select="$enumnode"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template name="is.known.enum">
  <xsl:value-of select="1"/>
 </xsl:template>

</xsl:stylesheet>