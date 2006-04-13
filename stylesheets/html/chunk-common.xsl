<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
		version="1.0"
                exclude-result-prefixes="doc">

<xsl:output method="html"
            encoding="UTF-8"
            indent="no"/>

<doc:param name="html.ext" xmlns="">
<refpurpose>Extension for chunked files</refpurpose>
<refdescription>
<para>The extension identified by <parameter>html.ext</parameter> will
be used as the filename extension for chunks created by this stylesheet.
</para>
</refdescription>
</doc:param>

<xsl:param name="root.filename" select="'index'"/>
<doc:param name="root.filename" xmlns="">
<refpurpose>Filename for the root chunk</refpurpose>
<refdescription>
<para>The <parameter>root.filename</parameter> is the base filename for
the chunk created for the root of each document processed.
</para>
</refdescription>
</doc:param>

<doc:param name="base.dir" xmlns="">
<refpurpose>Output directory for chunks</refpurpose>
<refdescription>
<para>If specified, the <literal>base.dir</literal> identifies
the output directory for chunks. (If not specified, the output directory
is system dependent.)</para>
</refdescription>
</doc:param>

<xsl:param name="chunk.sections" select="'1'"/>
<doc:param name="chunk.sections" xmlns="">
<refpurpose>Create chunks for top-level sections in components?</refpurpose>
<refdescription>
<para>If non-zero, chunks will be created for top-level
<sgmltag>sect1</sgmltag> and <sgmltag>section</sgmltag> elements in
each component.
</para>
</refdescription>
</doc:param>

<xsl:param name="chunk.first.sections" select="'0'"/>
<doc:param name="chunk.first.sections" xmlns="">
<refpurpose>Create a chunk for the first top-level section in each component?</refpurpose>
<refdescription>
<para>If non-zero, a chunk will be created for the first top-level
<sgmltag>sect1</sgmltag> or <sgmltag>section</sgmltag> elements in
each component. Otherwise, that section will be part of the chunk for
its parent.
</para>
</refdescription>
</doc:param>

<!-- ==================================================================== -->
<!-- What's a chunk?

     appendix
     book
     chapter
     part
     refentry
     sect1         if position()>1
     set
                                                                          -->
<!-- ==================================================================== -->

