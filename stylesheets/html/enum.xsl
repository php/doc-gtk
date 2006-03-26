<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

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
      <span dir="ltr">
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
     </span>
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

 <xsl:template match="enum[@rtl='0']">
  <a>
   <xsl:attribute name="class">
    <xsl:value-of select="name(.)" />
   </xsl:attribute>
   <xsl:attribute name="name">
    <xsl:value-of select="@id"/>
   </xsl:attribute>
  </a>
  <h1 class="title">
   <xsl:apply-templates select="./enumname" />
  </h1>
<!-- THIS IS (ONE OF TWO PLACES) WHERE WE DISPLAY FLAG/ENUM TYPES, IF WE SO CHOOSE
  <p>
   <span dir="ltr">
    <h3>
     <xsl:choose>
      <xsl:when test="@type='flags'">
       <xsl:text>Flags</xsl:text>
      </xsl:when>
      <xsl:otherwise>
       <xsl:text>Enums</xsl:text>
      </xsl:otherwise>
     </xsl:choose>
    </h3>
   </span>
  </p>
-->
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
  <table width="100%" cellpadding="2" cellspacing="1">
   <tr>
    <td width="7%">
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">value</xsl:with-param>
      </xsl:call-template>
     </h3>
    </td>
    <td width="40%">
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">symbolicname</xsl:with-param>
      </xsl:call-template>
     </h3>
    </td>
    <td width="52%">
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">description</xsl:with-param>
      </xsl:call-template>
     </h3>
    </td>
   </tr>
   <xsl:apply-templates select="./enumoption" />
  </table>
 </xsl:template>


 <xsl:template match="enum[@rtl='1']">
  <div dir="rtl">
  <a>
   <xsl:attribute name="class">
    <xsl:value-of select="name(.)" />
   </xsl:attribute>
   <xsl:attribute name="name">
    <xsl:value-of select="@id"/>
   </xsl:attribute>
  </a>
  <h1 class="title">
   <xsl:apply-templates select="./enumname" />
  </h1>
<!-- THIS IS (ONE OF TWO PLACES) WHERE WE DISPLAY FLAG/ENUM TYPES, IF WE SO CHOOSE
  <p>
   <h3>
    <xsl:choose>
     <xsl:when test="@type='flags'">
      <xsl:text>Flags</xsl:text>
     </xsl:when>
     <xsl:otherwise>
      <xsl:text>Enums</xsl:text>
     </xsl:otherwise>
    </xsl:choose>
   </h3>
  </p>
-->
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
  <table width="100%" cellpadding="2" cellspacing="1">
   <tr>
    <td width="7%">
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">value</xsl:with-param>
      </xsl:call-template>
     </h3>
    </td>
    <td width="40%">
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">symbolicname</xsl:with-param>
      </xsl:call-template>
     </h3>
    </td>
    <td width="52%">
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">description</xsl:with-param>
      </xsl:call-template>
     </h3>
    </td>
   </tr>
   <xsl:apply-templates select="./enumoption" />
  </table>
 </div>
 </xsl:template>

 <xsl:template match="enumoption">
  <tr valign="top">
   <td>
    <xsl:call-template name="spaceholder" />
    <xsl:choose>
     <xsl:when test="./value">
      <!-- we've got an explicitly defined value here, so use it -->
      <xsl:if test="./value >= 0">
       <xsl:call-template name="spaceholder" />
      </xsl:if>
      <xsl:value-of select="./value" />
     </xsl:when>
     <xsl:otherwise> 
      <!-- automatic numbering -->
      <xsl:choose>
       <xsl:when test="../enumname = 'GdkEventType'">
        <xsl:choose>
         <xsl:when test="./optionname = 'Gdk::NOTHING'">
          <xsl:text>-1</xsl:text>
         </xsl:when>
         <xsl:otherwise>
          <xsl:call-template name="spaceholder" />
          <xsl:number value="position()-2" format="1" />
         </xsl:otherwise>
        </xsl:choose>
       </xsl:when>
       <xsl:otherwise>
        <xsl:call-template name="spaceholder" />
        <xsl:number value="position()-1" format="1" />
       </xsl:otherwise>
      </xsl:choose>
     </xsl:otherwise>
    </xsl:choose>
   </td>
   <td>
    <xsl:apply-templates select="./optionname" />
   </td>
   <td>
    <xsl:apply-templates select="./shortdesc" />
   </td>
  </tr>
 </xsl:template>

 <xsl:template match="optionname">
  <!-- we _might_ need to link to specific enum values, so let's allow for it -->
  <xsl:choose>
   <xsl:when test="@enum!=''">
    <span dir="ltr">
     <a>
      <xsl:attribute name="href">
       <xsl:call-template name="gen.enumname.url">
        <xsl:with-param name="enumname">
         <xsl:value-of select="@enum"/>
        </xsl:with-param>
       </xsl:call-template>
      </xsl:attribute>
      <xsl:apply-templates />
     </a>
    </span>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
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
