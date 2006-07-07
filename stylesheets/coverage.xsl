<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
  <doccoverage>
   <xsl:for-each select="/set/book/classset">
    <classset >
    <xsl:attribute name="title"><xsl:value-of select="title"/></xsl:attribute>

    <xsl:for-each select="classentry">
     <class>
     <xsl:attribute name="title"><xsl:value-of select="classmeta/classtitle"/></xsl:attribute>
<!--
     <xsl:call-template name="checkDesc">
      <xsl:with-param name="title"><xsl:value-of select="classmeta/classtitle"/></xsl:with-param>
     </xsl:call-template>
-->
     <type title="constructors">
      <xsl:attribute name="existing">
       <xsl:value-of select="count(constructors/constructor)"/>
      </xsl:attribute>
      <xsl:attribute name="missing">
       <xsl:value-of select="count(constructors/constructor[normalize-space(desc)='' or normalize-space(shortdesc)=''])"/>
      </xsl:attribute>
     </type>

     <type title="methods">
      <xsl:attribute name="existing">
       <xsl:value-of select="count(methods/method)"/>
      </xsl:attribute>
      <xsl:attribute name="missing">
       <xsl:value-of select="count(methods/method[normalize-space(desc)='' or normalize-space(shortdesc)=''])"/>
      </xsl:attribute>
     </type>

     <type title="signals">
      <xsl:attribute name="existing">
       <xsl:value-of select="count(signals/signal)"/>
      </xsl:attribute>
      <xsl:attribute name="missing">
       <xsl:value-of select="count(signals/signal[normalize-space(desc)='' or normalize-space(shortdesc)=''])"/>
      </xsl:attribute>
     </type>

     <type title="properties">
      <xsl:attribute name="existing">
       <xsl:value-of select="count(properties/prop) + count(styleproperties/prop)"/>
      </xsl:attribute>
      <xsl:attribute name="missing">
       <xsl:value-of select="count(properties/prop[normalize-space(desc)='' or normalize-space(shortdesc)='']) + count(styleproperties/prop[normalize-space(desc)='' or normalize-space(shortdesc)=''])"/>
      </xsl:attribute>
     </type>

     <type title="fields">
      <xsl:attribute name="existing">
       <xsl:value-of select="count(fields/field)"/>
      </xsl:attribute>
      <xsl:attribute name="missing">
       <xsl:value-of select="count(fields/field[normalize-space(desc)='' or normalize-space(shortdesc)=''])"/>
      </xsl:attribute>
     </type>

     </class>
    </xsl:for-each><!-- classentry -->
    </classset>
   </xsl:for-each><!-- classet -->
  </doccoverage>
 </xsl:template>

</xsl:stylesheet>