<xsl:template name="chunk">
  <xsl:param name="node" select="."/>
  <!-- returns 1 if $node is a chunk -->

  <xsl:choose>
    <xsl:when test="$chunk.sections != 0
                    and name($node)='sect1'
                    and ($chunk.first.sections != 0
                         or count($node/preceding-sibling::sect1) > 0)">
      <xsl:text>1</xsl:text>
    </xsl:when>
    <xsl:when test="$chunk.sections != 0
                    and name($node)='section'
                    and ($chunk.first.sections != 0
                         or (count($node/parent::section) = 0
                             and count($node/preceding-sibling::section)))>0">
      <xsl:text>1</xsl:text>
    </xsl:when>
    <xsl:when test="name($node)='appendix'">1</xsl:when>
    <xsl:when test="name($node)='glossary'">1</xsl:when>
    <xsl:when test="name($node)='chapter'">1</xsl:when>
    <xsl:when test="name($node)='part'">1</xsl:when>
    <xsl:when test="name($node)='refentry'">1</xsl:when>
    <xsl:when test="name($node)='book'">1</xsl:when>
    <xsl:when test="name($node)='set'">1</xsl:when>
    <xsl:when test="name($node)='classset'">1</xsl:when>
    <xsl:when test="name($node)='enumset'">1</xsl:when>
    <xsl:when test="name($node)='classtree'">1</xsl:when>
    <xsl:when test="name($node)='index'">1</xsl:when>
    <xsl:when test="name($node)='classentry'">1</xsl:when>
    <xsl:when test="name($node)='method'">1</xsl:when>
    <xsl:when test="name($node)='signal'">1</xsl:when>
    <xsl:when test="name($node)='constructor'">1</xsl:when>
    <xsl:when test="name($node)='legalnotice'">1</xsl:when>
    <xsl:when test="name($node)='enum'">1</xsl:when>
    <xsl:when test="name($node)='field'">1</xsl:when>
    <xsl:when test="name($node)='prop'">1</xsl:when>
    <xsl:otherwise>0</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template match="*" mode="chunk-filename">
  <xsl:param name="recursive" select="false()"/>

  <!-- returns the filename of a chunk -->
  <xsl:variable name="ischunk">
    <xsl:call-template name="chunk"/>
  </xsl:variable>

  <xsl:variable name="dbhtml-filename">
    <xsl:call-template name="dbhtml-filename"/>
  </xsl:variable>

  <xsl:variable name="filename">
    <xsl:choose>
      <xsl:when test="$dbhtml-filename != ''">
        <xsl:value-of select="$dbhtml-filename"/>
      </xsl:when>
      <!-- if there's no dbhtml filename, and if we're to use IDs as -->
      <!-- filenames, *and* this isn't the root node, then use the ID -->
      <!-- to generate the filename. -->
      <xsl:when test="@id and $use.id.as.filename != 0
                      and . != /*">
        <xsl:value-of select="@id"/>
        <xsl:value-of select="$html.ext"/>
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
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

    <xsl:when test="name(.)='set'">
      <xsl:value-of select="$root.filename"/>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
    </xsl:when>

    <xsl:when test="name(.)='book'">
      <xsl:choose>
        <xsl:when test="count(parent::*)>0">
          <xsl:text>bk</xsl:text>
          <xsl:number level="any" format="01"/>
        </xsl:when>
        <xsl:otherwise>
	  <xsl:value-of select="$root.filename"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
    </xsl:when>

	<xsl:when test="name(.)='chapter'">
      <xsl:if test="/set">
        <xsl:apply-templates mode="chunk-filename" select="parent::*">
          <xsl:with-param name="recursive" select="true()"/>
        </xsl:apply-templates>
      </xsl:if>
      <xsl:text>ch</xsl:text>
      <xsl:number level="any" format="01" from="book"/>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
    </xsl:when>

    <xsl:when test="name(.)='part'">
      <xsl:if test="/set">
        <xsl:apply-templates mode="chunk-filename" select="parent::*">
          <xsl:with-param name="recursive" select="true()"/>
        </xsl:apply-templates>
      </xsl:if>
      <xsl:text>pt</xsl:text>
      <xsl:number level="any" format="01" from="book"/>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
    </xsl:when>

    <xsl:when test="name(.)='refentry'">
      <xsl:if test="parent::reference">
        <xsl:apply-templates mode="chunk-filename" select="parent::*">
          <xsl:with-param name="recursive" select="true()"/>
        </xsl:apply-templates>
      </xsl:if>
      <xsl:text>re</xsl:text>
      <xsl:number level="any" format="01" from="book"/>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
    </xsl:when>

    <xsl:when test="name(.)='sect1'">
      <xsl:apply-templates mode="chunk-filename" select="parent::*">
        <xsl:with-param name="recursive" select="true()"/>
      </xsl:apply-templates>
      <xsl:text>s</xsl:text>
      <xsl:number level="any" format="01" from="chapter"/>
      <xsl:if test="not($recursive)">
        <xsl:value-of select="$html.ext"/>
      </xsl:if>
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
  <xsl:choose>
   <xsl:when test="$phpweb=false()">
    <xsl:text>#</xsl:text>
     <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="$object"/>
     </xsl:call-template>
    </xsl:when>
    <xsl:otherwise></xsl:otherwise>
   </xsl:choose>
  </xsl:if>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="html.head">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:variable name="home" select="/*[1]"/>
  <xsl:variable name="up" select="parent::*"/>

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
          <xsl:apply-templates select="$home"
                               mode="object.title.markup.textonly"/>
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
          <xsl:apply-templates select="$up" mode="object.title.markup.textonly"/>
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
          <xsl:apply-templates select="$prev" mode="object.title.markup.textonly"/>
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
          <xsl:apply-templates select="$next" mode="object.title.markup.textonly"/>
        </xsl:attribute>
      </link>
    </xsl:if>
  </head>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="header.navigation">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:variable name="home" select="/*[1]"/>
  <xsl:variable name="up" select="parent::*"/>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>

  <xsl:if test="$suppress.navigation = '0'">
  <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
    <div class="navheader" dir="rtl">
      <table width="100%" summary="Navigation header">
        <tr>
          <th colspan="3" align="center">
            <xsl:choose>
              <xsl:when test="count($up) > 0 and $up != $home">
                <xsl:apply-templates select="$up" mode="object.title.markup"/>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </th>
        </tr>
        <tr>
          <td width="20%" align="left">
            <xsl:if test="count($prev)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$prev"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-prev</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
          <th width="60%" align="center">
            <xsl:apply-templates select="." mode="object.title.markup"/>
          </th>
          <td width="20%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="count($next)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$next"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-next</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
          </td>
        </tr>
      </table>
      <hr/>
    </div>
   </xsl:when>
   <xsl:otherwise>
    <div class="navheader">
      <table width="100%" summary="Navigation header">
        <tr>
          <th colspan="3" align="center">
            <xsl:choose>
              <xsl:when test="count($up) > 0 and $up != $home">
                <xsl:apply-templates select="$up" mode="object.title.markup"/>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </th>
        </tr>
        <tr>
          <td width="20%" align="left">
            <xsl:if test="count($prev)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$prev"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-prev</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
          <th width="60%" align="center">
            <xsl:apply-templates select="." mode="object.title.markup"/>
          </th>
          <td width="20%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="count($next)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$next"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-next</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
          </td>
        </tr>
      </table>
      <hr/>
    </div>
   </xsl:otherwise>
   </xsl:choose>
  </xsl:if>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="footer.navigation">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:variable name="home" select="/*[1]"/>
  <xsl:variable name="up" select="parent::*"/>
  <xsl:variable name="lang" select="ancestor-or-self::*/@lang"/>

  <xsl:if test="$suppress.navigation = '0'">
   <xsl:choose>
   <xsl:when test="$lang='he' or $lang='ar'">
    <div class="navfooter" dir="rtl">
      <hr/>
      <table width="100%" summary="Navigation footer">
        <tr>
          <td width="40%" align="left">
            <xsl:if test="count($prev)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$prev"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-prev</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
          <td width="20%" align="center">
            <xsl:choose>
              <xsl:when test="$home != .">
                <a>
                  <xsl:attribute name="href">
                    <xsl:call-template name="href.target">
                      <xsl:with-param name="object" select="$home"/>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">nav-home</xsl:with-param>
                  </xsl:call-template>
                </a>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </td>
          <td width="40%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="count($next)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$next"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-next</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
          </td>
        </tr>

        <tr>
          <td width="40%" align="left">
            <xsl:apply-templates select="$prev" mode="object.title.markup"/>
            <xsl:text>&#160;</xsl:text>
          </td>
          <td width="20%" align="center">
            <xsl:choose>
              <xsl:when test="count($up)>0">
                <a>
                  <xsl:attribute name="href">
                    <xsl:call-template name="href.target">
                      <xsl:with-param name="object" select="$up"/>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">nav-up</xsl:with-param>
                  </xsl:call-template>
                </a>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </td>
          <td width="40%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:apply-templates select="$next" mode="object.title.markup"/>
          </td>
        </tr>
      </table>
    </div>
   </xsl:when>
   <xsl:otherwise>
    <div class="navfooter">
      <hr/>
      <table width="100%" summary="Navigation footer">
        <tr>
          <td width="40%" align="left">
            <xsl:if test="count($prev)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$prev"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-prev</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
          <td width="20%" align="center">
            <xsl:choose>
              <xsl:when test="$home != .">
                <a>
                  <xsl:attribute name="href">
                    <xsl:call-template name="href.target">
                      <xsl:with-param name="object" select="$home"/>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">nav-home</xsl:with-param>
                  </xsl:call-template>
                </a>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </td>
          <td width="40%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:if test="count($next)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$next"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext">
                  <xsl:with-param name="key">nav-next</xsl:with-param>
                </xsl:call-template>
              </a>
            </xsl:if>
          </td>
        </tr>

        <tr>
          <td width="40%" align="left">
            <xsl:apply-templates select="$prev" mode="object.title.markup"/>
            <xsl:text>&#160;</xsl:text>
          </td>
          <td width="20%" align="center">
            <xsl:choose>
              <xsl:when test="count($up)>0">
                <a>
                  <xsl:attribute name="href">
                    <xsl:call-template name="href.target">
                      <xsl:with-param name="object" select="$up"/>
                    </xsl:call-template>
                  </xsl:attribute>
                  <xsl:call-template name="gentext">
                    <xsl:with-param name="key">nav-up</xsl:with-param>
                  </xsl:call-template>
                </a>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </td>
          <td width="40%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:apply-templates select="$next" mode="object.title.markup"/>
          </td>
        </tr>
      </table>
    </div>
	</xsl:otherwise>
	</xsl:choose>
  </xsl:if>
