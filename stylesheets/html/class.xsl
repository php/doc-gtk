<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<!--========================================================================-->
 <xsl:template match="classset">
  <xsl:variable name="id">
   <xsl:call-template name="object.id" />
  </xsl:variable>
  <div class="{name(.)}" id="{$id}">
    <xsl:apply-templates select="./title"/>
    <xsl:apply-templates select="./partintro"/>
    <xsl:call-template name="component.toc"/>
   <xsl:apply-templates select="./classentry|./refentry"/>
  </div>
 </xsl:template>

 <xsl:template match="enums">
   <xsl:variable name="id">
   <xsl:call-template name="object.id" />
  </xsl:variable>
  <div class="{name(.)}" id="{$id}">
   <xsl:apply-templates select="./title"/>
   <xsl:apply-templates select="./partintro"/>
   <xsl:call-template name="component.toc"/>
   <xsl:apply-templates select="./enum"/>
  </div>
 </xsl:template>

 <xsl:template match="title">
  <h1>
   <xsl:apply-templates />
  </h1>
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="classtitle">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="desc|shortdesc">
  <xsl:apply-templates />
 </xsl:template>

  <xsl:template match="proptype">
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

 <xsl:template match="propname">
  <xsl:variable name="class" select="@class"/>

  <xsl:call-template name="prop.link">
   <xsl:with-param name="prop" select="."/>
   <xsl:with-param name="class" select="$class"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template match="propname" mode="synoptic.mode">
  <xsl:variable name="classentry" select="ancestor::classentry[1]"/>
  <xsl:variable name="classtitle" select="$classentry/classmeta/classtitle"/>

  <xsl:call-template name="prop.link">
   <xsl:with-param name="prop" select="."/>
   <xsl:with-param name="class" select="$classtitle"/>
  </xsl:call-template>
 </xsl:template>
 
 <xsl:template name="prop.link">
  <xsl:param name="prop" select="."/>
  <xsl:param name="class" select="@class"/>

  <xsl:variable name="id">
   <xsl:call-template name="get_prop_id_from_name">
    <xsl:with-param name="propname">
     <xsl:value-of select="$prop"/>
    </xsl:with-param>
    <xsl:with-param name="class" select="$class"/>
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
     <xsl:value-of select="$prop" />
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
   <xsl:with-param name="with-link" select="1"/>
   <xsl:with-param name="class" select="ancestor-or-self::classentry/classmeta/classtitle"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template name="func.proto">
  <xsl:param name="append.bracket" select="0" />
  <xsl:param name="node" select="." />
  <xsl:param name="with-link" select="0"/>
  <xsl:param name="class" select="@class"/>
  
  <xsl:variable name="funcname">
   <xsl:value-of select="translate($node,'()','')"/>
  </xsl:variable>

  <xsl:variable name="id">
   <xsl:call-template name="get_func_id_from_name">
    <xsl:with-param name="funcname">
     <xsl:value-of select="$funcname"/>
    </xsl:with-param>
    <xsl:with-param name="class">
     <xsl:choose>
      <xsl:when test="$class!=''">
       <xsl:value-of select="$class"/>
      </xsl:when>
      <xsl:otherwise>
       <xsl:text>no</xsl:text>
      </xsl:otherwise>
     </xsl:choose>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$id!='no' and ((count(parent::funcdef)='0' or count(ancestor::constructor)!='0') or $with-link='1')">
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
      <xsl:choose>
       <xsl:when test="$phpweb=true()">
        <xsl:call-template name="phpweb.get_class_hierarchy">
         <xsl:with-param name="classname">
          <xsl:value-of select="./classmeta/classtitle"/>
         </xsl:with-param>
        </xsl:call-template>
       </xsl:when>
      <xsl:otherwise>
       <xsl:call-template name="get_class_hierarchy">
        <xsl:with-param name="classname">
         <xsl:value-of select="./classmeta/classtitle"/>
        </xsl:with-param>
       </xsl:call-template>
      </xsl:otherwise>
     </xsl:choose>
     </div>
    </blockquote>
    </p>
    <p>
     <h3>Description</h3>
     <blockquote>
      <xsl:apply-templates select="./classmeta/desc"/>
     </blockquote>
    </p>
    <p>
     <xsl:apply-templates select="./constructor" mode="synoptic.mode"/>
     <xsl:apply-templates select="./methods"  mode="synoptic.mode"/>
     <xsl:apply-templates select="./signals"  mode="synoptic.mode"/>
     <xsl:apply-templates select="./properties" mode="synoptic.mode"/>
    </p>
  </div>
  <xsl:apply-templates select="./constructor|./methods|./signals|./properties"/>
 </xsl:template>

 <xsl:template match="refentry">
   <div class="refentry">
    <a>
     <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
    </a>
    <h1 class="title">
     <xsl:apply-templates select="./refmeta/refentrytitle" mode="title"/>
    </h1>
    <p>
     <blockquote>
      <xsl:apply-templates select="./refmeta/shortdesc"/>
     </blockquote>
    </p>
    <p>
     <blockquote>
      <div>
       <xsl:apply-templates select="./method" mode="synoptic.mode"/>
      </div>
     </blockquote>
    </p>
  </div>
  <xsl:apply-templates select="./method"/>
 </xsl:template>

 <xsl:template match="constructor" mode="synoptic.mode">
  <div>
   <xsl:attribute name="name">
    <xsl:value-of select="@id"/>
   </xsl:attribute>
   <h3>Constructor</h3>
    <blockquote>
     <xsl:apply-templates select="./funcsynopsis"/>
     <xsl:text> &#8212;</xsl:text>
     <xsl:apply-templates select="./shortdesc" />
    </blockquote>
  </div>
 </xsl:template>

 <xsl:template match="methods" mode="synoptic.mode">
  <div>
  <h3>Methods</h3>
  <blockquote>
   <xsl:apply-templates select="./method" mode="synoptic.mode"/>
  </blockquote>
  </div>
 </xsl:template>

 <xsl:template match="method" mode="synoptic.mode">
  <dt>
   <xsl:apply-templates select="./funcsynopsis/funcprototype/funcdef/function" mode="synoptic.mode"/>
  </dt>
  <dd>
     <xsl:call-template name="spaceholder"/>
     <xsl:apply-templates select="./shortdesc" mode="synoptic.mode"/>
  </dd>
 </xsl:template>

 <xsl:template match="signals" mode="synoptic.mode">
  <h3>Signals</h3>
  <blockquote>
  <xsl:apply-templates select="./signal" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="signal" mode="synoptic.mode">
  <dt>
    <xsl:text>"</xsl:text>
   <xsl:apply-templates select="./signalname"/>
    <xsl:text>"</xsl:text>
  </dt>
  <dd>
   <xsl:call-template name="spaceholder"/>
   <xsl:apply-templates select="./shortdesc"/>
  </dd>
 </xsl:template>

 <xsl:template match="properties" mode="synoptic.mode">
  <h3>Properties</h3>
  <blockquote>
   <xsl:apply-templates select="./prop" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="prop" mode="synoptic.mode">
  <dt>
   <xsl:apply-templates select="./propname" mode="synoptic.mode"/>
   <xsl:text>:</xsl:text>
  </dt>
  <dd>
  <xsl:call-template name="spaceholder"/>
   <xsl:apply-templates select="./shortdesc"/>
  </dd>
 </xsl:template>

 <xsl:template match="funcsynopsis" mode="synoptic.mode">
   <xsl:apply-templates mode="synoptic.mode"/>
 </xsl:template>

 <xsl:template match="funcprototype" mode="synoptic.mode">
      <xsl:apply-templates mode="synoptic.mode"/>
 </xsl:template>


 <xsl:template match="methods|signals|properties">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="method|constructor">
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h1>
   <xsl:apply-templates select="." mode="title.markup"/>
  </h1>
  <xsl:apply-templates select="./funcsynopsis|./desc"/>
 </xsl:template>

 <xsl:template match="signal">
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h1>
   <xsl:apply-templates select="." mode="title.markup"/>
  </h1>
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
  <p>
   <b>
    Callback function:
   </b>
  </p>
  <p>
   <xsl:apply-templates select="./callback" />
  </p>
 </xsl:template>

 <xsl:template match="callback">
   <xsl:apply-templates select="funcprototype"/>
 </xsl:template>
 
 <xsl:template match="prop">
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h1>
   <xsl:apply-templates select="." mode="title.markup"/>
  </h1>
  <p>
   <xsl:text>Access: </xsl:text>
   <xsl:choose>
    <xsl:when test="@type='rw'">
     <xsl:text>Read Write</xsl:text>
    </xsl:when>
    <xsl:when test="@type='ro'">
     <xsl:text>Read Only</xsl:text>
    </xsl:when>
    <xsl:otherwise>
     <xsl:text>UNKNOWN</xsl:text>
    </xsl:otherwise>
   </xsl:choose>
   <br/>
   <xsl:text>Type: </xsl:text>
   <xsl:apply-templates select="./proptype"/>
  </p>
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
 </xsl:template>
 
</xsl:stylesheet>
