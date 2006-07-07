<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<!--========================================================================-->
 <xsl:template match="classset">
  <xsl:variable name="id">
   <xsl:call-template name="object.id" />
  </xsl:variable>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
    <div class="{name(.)}" id="{$id}">
     <div dir="rtl">
     <xsl:apply-templates select="./title"/>
     <xsl:apply-templates select="./partintro"/>
     <xsl:apply-templates select="./classtree" />
     <xsl:call-template name="component.toc"/>
     </div>
     <xsl:apply-templates select="./classentry|./refentry"/>
    </div>
   </xsl:when>
   <xsl:otherwise>
    <div class="{name(.)}" id="{$id}">
     <xsl:apply-templates select="./title"/>
     <xsl:apply-templates select="./partintro"/>
     <xsl:apply-templates select="./classtree" />
     <xsl:call-template name="component.toc"/>
     <xsl:apply-templates select="./classentry|./refentry"/>
    </div>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="enumset">
  <xsl:variable name="id">
   <xsl:call-template name="object.id" />
  </xsl:variable>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
    <div class="{name(.)}" id="{$id}">
     <div dir="rtl">
      <xsl:apply-templates select="./title"/>
      <xsl:apply-templates select="./partintro"/>
      <xsl:call-template name="component.toc"/>
     </div>
     <xsl:apply-templates select="./enums/enum"/>
    </div>
   </xsl:when>
   <xsl:otherwise>
    <div class="{name(.)}" id="{$id}">
     <xsl:apply-templates select="./title"/>
     <xsl:apply-templates select="./partintro"/>
     <xsl:call-template name="component.toc"/>
     <xsl:apply-templates select="./enums/enum"/>
    </div>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="title">
  <h1>
   <xsl:apply-templates />
  </h1>
 </xsl:template>
 
 <xsl:template match="classtree">
  <h2>
   <xsl:copy-of select="title/node()" />  
  </h2>
  <pre class="classtree">
   <xsl:call-template name="classtree_display">
    <xsl:with-param name="classname"><xsl:value-of select="topclass" /></xsl:with-param>
   </xsl:call-template>
  </pre>
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="classtitle">
  <span dir="ltr">
   <xsl:apply-templates />
  </span>
 </xsl:template>

 <xsl:template match="desc|shortdesc">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="fieldtype|proptype">
  <xsl:apply-templates />
 </xsl:template>

 <xsl:template match="classimage">
  <div style="float:right; border:1px solid #000;">
   <xsl:if test="@frame='no'">
    <xsl:attribute name="style">float:right;</xsl:attribute>
   </xsl:if>
   <xsl:call-template name="process.image"/>
  </div>
 </xsl:template>

 <xsl:template match="funcsynopsis|funcprototype" mode="synoptic.mode">
   <xsl:apply-templates mode="synoptic.mode"/>
 </xsl:template>

 <xsl:template match="funcsynopsis">
   <xsl:apply-templates select="funcprototype"/>
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
    <span dir="ltr">
     <a>
      <xsl:attribute name="href">
       <xsl:value-of select="$link" />
      </xsl:attribute>
      <xsl:value-of select="." />
     </a>
    </span>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="fieldname|propname">
  <xsl:variable name="class" select="@class"/>

  <xsl:choose>
   <xsl:when test="not($class) or $class=''">
    <!-- empty class... try to find it -->
    <xsl:apply-templates select="." mode="synoptic.mode"/>
   </xsl:when>

   <xsl:otherwise>
    <!-- class given, all ok -->
    <xsl:call-template name="prop.link">
     <xsl:with-param name="prop" select="."/>
     <xsl:with-param name="class" select="$class"/>
    </xsl:call-template>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="fieldname|propname" mode="synoptic.mode">
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
   <xsl:choose>
    <xsl:when test="name(.)='fieldname'">
     <xsl:call-template name="get_field_id_from_name">
      <xsl:with-param name="fieldname" select="$prop"/>
      <xsl:with-param name="class" select="$class"/>
     </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
     <xsl:call-template name="get_prop_id_from_name">
      <xsl:with-param name="propname" select="$prop"/>
      <xsl:with-param name="class" select="$class"/>
     </xsl:call-template>
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
    <span dir="ltr">
     <a>
      <xsl:attribute name="href">
       <xsl:value-of select="$link" />
      </xsl:attribute>
      <xsl:value-of select="$prop" />
    </a>
    </span>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
