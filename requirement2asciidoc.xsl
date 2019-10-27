<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:req="http://www.polarsys.org/capella/core/requirement/1.3.0">
  <xsl:output 
    method="text"
    encoding="UTF-8"
    indent="no"
    omit-xml-declaration="yes"
    />
  <xsl:template name="title-level">
    <xsl:param name="level" />
<xsl:if test="$level &gt;= 0">=<xsl:call-template name="title-level"><xsl:with-param name="level" select="$level - 1"/></xsl:call-template></xsl:if>
  </xsl:template>

  <xsl:template name="req_pkg" ><xsl:if test="@level != 0">[[<xsl:value-of select="@name" />]]
</xsl:if><xsl:call-template name="title-level"><xsl:with-param name="level" select="@level"/></xsl:call-template><xsl:text> </xsl:text><xsl:value-of select="@description" /><xsl:text>
</xsl:text><xsl:if test="@level = 0">:doctype: book
:toc:
:title-page:
:sectnums:
:chapter-label: Chapitre
:section-label: Article
:toc-title: Table des matières
:pdf-page-size: A4
</xsl:if><xsl:text>

</xsl:text>
    <xsl:for-each select="ownedRequirements">
      <xsl:value-of select="@description" /><xsl:text>
</xsl:text>
    </xsl:for-each><xsl:text>

</xsl:text>
<xsl:for-each select="ownedRequirementPkgs">
      <xsl:call-template name="req_pkg" /><xsl:text>
</xsl:text>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="req:RequirementsPkg">
    <xsl:call-template name="req_pkg" />
    <xsl:text>Converted by requirements2markdown.xsl</xsl:text>
  </xsl:template>
</xsl:stylesheet>