</xsl:template>

<!-- ==================================================================== -->

<xsl:template name="process-chunk-element">
  <xsl:choose>
    <xsl:when test="$chunk.sections = 0">
      <xsl:call-template name="chunk-no-sections"/>
    </xsl:when>
    <xsl:when test="$chunk.first.sections = 0">
      <xsl:call-template name="chunk-first-section-with-parent"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="chunk-all-top-level-sections"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="process-chunk">
  <xsl:param name="prev" select="."/>
  <xsl:param name="next" select="."/>

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

  <xsl:call-template name="write.chunk.with.doctype">
    <xsl:with-param name="filename" select="$filename"/>
    <xsl:with-param name="content">
      <xsl:call-template name="chunk-element-content">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
      </xsl:call-template>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="chunk-first-section-with-parent">
  <xsl:variable name="prev"
     select="(preceding::book[1]
             |preceding::chapter[1]
             |preceding::appendix[1]
             |preceding::glossary[1]
             |preceding::part[1]
             |preceding::constructor[1]
             |preceding::method[1]
             |preceding::signal[1]
             |preceding::classset[1]
             |preceding::enumset[1]
             |preceding::field[1]
             |preceding::prop[1]
             |preceding::classtree[1]
             |preceding::classentry[1]
             |preceding::index[1]
             |preceding::refentry[1]
             |preceding::enum[1]
             |preceding::sect1[name(preceding-sibling::*[1]) = 'sect1'][1]
             |ancestor::set
             |ancestor::book[1]
             |ancestor::chapter[1]
             |ancestor::appendix[1]
             |ancestor::glossary[1]
             |ancestor::part[1]
             |ancestor::constructor[1]
             |ancestor::method[1]
             |ancestor::signal[1]
             |ancestor::classset[1]
             |ancestor::enumset[1]
             |ancestor::classtree[1]
             |ancestor::index[1]
             |ancestor::classentry[1])[last()]"/>

  <xsl:variable name="next"
    select="(following::book[1]
             |following::chapter[1]
             |following::appendix[1]
             |following::glossary[1]
             |following::classset[1]
             |following::enumset[1]
             |following::part[1]
             |following::constructor[1]
             |following::method[1]
             |following::signal[1]
             |following::classtree[1]
             |following::classentry[1]
             |following::index[1]
             |following::refentry[1]
             |following::enum[1]
             |following::field[1]
             |following::prop[1]
             |following::sect1[1]
             |descendant::book[1]
             |descendant::chapter[1]
             |descendant::appendix[1]
             |descendant::glossary[1]
             |descendant::part[1]
             |descendant::field[1]
             |descendant::prop[1]
             |descendant::enum[1]
             |descendant::part[1]
             |descendant::constructor[1]
             |descendant::method[1]
             |descendant::signal[1]
             |descendant::classset[1]
             |descendant::enumset[1]
             |descendant::classtree[1]
             |descendant::classentry[1]
             |descendant::index[1]
             |descendant::reference[1]
             |descendant::refentry[1]
             |descendant::sect1[name(parent::*) != 'sect1'][2])[1]"/>

  <xsl:call-template name="process-chunk">
    <xsl:with-param name="prev" select="$prev"/>
    <xsl:with-param name="next" select="$next"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="chunk-all-top-level-sections">
  <xsl:variable name="prev"
     select="(preceding::book[1]
             |preceding::chapter[1]
             |preceding::appendix[1]
             |preceding::glossary[1]
             |preceding::part[1]
             |preceding::constructor[1]
             |preceding::method[1]
             |preceding::signal[1]
             |preceding::classset[1]
             |preceding::enumset[1]
             |preceding::field[1]
             |preceding::prop[1]
             |preceding::classtree[1]
             |preceding::classentry[1]
             |preceding::index[1]
             |preceding::refentry[1]
             |preceding::enum[1]
             |preceding::sect1[1]
             |ancestor::set
             |ancestor::book[1]
             |ancestor::chapter[1]
             |ancestor::appendix[1]
             |ancestor::glossary[1]
             |ancestor::part[1]
             |ancestor::constructor[1]
             |ancestor::method[1]
             |ancestor::signal[1]
             |ancestor::classset[1]
             |ancestor::enumset[1]
             |ancestor::classtree[1]
             |ancestor::index[1]
             |ancestor::classentry[1])[last()]"/>

  <xsl:variable name="next"
    select="(following::book[1]
             |following::chapter[1]
             |following::appendix[1]
             |following::glossary[1]
             |following::classset[1]
             |following::enumset[1]
             |following::part[1]
             |following::constructor[1]
             |following::method[1]
             |following::signal[1]
             |following::classtree[1]
             |following::classentry[1]
             |following::index[1]
             |following::refentry[1]
             |following::enum[1]
             |following::field[1]
             |following::prop[1]
             |following::sect1[1]
             |descendant::book[1]
             |descendant::chapter[1]
             |descendant::appendix[1]
             |descendant::glossary[1]
             |descendant::part[1]
             |descendant::enum[1]
             |descendant::field[1]
             |descendant::prop[1]
             |descendant::part[1]
             |descendant::constructor[1]
             |descendant::method[1]
             |descendant::signal[1]
             |descendant::classset[1]
             |descendant::enumset[1]
             |descendant::classtree[1]
             |descendant::index[1]
             |descendant::classentry[1]
             |descendant::refentry[1]
             |descendant::sect1[name(parent::*) != 'sect1'][1])[1]"/>

  <xsl:call-template name="process-chunk">
    <xsl:with-param name="prev" select="$prev"/>
    <xsl:with-param name="next" select="$next"/>
  </xsl:call-template>
