<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<!--========================================================================-->
 <xsl:template match="classsetmeta" />

 <xsl:template 
      match="classsettitle|classsetmeta/desc|classsetmeta/shortdesc" />

 <xsl:template match="classsettitle" mode="classsetmeta">
  <h1>
   <xsl:apply-templates />
  </h1>
 </xsl:template>

 <xsl:template match="desc" mode="classsetmeta">
  <h2>
   <xsl:text>Description</xsl:text>
  </h2>
  <xsl:apply-templates />
 </xsl:template>


 <xsl:template match="classset">
  <xsl:variable name="id">
   <xsl:call-template name="object.id" />
  </xsl:variable>
  <div class="{name(.)}" id="{$id}">
   <!-- TODO: Titlepage in here -->
   <xsl:call-template name="component.toc"/>
   <xsl:apply-templates/>
  </div>
 </xsl:template>

 <xsl:template match="classset" mode="make.part.toc">
   <xsl:call-template name="component.toc" />
 </xsl:template>

 <xsl:template match="classset|part" mode="division.number">
  <xsl:number from="book" format="I." count="classset|part"/>
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="desc|shortdesc">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="firedwhen">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="classtitle">
  <xsl:apply-templates />
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="classname">
  <xsl:variable name="classname">
   <xsl:value-of select="."/>
  </xsl:variable>

  <xsl:variable name="id">
   <xsl:call-template name="get_id_from_name">
    <xsl:with-param name="classname">
     <xsl:value-of select="$classname"/>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$id!='no'">
    <xsl:variable name="link">
     <xsl:call-template name="href.target">
      <xsl:with-param name="object" select="id($id)"/>
     </xsl:call-template>
    </xsl:variable>
    <a>
     <xsl:attribute name="href">
      <xsl:value-of select="$link" />
     </xsl:attribute>
     <xsl:value-of select="." />
    </a>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="function|constructor">
  <xsl:call-template name="func.proto">
   <xsl:with-param name="node" select="."/>
   <xsl:with-param name="append.bracket" select="0"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template match="function" mode="synoptic.mode">
  <xsl:call-template name="func.proto">
   <xsl:with-param name="node" select="."/>
   <xsl:with-param name="append.bracket" select="1"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template name="func.proto">
  <xsl:param name="append.bracket" select="0" />
  <xsl:param name="node" select="." />
  <xsl:variable name="funcname">
   <xsl:value-of select="$node"/>
  </xsl:variable>

  <xsl:variable name="id">
   <xsl:call-template name="get_func_id_from_name">
    <xsl:with-param name="funcname">
     <xsl:value-of select="$funcname"/>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$id!='no'">
    <xsl:variable name="link">
     <xsl:call-template name="href.target">
      <xsl:with-param name="object" select="id($id)"/>
     </xsl:call-template>
    </xsl:variable>
    <a>
     <xsl:attribute name="href">
      <xsl:value-of select="$link" />
     </xsl:attribute>
     <xsl:value-of select="$node" />
     <xsl:if test="$append.bracket=1">
      <xsl:text>()</xsl:text>
     </xsl:if>
    </a>
   <xsl:text> </xsl:text>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="signalname">
  <xsl:variable name="signame">
   <xsl:value-of select="."/>
  </xsl:variable>

  <xsl:variable name="id">
   <xsl:call-template name="get_sig_id_from_name">
    <xsl:with-param name="signame">
     <xsl:value-of select="$signame"/>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$id!='no'">
    <xsl:variable name="link">
     <xsl:call-template name="href.target">
      <xsl:with-param name="object" select="id($id)"/>
     </xsl:call-template>
    </xsl:variable>
    <a>
     <xsl:attribute name="href">
      <xsl:value-of select="$link" />
     </xsl:attribute>
     <xsl:value-of select="." />
    </a>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!--========================================================================-->

<xsl:attribute-set name="classset.titlepage.recto.style" />