<!--========================================================================-->
 <xsl:template match="function|constructor|cbfunction">
  <xsl:call-template name="func.proto">
   <xsl:with-param name="node" select="."/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template match="function" mode="synoptic.mode">
  <xsl:call-template name="func.proto">
   <xsl:with-param name="node" select="."/>
   <xsl:with-param name="append.bracket" select="1"/>
   <xsl:with-param name="with-link" select="1"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template name="func.proto">
  <xsl:param name="node" select="." />
  <xsl:param name="append.bracket" select="0"/>
  <xsl:param name="with-link" select="0"/>

  <xsl:variable name="class">
    <xsl:choose>
      <xsl:when test="count(ancestor::constructor)!='0' and not(@class)">
       <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
      </xsl:when>
      <xsl:when test="@class!=''">
       <xsl:value-of select="@class"/>
      </xsl:when>
      <xsl:when test="count(ancestor::refentry)!='0'">
       <xsl:value-of select="ancestor-or-self::refentry/refmeta/refentrytitle"/>
      </xsl:when>
      <xsl:otherwise>
       <xsl:value-of select="ancestor-or-self::classentry/classmeta/classtitle"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="id">
   <xsl:call-template name="get_func_id_from_name">
    <xsl:with-param name="funcname">
     <xsl:value-of select="."/>
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
    <span dir="ltr">
     <a>
      <xsl:attribute name="href">
       <xsl:value-of select="$link" />
      </xsl:attribute>
      <xsl:value-of select="$node" />
      <xsl:if test="count(ancestor::funcsynopsis)='0' or $append.bracket='1'">
       <xsl:text>()</xsl:text>
      </xsl:if>
     </a>
    </span>
    <xsl:text> </xsl:text>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!--========================================================================-->

 <xsl:template match="signalname">
  <xsl:variable name="class" select="@class"/>

  <xsl:choose>
   <xsl:when test="not($class) or $class=''">
    <!-- empty class... try to find it -->
    <xsl:apply-templates select="." mode="synoptic.mode"/>
   </xsl:when>

   <xsl:otherwise>
    <!-- class given, all ok -->
    <xsl:call-template name="signal.link">
     <xsl:with-param name="signal" select="."/>
     <xsl:with-param name="class" select="$class"/>
    </xsl:call-template>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="signalname" mode="synoptic.mode">
  <xsl:variable name="classentry" select="ancestor::classentry[1]"/>
  <xsl:variable name="classtitle" select="$classentry/classmeta/classtitle"/>

  <xsl:call-template name="signal.link">
   <xsl:with-param name="signal" select="."/>
   <xsl:with-param name="class" select="$classtitle"/>
  </xsl:call-template>
 </xsl:template>

 <xsl:template name="signal.link">
  <xsl:param name="signal" select="."/>
  <xsl:param name="class" select="@class"/>

  <xsl:variable name="id">
   <xsl:call-template name="get_sig_id_from_name">
    <xsl:with-param name="signame" select="$signal"/>
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
    <span dir="ltr">
     <xsl:text>"</xsl:text>
      <a>
       <xsl:attribute name="href">
        <xsl:value-of select="$link" />
       </xsl:attribute>
       <xsl:value-of select="." />
      </a>
     <xsl:text>"</xsl:text>
    </span>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!--========================================================================-->