</xsl:template>

<xsl:template name="chunk-no-sections">
  <xsl:variable name="prev"
     select="(preceding::book[1]
             |preceding::chapter[1]
             |preceding::appendix[1]
             |preceding::glossary[1]
             |preceding::part[1]
             |preceding::constructor[1]
             |preceding::method[1]
             |preceding::signal[1]
             |preceding::classset[1]
             |preceding::enumset[1]
             |preceding::field[1]
             |preceding::prop[1]
             |preceding::classtree[1]
             |preceding::classentry[1]
             |preceding::index[1]
             |preceding::refentry[1]
             |preceding::enum[1]
             |ancestor::set
             |ancestor::book[1]
             |ancestor::chapter[1]
             |ancestor::appendix[1]
             |ancestor::glossary[1]
             |ancestor::part[1]
             |ancestor::reference[1]
             |ancestor::constructor[1]
             |ancestor::method[1]
             |ancestor::signal[1]
             |ancestor::classset[1]
             |ancestor::enumset[1]
             |ancestor::classtree[1]
             |ancestor::index[1]
             |ancestor::classentry[1])[last()]"/>

  <xsl:variable name="next"
    select="(following::book[1]
             |following::chapter[1]
             |following::appendix[1]
             |following::glossary[1]
             |following::classset[1]
             |following::enumset[1]
             |following::part[1]
             |following::constructor[1]
             |following::method[1]
             |following::signal[1]
             |following::classtree[1]
             |following::classentry[1]
             |following::index[1]
             |following::refentry[1]
             |following::enum[1]
             |following::field[1]
             |following::prop[1]
             |descendant::book[1]
             |descendant::chapter[1]
             |descendant::appendix[1]
             |descendant::glossary[1]
             |descendant::part[1]
             |descendant::enum[1]
             |descendant::field[1]
             |descendant::prop[1]
             |descendant::constructor[1]
             |descendant::method[1]
             |descendant::signal[1]
             |descendant::enumset[1]
             |descendant::classset[1]
             |descendant::classtree[1]
             |descendant::classentry[1]
             |descendant::index[1]
             |descendant::refentry[1]
             |descendant::part[1]
             |descendant::refentry[1])[1]"/>

  <xsl:call-template name="process-chunk">
    <xsl:with-param name="prev" select="$prev"/>
    <xsl:with-param name="next" select="$next"/>
  </xsl:call-template>
