<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0" encoding="utf-8">
<!--
   Stylesheets for index pages (class, method, signal, field and property index)
   Christian Weiske <cweiske@php.net>

   FIXME: group by first letter
-->
 <xsl:template match="index">
  <h2>
   <xsl:copy-of select="title/node()" />
  </h2>

  <xsl:variable name="type" select="type"/>
  <xsl:choose>
   <xsl:when test="$type='syntax'"><xsl:call-template name="index.syntax"/></xsl:when>
   <xsl:when test="$type='classes'"><xsl:call-template name="index.classes"/></xsl:when>
   <xsl:when test="$type='methods'"><xsl:call-template name="index.methods"/></xsl:when>
   <xsl:when test="$type='fields'"><xsl:call-template name="index.properties"/></xsl:when>
   <xsl:when test="$type='signals'"><xsl:call-template name="index.signals"/></xsl:when>
   <xsl:when test="$type='enums'"><xsl:call-template name="index.enums"/></xsl:when>
   <xsl:otherwise>
    <xsl:message>Index type <xsl:value-of select="$type"/> not implemented.</xsl:message>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <!-- class index -->
 <xsl:template name="index.classes">
  <xsl:for-each select="/set/book/classset/classentry/classmeta/classtitle">
   <xsl:sort select="."/>
   <xsl:call-template name="index_link">
    <xsl:with-param name="title"><xsl:value-of select="."/></xsl:with-param>
    <xsl:with-param name="id"><xsl:value-of select="ancestor::classentry/@id"/></xsl:with-param>
   </xsl:call-template>
  </xsl:for-each>
 </xsl:template>

 <!-- method index -->
 <xsl:template name="index.methods">
  <xsl:for-each select="(/set/book/classset/classentry/methods/method|/set/book/classset/refentry/method)">
   <xsl:sort select="funcsynopsis/funcprototype/funcdef/function" />
   <xsl:variable name="classname">
    <xsl:value-of select="(ancestor::classentry/classmeta/classtitle|ancestor::refentry/refmeta/refentrytitle)" />
   </xsl:variable>
   <xsl:call-template name="index_link">
    <xsl:with-param name="title"><xsl:value-of select="funcsynopsis/funcprototype/funcdef/function"/>() - <xsl:value-of select="$classname"/></xsl:with-param>
    <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
   </xsl:call-template>
  </xsl:for-each>
 </xsl:template>

 <!-- property index -->
 <xsl:template name="index.properties">
  <xsl:for-each select="(/set/book/classset/classentry/properties/prop|/set/book/classset/classentry/styleproperties/prop|/set/book/classset/classentry/fields/field)">
   <xsl:sort select="(propname|fieldname)"/>
   <xsl:variable name="classname">
    <xsl:value-of select="ancestor::classentry/classmeta/classtitle" />
   </xsl:variable>
   <xsl:call-template name="index_link">
    <xsl:with-param name="title"><xsl:value-of select="(propname|fieldname)"/> - <xsl:value-of select="$classname"/></xsl:with-param>
    <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
   </xsl:call-template>
  </xsl:for-each>
 </xsl:template>

 <!-- signal index -->
 <xsl:template name="index.signals">
  <xsl:for-each select="/set/book/classset/classentry/signals/signal">
   <xsl:sort select="signalname"/>
   <xsl:variable name="classname">
    <xsl:value-of select="ancestor::classentry/classmeta/classtitle" />
   </xsl:variable>
   <xsl:call-template name="index_link">
    <xsl:with-param name="title"><xsl:value-of select="signalname"/> - <xsl:value-of select="$classname"/></xsl:with-param>
    <xsl:with-param name="id"><xsl:value-of select="@id"/></xsl:with-param>
   </xsl:call-template>
  </xsl:for-each>
 </xsl:template>

 <!-- enum index -->
 <xsl:template name="index.enums">
  <xsl:for-each select="/set/book/enumset/enums/enum/enumoption">
   <xsl:sort select="optionname"/>
   <xsl:variable name="enumname">
    <xsl:value-of select="ancestor::enum/enumname" />
   </xsl:variable>
   <xsl:call-template name="index_link">
    <xsl:with-param name="title"><xsl:value-of select="optionname"/> - <xsl:value-of select="$enumname"/></xsl:with-param>
    <xsl:with-param name="id"><xsl:value-of select="ancestor::enum/@id"/></xsl:with-param>
   </xsl:call-template>
  </xsl:for-each>
 </xsl:template>

 <!--
  The syntax index is a huge list with links to
  classes, interfaces, functions, signals, fields, styleproperties and properties, enums and flags
  in alphabetical order
 -->
 <xsl:template name="index.syntax">
  <xsl:for-each select="/set/book/classset/classentry
                        |/set/book/classset/classentry/constructors/constructor
                        |/set/book/classset/classentry/methods/method
                        |/set/book/classset/classentry/properties/prop
                        |/set/book/classset/classentry/styleproperties/prop
                        |/set/book/classset/classentry/fields/field
                        |/set/book/classset/classentry/signals/signal">
                        |/set/book/enumset/enums/enum/enumoption">
   <!-- Sort by the title thingies -->

   <xsl:sort select="classmeta/classtitle
                    |funcsynopsis/funcprototype/funcdef/function
                    |fieldname
                    |propname
                    |signalname
                    |optionname"
        order="ascending" data-type="text"/>

   <!-- FIXME: Group by first letter
     Seems we need xslt2 with for-each-group for that...
    -->

   <xsl:variable name="type"><xsl:value-of select="name(.)"/></xsl:variable>

   <!-- get the title for the entry -->
   <xsl:variable name="title">
    <xsl:choose>
     <xsl:when test="$type='classentry'">
	  <xsl:value-of select="classmeta/classtitle"/> (class)
	 </xsl:when>
     <xsl:when test="$type='constructor'">
	  <xsl:value-of select="funcsynopsis/funcprototype/funcdef/function"/>() (constructor)
	 </xsl:when>
     <xsl:when test="$type='method'">
	  <xsl:value-of select="funcsynopsis/funcprototype/funcdef/function"/>() (<xsl:value-of select="ancestor::classentry/classmeta/classtitle"/>)
	 </xsl:when>
     <xsl:when test="$type='field'">
	  <xsl:value-of select="fieldname"/> (field, <xsl:value-of select="ancestor::classentry/classmeta/classtitle"/>)
	 </xsl:when>
     <xsl:when test="$type='prop'">
	  <xsl:value-of select="propname"/> (prop, <xsl:value-of select="ancestor::classentry/classmeta/classtitle"/>)
	 </xsl:when>
     <xsl:when test="$type='signal'">
	  <xsl:value-of select="signalname"/> (signal, <xsl:value-of select="ancestor::classentry/classmeta/classtitle"/>)
	 </xsl:when>
     <xsl:when test="$type='enumoption'">
	  <xsl:value-of select="optionname"/> (enumoption, <xsl:value-of select="ancestor::enum/enumname"/>)
	 </xsl:when>
     <xsl:otherwise>
      Unknown type <xsl:value-of select="$type"/> in index.xsl#index.syntax
      <xsl:message>Unknown type <xsl:value-of select="$type"/> in index.xsl#index.syntax</xsl:message>
     </xsl:otherwise>
    </xsl:choose>
   </xsl:variable>

   <xsl:variable name="link">
    <xsl:call-template name="href.target">
     <xsl:with-param name="object" select="id(@id)"/>
    </xsl:call-template>
   </xsl:variable>
   <a>
    <xsl:attribute name="href">
     <xsl:value-of select="$link" />
    </xsl:attribute>
    <xsl:value-of select="$title" />
   </a><br/>
  </xsl:for-each>
 </xsl:template>

 <!-- creates a link from a title and an id -->
 <xsl:template name="index_link">
  <xsl:param name="title"/>
  <xsl:param name="id"/>

   <xsl:variable name="link">
    <xsl:call-template name="href.target">
     <xsl:with-param name="object" select="id($id)"/>
    </xsl:call-template>
   </xsl:variable>
   <a>
    <xsl:attribute name="href">
     <xsl:value-of select="$link" />
    </xsl:attribute>
    <xsl:value-of select="$title" />
   </a><br/>
 </xsl:template>

</xsl:stylesheet>