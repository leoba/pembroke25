<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.tei-c.org/ns/1.0"
     exclude-result-prefixes="#default">
   
    <xsl:template match="/">
        <xsl:variable name="path_to_filename" select="document-uri(/)"/>
        <xsl:variable name="filename" select="tokenize($path_to_filename, '/')[position() = last()]"/>
        <xsl:result-document href="new-{$filename}">
            <xsl:apply-templates/>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="*:lb">
        <xsl:variable name="base" select="preceding::*:lb[@n][1]"/>
        <xsl:variable name="no" select="$base/@n + count(preceding::*:lb) - count($base/preceding::*:lb)"/>
        <xsl:element name="lb">
            <xsl:attribute name="n"><xsl:choose>
                <xsl:when test="not(preceding-sibling::*:lb)"><xsl:value-of select="@n"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="$no"/></xsl:otherwise>
            </xsl:choose></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
        
            

</xsl:stylesheet>