</xsl:template>

<!-- ==================================================================== -->

 <xsl:template name="chunk-element-content">
  <xsl:param name="prev"></xsl:param>
  <xsl:param name="next"></xsl:param>
  <xsl:variable name="rtl" select="ancestor-or-self::classentry[1][@rtl=1]
									|ancestor-or-self::book[1][@rtl=1]
									|ancestor-or-self::chapter[1][@rtl=1]
									|ancestor-or-self::setinfo[1][@rtl=1]
									|ancestor-or-self::appendix[1][@rtl=1]
									|ancestor-or-self::refentry[1][@rtl=1]
									|ancestor-or-self::enum[1][@rtl=1]"/>

  <xsl:choose>
   <xsl:when  test="$phpweb = true() and $rtl = true()">
    <xsl:call-template name="phpweb.header.navigation"> 
     <xsl:with-param name="prev" select="$next"/>
     <xsl:with-param name="next" select="$prev"/>
    </xsl:call-template>
    <xsl:apply-imports/>
    <xsl:call-template name="phpweb.footer.navigation"> 
     <xsl:with-param name="prev" select="$next"/>
     <xsl:with-param name="next" select="$prev"/>
    </xsl:call-template>
   </xsl:when>

   <xsl:when  test="$phpweb = true() and $rtl != true()">
    <xsl:call-template name="phpweb.header.navigation"> 
     <xsl:with-param name="prev" select="$prev"/>
     <xsl:with-param name="next" select="$next"/>
    </xsl:call-template>
    <xsl:apply-imports/>
    <xsl:call-template name="phpweb.footer.navigation"> 
     <xsl:with-param name="prev" select="$prev"/>
     <xsl:with-param name="next" select="$next"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:otherwise>
    <xsl:choose>

     <xsl:when test="$rtl">
      <html dir="rtl">
       <xsl:call-template name="html.head">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
       </xsl:call-template>
       <body xsl:use-attribute-sets="body.attrs">
        <xsl:call-template name="user.header.navigation"/>
        <xsl:call-template name="header.navigation"> 
         <xsl:with-param name="prev" select="$prev"/>
         <xsl:with-param name="next" select="$next"/>
        </xsl:call-template>
        <xsl:call-template name="user.header.content"/>
        <xsl:apply-imports/>
        <xsl:call-template name="user.footer.content"/>
        <xsl:call-template name="footer.navigation"> 
         <xsl:with-param name="prev" select="$prev"/>
         <xsl:with-param name="next" select="$next"/>
        </xsl:call-template>
        <xsl:call-template name="user.footer.navigation"/>
       </body>
      </html>
     </xsl:when>

     <xsl:otherwise>
      <html>
       <xsl:call-template name="html.head">
        <xsl:with-param name="prev" select="$prev"/>
        <xsl:with-param name="next" select="$next"/>
       </xsl:call-template>
       <body xsl:use-attribute-sets="body.attrs">
        <xsl:call-template name="user.header.navigation"/>
        <xsl:call-template name="header.navigation"> 
         <xsl:with-param name="prev" select="$prev"/>
         <xsl:with-param name="next" select="$next"/>
        </xsl:call-template>
        <xsl:call-template name="user.header.content"/>
        <xsl:apply-imports/>
        <xsl:call-template name="user.footer.content"/>
        <xsl:call-template name="footer.navigation"> 
         <xsl:with-param name="prev" select="$prev"/>
         <xsl:with-param name="next" select="$next"/>
        </xsl:call-template>
       <xsl:call-template name="user.footer.navigation"/>
      </body>
     </html>
    </xsl:otherwise>
   </xsl:choose>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

