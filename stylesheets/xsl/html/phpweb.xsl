<?xml version='1.0' encoding='ISO-8859-1' ?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY step "&#160;&#160;&#160;&#160;&#160;&#160;">
<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
				xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
				xmlns:lxslt="http://xml.apache.org/xslt"
		version="1.0"
                extension-element-prefixes="saxon xalanredirect lxslt">

 <xsl:import href="chunk-common.xsl" />

 <!-- ==================================================================== -->

 <xsl:template name="html.head">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:param name="up" select="parent::*"/>
  <xsl:variable name="home" select="/*[1]"/> 

  <head>
   <xsl:call-template name="head.content"/>
   <xsl:call-template name="user.head.content"/>

   <xsl:if test="$home">
    <link rel="home">
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="$home"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="title">
      <xsl:apply-templates select="$home" mode="title.ref">
       <xsl:with-param name="text-only" select="'1'"/>
      </xsl:apply-templates>
     </xsl:attribute>
    </link>
   </xsl:if>

   <xsl:if test="$up">
    <link rel="up">
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="$up"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="title">
      <xsl:apply-templates select="$up" mode="title.ref">
       <xsl:with-param name="text-only" select="'1'"/>
      </xsl:apply-templates>
     </xsl:attribute>
    </link>
   </xsl:if>

   <xsl:if test="$prev">
    <link rel="previous">
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="$prev"/>
     </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="title">
      <xsl:apply-templates select="$prev" mode="title.ref">
       <xsl:with-param name="text-only" select="'1'"/>
      </xsl:apply-templates>
     </xsl:attribute>
    </link>
   </xsl:if>

   <xsl:if test="$next">
    <link rel="next">
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="$next"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="title">
     <xsl:apply-templates select="$next" mode="title.ref">
       <xsl:with-param name="text-only" select="'1'"/>
      </xsl:apply-templates>
     </xsl:attribute>
    </link>
   </xsl:if>
  </head>
 </xsl:template>

 <xsl:template name="header.navigation">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:param name="up" select="parent::*"/>
  <xsl:variable name="home" select="/*[1]"/>

  <xsl:processing-instruction name="php">
   <xsl:text>
    require('shared-manual.inc');
    sendManualHeaders('ISO-8859-1','en');
    setupNavigation(array('home' => array('
   </xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="$home"/>
   </xsl:call-template>
   <xsl:text>
    ', 'PHP-GTK Manual'),
    'prev' => array('
   </xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="$prev"/>
   </xsl:call-template>
   <xsl:text>', '</xsl:text>
   <xsl:apply-templates select="$prev" mode="title.content" />
   <xsl:text>'),
    'next' => array('</xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="$next"/>
   </xsl:call-template>
   <xsl:text>', '  </xsl:text>
   <xsl:apply-templates select="$next" mode="title.content" />
   <xsl:text>'),
    'up'   => array('</xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="$up"/>
   </xsl:call-template>
   <xsl:text>', '</xsl:text>
    <xsl:apply-templates select="$up" mode="title.content"/>
   <xsl:text>'),
   'toc'  => array(</xsl:text>
   <xsl:call-template name="gen.toc.array">
    <xsl:with-param name="node" select="." />
   </xsl:call-template>
   <xsl:text>)));
    manualHeader('</xsl:text>
   <xsl:apply-templates select="." mode="title.content"/>
   <xsl:text>','</xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="."/>
   </xsl:call-template>
   <xsl:text>');</xsl:text>
   <xsl:text>?</xsl:text>
  </xsl:processing-instruction>
 </xsl:template>

 <xsl:template name="gen.toc.array">
  <xsl:param name="node" select="." />
  <!-- we need a few special cases here so that we can handle constructor, methods and signals.. -->
  <xsl:choose>

   <xsl:when test="name($node)='constructor' or name($node)='method' or name($node)='signal'">
    <xsl:variable name="classentry" select="ancestor::classentry"/>
    <xsl:for-each select="$classentry/constructor|$classentry/methods/*|$classentry/signals/*|$classentry/attributes/*">
     <xsl:call-template name="gen.text.toc.array">
      <xsl:with-param name="node" select="." />
     </xsl:call-template>
    </xsl:for-each>
   </xsl:when>

   <xsl:when test="name($node)='classentry'">
    <xsl:for-each select="preceding-sibling::classentry|self::*|following-sibling::classentry">
     <xsl:call-template name="gen.text.toc.array">
      <xsl:with-param name="node" select="." />
     </xsl:call-template>
    </xsl:for-each>
   </xsl:when>

   <xsl:when test="name($node)='sect1'">
    <xsl:for-each select="preceding-sibling::sect1|self::*|following-sibling::sect1">
     <xsl:call-template name="gen.text.toc.array">
      <xsl:with-param name="node" select="." />
     </xsl:call-template>
    </xsl:for-each>
   </xsl:when>

   <xsl:otherwise>
    <xsl:for-each select="preceding-sibling::node()|self::node()|following-sibling::node()">
    <xsl:call-template name="gen.text.toc.array">
     <xsl:with-param name="node" select="." />
    </xsl:call-template>
   </xsl:for-each>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template name="gen.text.toc.array">
  <xsl:param name="node" select="."/>
  <xsl:variable name="ischunk">
   <xsl:call-template name="chunk">
    <xsl:with-param name="node" select="$node"/>
   </xsl:call-template>
  </xsl:variable>
  <xsl:if test="$ischunk='1'">
   <xsl:text>array('</xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="$node"/>
   </xsl:call-template>
   <xsl:text>','</xsl:text>
   <xsl:apply-templates select="$node" mode="title.content"/>
   <xsl:text>',</xsl:text>
   <xsl:choose>
    <xsl:when test="name($node)='classentry'">
     <xsl:text>NAV_CLASSENTRY</xsl:text>
    </xsl:when>
    <xsl:when test="name($node)='constructor'">
     <xsl:text>NAV_CONSTRUCTOR</xsl:text>
    </xsl:when>
    <xsl:when test="name($node)='method'">
    <xsl:text>NAV_METHOD</xsl:text>
    </xsl:when>
    <xsl:when test="name($node)='signal'">
     <xsl:text>NAV_SIGNAL</xsl:text>
    </xsl:when>
    <xsl:otherwise>
     <xsl:text>NAV_NONE</xsl:text>
    </xsl:otherwise>
   </xsl:choose>
   <xsl:text>),</xsl:text>
  </xsl:if>
 </xsl:template>

 <xsl:template name="footer.navigation">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:param name="up" select="parent::*"/>
  <xsl:variable name="home" select="/*[1]"/>

  <xsl:processing-instruction name="php">
   <xsl:text>manualFooter('</xsl:text>
   <xsl:apply-templates select="." mode="title.content"/>
   <xsl:text>','</xsl:text>
   <xsl:call-template name="href.target">
    <xsl:with-param name="object" select="."/>
   </xsl:call-template>
   <xsl:text>');</xsl:text>
   <xsl:text>?</xsl:text>
  </xsl:processing-instruction>
 </xsl:template>

 <xsl:template name="chunk-element-content">
  <xsl:param name="prev"></xsl:param>
  <xsl:param name="next"></xsl:param>
  <xsl:param name="up" select="parent::*"></xsl:param>
  <xsl:call-template name="header.navigation">
   <xsl:with-param name="prev" select="$prev"/>
   <xsl:with-param name="next" select="$next"/>
   <xsl:with-param name="up" select="$up"/>
  </xsl:call-template>

  <xsl:call-template name="user.header.content"/>
  <xsl:apply-imports/>

  <xsl:call-template name="user.footer.content"/>

  <xsl:call-template name="footer.navigation">
   <xsl:with-param name="prev" select="$prev"/>
   <xsl:with-param name="next" select="$next"/>
   <xsl:with-param name="up" select="$up"/>
  </xsl:call-template>
 </xsl:template>


 <xsl:template name="get_class_hierarchy">
  <xsl:param name="classname" />

  <xsl:variable name="depth">
   <xsl:call-template name="current-depth">
    <xsl:with-param name="classname" select="$classname" />
   </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="id">
   <xsl:call-template name="get_id_from_name">
    <xsl:with-param name="classname">
     <xsl:value-of select="$classname"/>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:variable>

  <xsl:if test="$depth>0">
   <xsl:call-template name="get_class_hierarchy">
    <xsl:with-param name="classname">
     <xsl:call-template name="get_parent_class">
      <xsl:with-param name="classname" select="$classname"/>
     </xsl:call-template>
    </xsl:with-param>
   </xsl:call-template>
  </xsl:if>

  <!-- Horrible hack but xsl doesnt have foreach :( -->
  <xsl:variable name="bad.hack">
   <xsl:choose>
    <xsl:when test="$depth=0">
     <xsl:text></xsl:text>
    </xsl:when>
    <xsl:when test="$depth=1">
     <xsl:text disable-output-escaping="yes">
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=2">
     <xsl:text disable-output-escaping="yes">
print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=3">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 1); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=4">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 2); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=5">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 3); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=6">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 4); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=7">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 5); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=8">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 6); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=9">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 7); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=10">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 8); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=11">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 9); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:when test="$depth=12">
     <xsl:text disable-output-escaping="yes">
echo str_repeat(make_image('inhier-blank.gif'), 10); print_image('inhier-arrow.gif');
     </xsl:text>
    </xsl:when>
    <xsl:otherwise>
     <xsl:message>
      <xsl:text>
       You need to modify hierarchy.xsl to allow for a depth greater than 12
      </xsl:text>
     </xsl:message>
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
    <xsl:processing-instruction name="php">
     <xsl:value-of select="$bad.hack"/>
     <xsl:text>?</xsl:text>
    </xsl:processing-instruction> 
    <xsl:text>&nbsp;</xsl:text>
    <a>
     <xsl:attribute name="href">
      <xsl:value-of select="$link" />
     </xsl:attribute>
     <xsl:value-of select="$classname" />
    </a>
    <br />
   </xsl:when>
   <xsl:otherwise>
    <xsl:processing-instruction name="php">
     <xsl:value-of select="$bad.hack"/>
     <xsl:value-of select="$classname" />
     <xsl:text>?</xsl:text>
    </xsl:processing-instruction> 
   </xsl:otherwise>
  </xsl:choose>

 </xsl:template>


</xsl:stylesheet>