<xsl:template match="classentry[@rtl='0']">
  <div class="classentry">
   <a>
     <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
    </a>
    <h2 class="title">
     <xsl:apply-templates select="./classmeta/classtitle"/>
    </h2>
    <xsl:apply-templates select="./classmeta/classimage"/>
    <p>
     <blockquote>
      <xsl:apply-templates select="./classmeta/shortdesc"/>
     </blockquote>
    </p>
    <p>
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">objecthierarchy</xsl:with-param>
      </xsl:call-template>
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

    <xsl:variable name="subclasses">
     <xsl:call-template name="get_direct_subclasses">
      <xsl:with-param name="classname">
       <xsl:value-of select="./classmeta/classtitle"/>
      </xsl:with-param>
     </xsl:call-template>
    </xsl:variable>
    <xsl:if test="$subclasses != 'no'">
     <p>
      <h3>
       <xsl:call-template name="gentext">
        <xsl:with-param name="key">directsubclasses</xsl:with-param>
       </xsl:call-template>
      </h3>
      <blockquote>
       <div class="literallayout">
        <xsl:call-template name="get_direct_subclasses">
         <xsl:with-param name="classname">
          <xsl:value-of select="./classmeta/classtitle"/>
         </xsl:with-param>
        </xsl:call-template>
       </div>
      </blockquote>
     </p>
    </xsl:if>

    <xsl:call-template name="implementedinterfaces" />
    <xsl:call-template name="implementedby" />

    <p>
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">description</xsl:with-param>
      </xsl:call-template>
     </h3>
     <xsl:if test="@type='interface'">
      <blockquote>
       <strong>
        <xsl:call-template name="gentext">
         <xsl:with-param name="key">interfacewarning</xsl:with-param>
        </xsl:call-template>
       </strong>
      </blockquote>
     </xsl:if>
     <blockquote>
      <xsl:apply-templates select="./classmeta/desc"/>
     </blockquote>
    </p>
    <p>
     <xsl:apply-templates select="./constructors" mode="synoptic.mode"/>
     <xsl:apply-templates select="./methods"  mode="synoptic.mode"/>
     <xsl:apply-templates select="./fields" mode="synoptic.mode"/>
     <xsl:apply-templates select="./properties" mode="synoptic.mode"/>
     <xsl:apply-templates select="./styleproperties" mode="synoptic.mode"/>
     <xsl:apply-templates select="./signals"  mode="synoptic.mode"/>
    </p>
   </div>
  <xsl:apply-templates select="./constructors|./methods|./fields|./properties|./styleproperties|./signals"/>
 </xsl:template>

 <xsl:template match="classentry[@rtl='1']">
  <div class="classentry" dir="rtl">
   <a>
     <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
    </a>
    <h2 class="title">
     <xsl:apply-templates select="./classmeta/classtitle"/>
    </h2>
    <p>
     <blockquote>
      <xsl:apply-templates select="./classmeta/shortdesc"/>
     </blockquote>
    </p>
    <p>
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">objecthierarchy</xsl:with-param>
      </xsl:call-template>
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
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">directsubclasses</xsl:with-param>
      </xsl:call-template>
     </h3>
     <blockquote>
      <div class="literallayout">
       <xsl:call-template name="get_direct_subclasses">
        <xsl:with-param name="classname">
         <xsl:value-of select="./classmeta/classtitle"/>
        </xsl:with-param>
       </xsl:call-template>
      </div>
     </blockquote>
    </p>

    <p>
     <h3>
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">description</xsl:with-param>
      </xsl:call-template>
     </h3>
     <blockquote>
      <xsl:apply-templates select="./classmeta/desc"/>
     </blockquote>
    </p>
    <p>
     <xsl:apply-templates select="./constructors" mode="synoptic.mode"/>
     <xsl:apply-templates select="./methods"  mode="synoptic.mode"/>
     <xsl:apply-templates select="./fields"   mode="synoptic.mode"/>
     <xsl:apply-templates select="./properties" mode="synoptic.mode"/>
     <xsl:apply-templates select="./styleproperties" mode="synoptic.mode"/>
     <xsl:apply-templates select="./signals"  mode="synoptic.mode"/>
    </p>
   </div>
  <xsl:apply-templates select="./constructors|./methods|./fields|./properties|./styleproperties|./signals"/>
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

 <xsl:template match="constructors" mode="synoptic.mode">
  <div>
   <xsl:attribute name="name">
    <xsl:value-of select="@id"/>
   </xsl:attribute>
  <h3>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">constructors</xsl:with-param>
   </xsl:call-template>
  </h3>
    <blockquote>
     <xsl:apply-templates select="./constructor" mode="synoptic.mode"/>
    </blockquote>
  </div>
 </xsl:template>

 <xsl:template match="constructor" mode="synoptic.mode">
  <xsl:if test="position() > 1">
   <br/><br/>
  </xsl:if>
  <xsl:apply-templates select="./funcsynopsis"/>
  <xsl:text disable-output-escaping="yes"> --</xsl:text>
  <xsl:apply-templates select="./shortdesc" />
 </xsl:template>

 <xsl:template match="methods" mode="synoptic.mode">
  <div>
  <h3>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">methods</xsl:with-param>
   </xsl:call-template>
  </h3>
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

 <xsl:template match="properties" mode="synoptic.mode">
  <h3>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">properties</xsl:with-param>
   </xsl:call-template>
  </h3>
  <p>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">propertiesDisclaimer</xsl:with-param>
   </xsl:call-template>
  </p>
  <blockquote>
   <xsl:apply-templates select="./prop" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="styleproperties" mode="synoptic.mode">
  <h3>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">styleproperties</xsl:with-param>
   </xsl:call-template>
  </h3>
  <p>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">stylepropertiesDisclaimer</xsl:with-param>
   </xsl:call-template>
  </p>
  <blockquote>
   <xsl:apply-templates select="./prop" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="fields" mode="synoptic.mode">
  <h3>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">fields</xsl:with-param>
   </xsl:call-template>
  </h3>
  <blockquote>
   <xsl:apply-templates select="./field" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="field|prop" mode="synoptic.mode">
  <dt>
   <xsl:apply-templates select="./fieldname|./propname" mode="synoptic.mode"/>
   <xsl:text>:</xsl:text>
  </dt>
  <dd>
  <xsl:call-template name="spaceholder"/>
   <xsl:apply-templates select="./shortdesc"/>
  </dd>
 </xsl:template>

 <xsl:template match="signals" mode="synoptic.mode">
  <h3>
   <xsl:call-template name="gentext">
    <xsl:with-param name="key">signals</xsl:with-param>
   </xsl:call-template>
  </h3>
  <blockquote>
  <xsl:apply-templates select="./signal" mode="synoptic.mode"/>
  </blockquote>
 </xsl:template>

 <xsl:template match="signal" mode="synoptic.mode">
  <dt>
   <xsl:apply-templates select="./signalname"/>
  </dt>
  <dd>
   <xsl:call-template name="spaceholder"/>
   <xsl:apply-templates select="./shortdesc"/>
  </dd>
 </xsl:template>

 <xsl:template match="constructors|methods|fields|properties|styleproperties|signals">
  <xsl:choose>
   <xsl:when test="ancestor::classentry[@rtl='1']">
    <div dir="rtl">
     <xsl:apply-templates />
    </div>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates />
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="constructor|method">
  <xsl:choose>
   <xsl:when test="ancestor::classentry[1][@rtl='1']">
    <div dir="rtl">
     <a>
      <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
     </a>
     <h2>
      <xsl:apply-templates select="." mode="title.markup"/>
     </h2>
     <xsl:apply-templates select="./funcsynopsis|./desc"/>
    </div>
   </xsl:when>
   <xsl:otherwise>
    <div>
     <a>
      <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
     </a>
     <h2>
      <xsl:apply-templates select="." mode="title.markup"/>
     </h2>
     <xsl:apply-templates select="./funcsynopsis|./desc"/>
    </div>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="field|prop">
  <div>
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h2>
   <xsl:apply-templates select="." mode="title.markup"/>
  </h2>
  <p>
  <span dir="ltr">
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
   <xsl:apply-templates select="./fieldtype|./proptype"/>
   </span>
  </p>
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
  </div>
 </xsl:template>

 <xsl:template match="signal">
  <a>
   <xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute>
  </a>
  <h2>
   <xsl:apply-templates select="." mode="title.markup"/>
  </h2>
  <p>
   <xsl:apply-templates select="./desc"/>
  </p>
  <p>
    <b>
     <xsl:call-template name="gentext">
      <xsl:with-param name="key">callback</xsl:with-param>
     </xsl:call-template>
    </b>
  </p>
  <p>
   <xsl:apply-templates select="./funcsynopsis" />
  </p>
 </xsl:template>

</xsl:stylesheet>