<!-- ==================================================================== -->

<xsl:template match="/">
  <xsl:choose>
    <xsl:when test="$rootid != ''">
      <xsl:choose>
        <xsl:when test="count(id($rootid)) = 0">
          <xsl:message terminate="yes">
            <xsl:text>ID '</xsl:text>
            <xsl:value-of select="$rootid"/>
            <xsl:text>' not found in document.</xsl:text>
          </xsl:message>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="id($rootid)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="set|book|part|chapter|refentry|appendix">
  <xsl:call-template name="process-chunk-element"/>
</xsl:template>

<xsl:template match="sect1|section[local-name(parent::*) != 'section']">
  <xsl:choose>
    <xsl:when test="$chunk.sections = 0">
      <xsl:apply-imports/>
    </xsl:when>
    <xsl:when test="$chunk.first.sections = 0">
      <xsl:choose>
        <xsl:when test="count(preceding-sibling::section) > 0
                        or count(preceding-sibling::sect1) > 0">
          <xsl:call-template name="process-chunk-element"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-imports/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="process-chunk-element"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="glossary|enumset|classset|classtree|classentry|index|method|signal|field|prop|constructor|enum">
  <xsl:call-template name="process-chunk-element"/>
 </xsl:template>

 <xsl:template match="legalnotice" mode="titlepage.mode">
  <xsl:call-template name="process-chunk-element"/>
 </xsl:template>

<!-- ==================================================================== -->

<xsl:template name="in.other.chunk">
  <xsl:param name="chunk" select="."/>
  <xsl:param name="node" select="."/>

  <xsl:variable name="is.chunk">
    <xsl:call-template name="chunk">
      <xsl:with-param name="node" select="$node"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$chunk = $node">0</xsl:when>
    <xsl:when test="$is.chunk = 1">1</xsl:when>
    <xsl:when test="count($node) = 0">0</xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="in.other.chunk">
        <xsl:with-param name="chunk" select="$chunk"/>
        <xsl:with-param name="node" select="$node/parent::*"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="legalnotice" mode="titlepage.mode">
  <xsl:call-template name="process-chunk-element"/>
 </xsl:template>

</xsl:stylesheet>
