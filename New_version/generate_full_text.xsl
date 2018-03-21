<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="#default xi">
    
    <xsl:variable name="count" />
   
    <xsl:template match="/">
        <xsl:result-document href="P25-full.xml">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <!--<xsl:template match="*:pb">
        <xsl:variable name="pb_id" select="concat(@xml:id,count(preceding-sibling::*:pb))"/>
        <xsl:element name="pb">
            <xsl:attribute name="n" select="@n"/>
            <xsl:attribute name="xml:id" select="$pb_id"/>
        </xsl:element>
    </xsl:template>-->
    
</xsl:stylesheet>
