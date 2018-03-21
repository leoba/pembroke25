<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
       <xsl:result-document href="P25_facs.xml">
       <TEI>
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>Pembroke 25 Facsimile Section</title>
                    
                </titleStmt>
                <editionStmt>
                    <edition><date>2015-09-26T03:10:00</date></edition>
                </editionStmt>
                <publicationStmt>
                    <p>no publication statement available</p>
                </publicationStmt>
                <sourceDesc>
                    <p>Written by OpenOffice</p>
                </sourceDesc>
            </fileDesc>
            <revisionDesc>
                <listChange>
                    <change><name>Porter, Dot</name><date>2017-08-23T18:51:00</date></change>
                </listChange>
            </revisionDesc>
        </teiHeader>
           
           <facsimile xml:id="p25_facs"><xsl:for-each select="//tei:pb">
               <xsl:variable name="id" select="@xml:id"/>
               <xsl:variable name="fol" select="tokenize($id,'_')[position() = last()]"/>
               <xsl:variable name="file_name" select="concat($id,'.jpg')"/>
            <xsl:if test="not(contains($id,'a'))"><surface xml:id="P25_surf_{$fol}" corresp="#{$id}">
                <graphic url="../images/single/{$file_name}"/>
            </surface></xsl:if></xsl:for-each>
        </facsimile>
        </TEI>
        </xsl:result-document>
        
    </xsl:template>
</xsl:stylesheet>