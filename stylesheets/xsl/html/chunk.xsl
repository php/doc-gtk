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


  <xsl:if test="$suppress.navigation = '0'">
    <div class="navheader">
      <table width="100%">
        <tr>
          <th colspan="3" align="center">
            <xsl:apply-templates select="." mode="title.ref"/>
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
                <xsl:call-template name="gentext.nav.prev"/>
              </a>
            </xsl:if>
            <xsl:text>&#160;</xsl:text>
          </td>
          <th width="60%" align="center">
            <xsl:choose>
              <xsl:when test="count($up) > 0 and $up != $home">
                <xsl:apply-templates select="$up" mode="title.ref"/>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
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
                <xsl:call-template name="gentext.nav.next"/>
              </a>
            </xsl:if>
          </td>
        </tr>
      </table>
      <hr/>
    </div>
  </xsl:if>
</xsl:template>


<xsl:template name="footer.navigation">
  <xsl:param name="prev" select="/foo"/>
  <xsl:param name="next" select="/foo"/>
  <xsl:param name="up" select="parent::*"/>
  <xsl:variable name="home" select="/*[1]"/>

  <xsl:if test="$suppress.navigation = '0'">
    <div class="navfooter">
      <hr/>
      <table width="100%">
        <tr>
          <td width="40%" align="left">
            <xsl:if test="count($prev)>0">
              <a>
                <xsl:attribute name="href">
                  <xsl:call-template name="href.target">
                    <xsl:with-param name="object" select="$prev"/>
                  </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="gentext.nav.prev"/>
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
                  <xsl:call-template name="gentext.nav.home"/>
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
                <xsl:call-template name="gentext.nav.next"/>
              </a>
            </xsl:if>
          </td>
        </tr>

        <tr>
          <td width="40%" align="left">
            <xsl:apply-templates select="$prev" mode="title.ref"/>
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
                  <xsl:call-template name="gentext.nav.up"/>
                </a>
              </xsl:when>
              <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
          </td>
          <td width="40%" align="right">
            <xsl:text>&#160;</xsl:text>
            <xsl:apply-templates select="$next" mode="title.ref"/>
          </td>
        </tr>
      </table>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template name="chunk-element-content">
  <xsl:param name="prev"></xsl:param>
  <xsl:param name="next"></xsl:param>
  <xsl:param name="up" select="parent::*"></xsl:param>
  <html>
    <xsl:call-template name="html.head">
      <xsl:with-param name="prev" select="$prev"/>
      <xsl:with-param name="next" select="$next"/>
      <xsl:with-param name="up" select="$up"/>
    </xsl:call-template>

    <body xsl:use-attribute-sets="body.attrs">
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
    </body>
  </html>
</xsl:template>



</xsl:stylesheet>