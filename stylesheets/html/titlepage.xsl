<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<!-- ********************************************************************
     $Id: titlepage.xsl,v 1.10 2006-04-13 15:29:44 cweiske Exp $
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<!-- ==================================================================== -->

<xsl:attribute-set name="book.titlepage.recto.style"/>
<xsl:attribute-set name="book.titlepage.verso.style"/>

<xsl:attribute-set name="set.titlepage.recto.style"/>
<xsl:attribute-set name="set.titlepage.verso.style"/>

<xsl:attribute-set name="part.titlepage.recto.style"/>
<xsl:attribute-set name="part.titlepage.verso.style"/>

<xsl:attribute-set name="partintro.titlepage.recto.style"/>
<xsl:attribute-set name="partintro.titlepage.verso.style"/>

<xsl:attribute-set name="reference.titlepage.recto.style"/>
<xsl:attribute-set name="reference.titlepage.verso.style"/>

<xsl:attribute-set name="chapter.titlepage.recto.style"/>
<xsl:attribute-set name="chapter.titlepage.verso.style"/>

<xsl:attribute-set name="appendix.titlepage.recto.style"/>
<xsl:attribute-set name="appendix.titlepage.verso.style"/>

<xsl:attribute-set name="sect1.titlepage.recto.style"/>
<xsl:attribute-set name="sect1.titlepage.verso.style"/>

<xsl:attribute-set name="sect2.titlepage.recto.style"/>
<xsl:attribute-set name="sect2.titlepage.verso.style"/>

<xsl:attribute-set name="table.of.contents.titlepage.recto.style"/>
<xsl:attribute-set name="table.of.contents.titlepage.verso.style"/>

<xsl:attribute-set name="list.of.tables.titlepage.recto.style"/>
<xsl:attribute-set name="list.of.tables.contents.titlepage.verso.style"/>

<xsl:attribute-set name="list.of.figures.titlepage.recto.style"/>
<xsl:attribute-set name="list.of.figures.contents.titlepage.verso.style"/>

<xsl:attribute-set name="list.of.examples.titlepage.recto.style"/>
<xsl:attribute-set name="list.of.examples.contents.titlepage.verso.style"/>

<!-- ==================================================================== -->

<xsl:template match="*" mode="titlepage.mode">
  <!-- if an element isn't found in this mode, try the default mode -->
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="abbrev" mode="titlepage.mode">
  <span class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:call-template name="output.br" />
  </span>
</xsl:template>

 <xsl:template name="authorgroup-title">
  <xsl:param name="id"></xsl:param>
  <xsl:choose>
   <xsl:when test="$id='appendix.credits.authors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKauths</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.credits.contributors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKcons</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.credits.pastcontributors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKconsp</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='editors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">editedby</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='translators'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">translatedby</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.doccredits.authors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKmanauths</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.doccredits.editors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKeditors</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.doccredits.translators'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">translatedby</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.doccredits.pastauthors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKmanauthsp</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:when test="$id='appendix.doccredits.pasteditors'">
      <xsl:call-template name="gentext">
       <xsl:with-param name="key">PHPGTKeditorsp</xsl:with-param>
      </xsl:call-template>
   </xsl:when>
   <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template match="authorgroup" mode="titlepage.mode">
  <b>
   <xsl:call-template name="authorgroup-title">
    <xsl:with-param name="id">
     <xsl:value-of select="@id" />
    </xsl:with-param>
   </xsl:call-template>
  </b>
  <xsl:apply-templates mode="titlepage.mode" />
  <xsl:if test="@id='authors'">
   <div xsl:use-attribute-sets="book.titlepage.recto.style">
    <a>
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="//appendix[@id='appendix.doccredits']"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:text>et al</xsl:text>
    </a>
    <br />
   </div>
  </xsl:if>
  <br />
 </xsl:template>

 <xsl:template match="authorgroup">
  <xsl:choose>
   <xsl:when test = "ancestor::appendix[@rtl='1']">
    <div dir="rtl">
     <b>
      <xsl:call-template name="authorgroup-title">
       <xsl:with-param name="id">
        <xsl:value-of select="@id" />
       </xsl:with-param>
      </xsl:call-template>
     </b>
     <xsl:apply-templates mode="titlepage.mode" />
     <br />
    </div>
   </xsl:when>
   <xsl:otherwise>
    <div dir="ltr">
     <b>
      <xsl:call-template name="authorgroup-title">
       <xsl:with-param name="id">
        <xsl:value-of select="@id" />
       </xsl:with-param>
      </xsl:call-template>
     </b>
     <xsl:apply-templates mode="titlepage.mode" />
     <br />
    </div>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
 
 <xsl:template match="author" mode="titlepage.mode">
  <div xsl:use-attribute-sets="book.titlepage.recto.style">
   <xsl:call-template name="editor-author-text" />
  </div>
 </xsl:template>

 <xsl:template match="editor/contrib|author/contrib" mode="titlepage.mode">
  <xsl:text> : </xsl:text><xsl:apply-templates mode="titlepage.mode" />
 </xsl:template>

