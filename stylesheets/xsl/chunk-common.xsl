<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
				xmlns:xalanredirect="org.apache.xalan.xslt.extensions.Redirect"
				xmlns:lxslt="http://xml.apache.org/xslt"
		version="1.0"
                extension-element-prefixes="saxon xalanredirect lxslt">

<xsl:import href="html.xsl" />

<xsl:template name="chunk">
  <xsl:param name="node" select="."/>
  <!-- returns 1 if $node is a chunk -->

  <xsl:choose>
    <xsl:when test="name($node)='sect1'
                    and count($node/preceding-sibling::sect1) > 0">1</xsl:when>
    <xsl:when test="name($node)='section'
                    and count($node/parent::section) = 0
                    and count($node/preceding-sibling::section) > 0">1</xsl:when>
    <xsl:when test="name($node)='preface'">1</xsl:when>
    <xsl:when test="name($node)='chapter'">1</xsl:when>
    <xsl:when test="name($node)='appendix'">1</xsl:when>
    <xsl:when test="name($node)='article'">1</xsl:when>
    <xsl:when test="name($node)='part'">1</xsl:when>
    <xsl:when test="name($node)='reference'">1</xsl:when>
    <xsl:when test="name($node)='refentry'">1</xsl:when>
    <xsl:when test="name($node)='index'
                    and (name($node/parent::*) = 'article'
                         or name($node/parent::*) = 'book')">1</xsl:when>
    <xsl:when test="name($node)='bibliography'
                    and (name($node/parent::*) = 'article'
                         or name($node/parent::*) = 'book')">1</xsl:when>
    <xsl:when test="name($node)='glossary'
                    and (name($node/parent::*) = 'article'
                         or name($node/parent::*) = 'book')">1</xsl:when>
    <xsl:when test="name($node)='colophon'">1</xsl:when>
    <xsl:when test="name($node)='book'">1</xsl:when>
    <xsl:when test="name($node)='set'">1</xsl:when>
    <xsl:when test="name($node)='setindex'">1</xsl:when>
    <xsl:when test="name($node)='classset'">1</xsl:when>
    <xsl:when test="name($node)='classentry'">1</xsl:when>
    <xsl:when test="name($node)='method'">1</xsl:when>
    <xsl:when test="name($node)='attribute'">1</xsl:when>
    <xsl:when test="name($node)='signal'">1</xsl:when>
    <xsl:when test="name($node)='constructor'">1</xsl:when>
    <xsl:when test="name($node)='legalnotice'">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="*" mode="chunk-filename">
  <xsl:param name="recursive" select="false()"/>

  <!-- returns the filename of a chunk -->
  <xsl:variable name="ischunk"><xsl:call-template name="chunk"/></xsl:variable>
  <xsl:variable name="filename">
    <xsl:call-template name="dbhtml-filename"/>
  </xsl:variable>
  <xsl:variable name="dir">
    <xsl:call-template name="dbhtml-dir"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$ischunk='0'">
      <!-- if called on something that isn't a chunk, walk up... -->
      <xsl:choose>
        <xsl:when test="count(parent::*)>0">
          <xsl:apply-templates mode="chunk-filename" select="parent::*">
            <xsl:with-param name="recursive" select="$recursive"/>
          </xsl:apply-templates>
        </xsl:when>
        <!-- unless there is no up, in which case return "" -->
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:when>

    <xsl:when test="not($recursive) and $filename != ''">
      <!-- if this chunk has an explicit name, use it -->
      <xsl:if test="$dir != ''">
        <xsl:value-of select="$dir"/>
        <xsl:text>/</xsl:text>
      </xsl:if>
      <xsl:value-of select="$filename"/>
    </xsl:when>

    <xsl:when test="not($recursive) and @id != '' and $use.id.as.filename=1 and name(.) != 'book'">
      <!-- if this chunk has an explicit name in id attribute, use it -->
      <xsl:if test="$dir != ''">
        <xsl:value-of select="$dir"/>
        <xsl:text>/</xsl:text>
      </xsl:if>
      <xsl:value-of select="@id"/>
      <xsl:value-of select="$html.ext"/>
    </xsl:when>

    <xsl:when test="not($recursive) and name(.) = 'book'">
     <xsl:choose>
      <xsl:when test="$root.filename">
       <xsl:value-of select="$root.filename" />
      </xsl:when>
      <xsl:otherwise>
       <xsl:text>error</xsl:text>
      </xsl:otherwise>
     </xsl:choose>
     <xsl:value-of select="$html.ext"/>
    </xsl:when>

    <xsl:otherwise>
      <xsl:text>chunk-filename-error-</xsl:text>
      <xsl:value-of select="name(.)"/>
      <xsl:number level="any" format="01" from="set"/>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="href.target">
  <xsl:param name="object" select="."/>
  <xsl:variable name="ischunk">
    <xsl:call-template name="chunk">
      <xsl:with-param name="node" select="$object"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:apply-templates mode="chunk-filename" select="$object"/>

  <xsl:if test="$ischunk='0'">
    <xsl:text>#</xsl:text>
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="$object"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="process-chunk-element">
  <xsl:variable name="root" select="count(parent::*) &gt; 0"/>

  <xsl:variable name="prev"
    select="(preceding::book[1]
             |preceding::preface[1]
             |preceding::chapter[1]
             |preceding::appendix[1]
             |preceding::part[1]
	     |preceding::constructor[1]
	     |preceding::method[1]
	     |preceding::signal[1]
	     |preceding::attribute[1]
	     |preceding::classset[1]
	     |preceding::classentry[1]
	     |preceding::reference[1]
             |preceding::refentry[1]
             |preceding::colophon[1]
             |preceding::sect1[name(preceding-sibling::*[1]) = 'sect1'][1]
             |preceding::section[name(preceding-sibling::*[1]) = 'section'
                                 and name(parent::*) != 'section'][1]
             |preceding::article[1]
             |preceding::bibliography[1]
             |preceding::glossary[1]
             |preceding::index[1]
             |preceding::setindex[1]
             |ancestor::set
             |ancestor::book[1]
             |ancestor::preface[1]
             |ancestor::chapter[1]
             |ancestor::appendix[1]
             |ancestor::part[1]
             |ancestor::reference[1]
	     |ancestor::constructor[1]
     	     |ancestor::method[1]
	     |ancestor::signal[1]
	     |ancestor::attribute[1]
	     |ancestor::classset[1]
    	     |ancestor::classentry[1]
             |ancestor::article[1])[last()]"/>

  <xsl:variable name="next"
    select="(following::book[1]
             |following::preface[1]
             |following::chapter[1]
             |following::appendix[1]
             |following::part[1]
	     |following::constructor[1]
	     |following::method[1]
	     |following::signal[1]
	     |following::attribute[1]
	     |following::classset[1]
	     |following::classentry[1]
	     |following::reference[1]
	     |following::refentry[1]
             |following::colophon[1]
             |following::sect1[1]
             |following::section[name(parent::*) != 'section'][1]
             |following::bibliography[1]
             |following::glossary[1]
             |following::index[1]
             |following::article[1]
             |following::setindex[1]
             |descendant::book[1]
             |descendant::preface[1]
             |descendant::chapter[1]
             |descendant::appendix[1]
             |descendant::article[1]
             |descendant::bibliography[1]
             |descendant::glossary[1]
             |descendant::index[1]
             |descendant::colophon[1]
             |descendant::setindex[1]
             |descendant::part[1]
     	     |descendant::constructor[1]
	     |descendant::method[1]
	     |descendant::signal[1]
	     |descendant::attribute[1]
	     |descendant::classset[1]
	     |descendant::classentry[1]
             |descendant::reference[1]
             |descendant::refentry[1]
             |descendant::sect1[2]
             |descendant::section[name(parent::*) != 'section'][2])[1]"/>

  <xsl:variable name="up"
   select="(parent::set[1]
           |parent::book[1]
           |parent::preface[1]
           |parent::chapter[1]
           |parent::appendix[1]
           |parent::part[1]
           |parent::reference[1]
     	   |parent::method[1]
	   |parent::signal[1]
	   |parent::attribute[1]
	   |parent::classset[1]
    	   |ancestor::classentry[1]
           |parent::article[1])[last()]"/>

  <xsl:variable name="ischunk">
    <xsl:call-template name="chunk"/>
  </xsl:variable>

  <xsl:variable name="chunkfn">
    <xsl:if test="$ischunk='1'">
      <xsl:apply-templates mode="chunk-filename" select="."/>
    </xsl:if>
  </xsl:variable>

  <xsl:if test="$ischunk='0'">
    <xsl:message>
      <xsl:text>Error </xsl:text>
      <xsl:value-of select="name(.)"/>
      <xsl:text> is not a chunk!</xsl:text>
    </xsl:message>
  </xsl:if>

  <xsl:variable name="filename">
    <xsl:call-template name="make-relative-filename">
      <xsl:with-param name="base.dir" select="$base.dir"/>
      <xsl:with-param name="base.name" select="$chunkfn"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:message>
    <xsl:text>Writing </xsl:text>
    <xsl:value-of select="$filename"/>
    <xsl:text> for </xsl:text>
    <xsl:value-of select="name(.)"/>
  </xsl:message>

  <xsl:call-template name="write.chunk">
    <xsl:with-param name="filename" select="$filename"/>
    <xsl:with-param name="content">
      <xsl:call-template name="chunk-element-content">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
	<xsl:with-param name="up" select="$up"/>
      </xsl:call-template>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="classset|classentry|method|signal|attribute|constructor">
  <xsl:call-template name="process-chunk-element"/>
</xsl:template>

<xsl:template match="legalnotice" mode="titlepage.mode">
  <xsl:call-template name="process-chunk-element"/>
</xsl:template>
<!-- ==================================================================== -->


</xsl:stylesheet>