<!--========================================================================-->

 <xsl:template match="classentry">
  <div class="classentry">
    <a>
     <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
    </a>
    <h1 class="title">
     <xsl:apply-templates select="./classmeta/classtitle"/>
    </h1>
    <p>
     <blockquote>
      <xsl:apply-templates select="./classmeta/shortdesc"/>
     </blockquote>
    </p>
    <p>
    <h3>
     Object Hierarchy
    </h3>
     <blockquote>
     <div class="literallayout">
       <xsl:call-template name="get_class_hierarchy">
        <xsl:with-param name="classname">
         <xsl:value-of select="./classmeta/classtitle"/>
        </xsl:with-param>
       </xsl:call-template>
     </div>	 
    </blockquote>
    </p>
    <p>
     <h3>Object Properties and Methods</h3>
     <blockquote>
     <xsl:apply-templates select="./constructor" mode="synoptic.mode"/>
     <xsl:apply-templates select="./methods"  mode="synoptic.mode"/>
     <xsl:apply-templates select="./attributes"  mode="synoptic.mode"/>
     <xsl:apply-templates select="./signals"  mode="synoptic.mode"/>
     </blockquote>
    </p>
    <p>
     <h3>Description</h3>
     <blockquote>
      <xsl:apply-templates select="./classmeta/desc"/>
     </blockquote>
    </p>
  </div>
  <xsl:apply-templates select="./methods|./signals|./atrributes|./constructor"/>
 </xsl:template>

 <xsl:template match="constructor" mode="synoptic.mode">
  <div>
   <xsl:attribute name="name">
    <xsl:value-of select="@id"/>
   </xsl:attribute>
   <h4>Constructor</h4>
    <blockquote>
     <xsl:apply-templates select="./funcsynopsis"/>
     <xsl:text> &#8212;</xsl:text>
     <xsl:apply-templates select="./shortdesc" />
    </blockquote>
  </div>
 </xsl:template>

 <xsl:template match="methods" mode="synoptic.mode">
  <div>
  <h4>Methods</h4>
  <blockquote>
  <xsl:apply-templates select="./method" mode="synoptic.mode"/>
  </blockquote>
  </div>
 </xsl:template>

 <xsl:template match="method" mode="synoptic.mode">
  <code><xsl:apply-templates select="./funcsynopsis/funcprototype/funcdef/function" mode="synoptic.mode"/></code>
  <xsl:text>&#8212;</xsl:text>
  <xsl:apply-templates select="./shortdesc" />
  <br />
 </xsl:template>

 <xsl:template match="attributes" mode="synoptic.mode">
  <h4>Attributes</h4>
  <blockquote>
  <xsl:apply-templates select="./attributes" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="attribute" mode="synoptic.mode">
  <xsl:apply-templates select="./shortdesc"/>
 </xsl:template>

 <xsl:template match="signals" mode="synoptic.mode">
  <h4>Signals</h4>
  <blockquote>
  <xsl:apply-templates select="./signal" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="signal" mode="synoptic.mode">
  <xsl:apply-templates select="./signalname"/>
  <xsl:text>: </xsl:text>
  <xsl:apply-templates select="./shortdesc"/>
 </xsl:template>

 <xsl:template match="funcsynopsis" mode="synoptic.mode">
  <code>
   <xsl:apply-templates mode="synoptic.mode"/>
  </code>
 </xsl:template>

 <xsl:template match="funcprototype" mode="synoptic.mode">
      <xsl:apply-templates mode="synoptic.mode"/>
   
 </xsl:template>


 <xsl:template match="methods|signals|attributes">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="method|constructor">
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h1>
   <xsl:apply-templates select="." mode="title.content"/>
  </h1>
  <xsl:apply-templates select="./funcsynopsis|./desc"/>
 </xsl:template>

 <xsl:template match="signal">
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h1>
   <xsl:apply-templates select="." mode="title.content"/>
  </h1>
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
  <p>
   <b>
    Callback function:
   </b>
  <xsl:apply-templates select="./userfunc" />
  </p>

 </xsl:template>

 <xsl:template match="userfunc">
   <xsl:apply-templates select="funcprototype"/>
 </xsl:template>

</xsl:stylesheet>