<xsl:template match="authorinitials" mode="titlepage.mode">
  <span class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:call-template name="output.br" />
  </span>
</xsl:template>

<xsl:template match="contrib" mode="titlepage.mode">
  <span class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:call-template name="output.br" />
  </span>
</xsl:template>

<xsl:template match="copyright" mode="titlepage.mode">
  <xsl:variable name="years" select="year"/>
  <xsl:variable name="holders" select="holder"/>

  <p class="{name(.)}">
    <a>
     <xsl:attribute name="href">
      <xsl:call-template name="href.target">
       <xsl:with-param name="object" select="//legalnotice[@id='copyright']"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:call-template name="gentext.element.name"/>
    </a>
    <xsl:call-template name="gentext.space"/>
    <xsl:call-template name="dingbat">
      <xsl:with-param name="dingbat">copyright</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="gentext.space"/>
    <xsl:apply-templates select="$years" mode="titlepage.mode"/>
    <xsl:call-template name="gentext.space"/>
    <xsl:apply-templates select="$holders" mode="titlepage.mode"/>
  </p>
</xsl:template>

<xsl:template match="year" mode="titlepage.mode">
  <xsl:apply-templates/><xsl:text>, </xsl:text>
</xsl:template>

<xsl:template match="year[position()=last()]" mode="titlepage.mode">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="holder" mode="titlepage.mode">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="corpauthor" mode="titlepage.mode">
  <h3 class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
  </h3>
</xsl:template>

<xsl:template match="corpname" mode="titlepage.mode">
  <span class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:call-template name="output.br" />
  </span>
</xsl:template>

<xsl:template match="date" mode="titlepage.mode">
  <span class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:call-template name="output.br" />
  </span>
</xsl:template>

 <xsl:template name="editor-author-text" >
  <xsl:apply-templates select="honorific|firstname|othername|surname|lineage"  mode="titlepage.mode" />
  <xsl:if test="count(ancestor::appendix)>0">
   <xsl:apply-templates select="contrib" mode="titlepage.mode" />
  </xsl:if>
 </xsl:template>

 <xsl:template match="editor" mode="titlepage.mode">
  <div xsl:use-attribute-sets="book.titlepage.recto.style">
   <xsl:if test="count(preceding-sibling::node())=0">
    <h2>
     <xsl:call-template name="gentext">
      <xsl:with-param name="key">editedby</xsl:with-param>
     </xsl:call-template>
    </h2>
   </xsl:if>
   <xsl:call-template name="editor-author-text"  />
  </div>
 </xsl:template>

 <xsl:template match="firstname" mode="titlepage.mode">
  <xsl:value-of select="." /><xsl:text> </xsl:text>
  <xsl:value-of select="following-sibling::surname" />
 </xsl:template>

<xsl:template match="graphic" mode="titlepage.mode">
  <!-- use the normal graphic handling code -->
  <xsl:apply-templates select="."/>
</xsl:template>

<xsl:template match="honorific" mode="titlepage.mode">
  <span class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:call-template name="output.br" />
  </span>
</xsl:template>

<xsl:template match="keywordset" mode="titlepage.mode">
</xsl:template>

<xsl:template match="legalnotice " mode="titlepage.mode">
  <div class="{local-name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
  </div>
</xsl:template>

<xsl:template match="legalnotice/title" mode="titlepage.mode">
  <p class="legalnotice-title"><b><xsl:apply-templates/></b></p>
</xsl:template>

<xsl:template match="pubdate" mode="titlepage.mode">
  <p class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
  </p>
</xsl:template>

<xsl:template match="subtitle" mode="titlepage.mode">
  <h2 class="{name(.)}">
    <xsl:apply-templates mode="titlepage.mode"/>
  </h2>
</xsl:template>

 <xsl:template match="surname" mode="titlepage.mode" />

<xsl:template match="title" mode="titlepage.mode">
  <xsl:variable name="id">
    <xsl:choose>
      <!-- if title is in an *info wrapper, get the grandparent -->
      <xsl:when test="contains(local-name(..), 'info')">
        <xsl:call-template name="object.id">
          <xsl:with-param name="object" select="../.."/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="object.id">
          <xsl:with-param name="object" select=".."/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <h1 class="{name(.)}">
    <a name="{$id}" id="{$id}-title"/>
    <xsl:apply-templates mode="titlepage.mode"/>
  </h1>
</xsl:template>

</xsl:stylesheet>
