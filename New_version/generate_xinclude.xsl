<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="/">
       <xsl:result-document href="P25_xinclude.xml">
       <TEI>
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>Pembroke 25 Complete Manuscript</title>
                    
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
           <facsimile>
               <xsl:element name="xi:include">
                   <xsl:attribute name="href">P25_facs.xml</xsl:attribute>
                   <xsl:attribute name="xpointer">p25_facs</xsl:attribute>
               </xsl:element>
           </facsimile>
           <text><group>
               <xsl:for-each select="collection(iri-to-uri('../New_version/transcriptions/TEI/?select=*.xml;recurse=yes'))">
                   <xsl:variable name="path_to_filename" select="document-uri(/)"/>
                   <xsl:variable name="filename" select="tokenize($path_to_filename,'/')[position() = last()]"/>
                   <xsl:variable name="xpointer" select="//tei:text/@xml:id"/>
                   <xsl:element name="xi:include">
                       <xsl:attribute name="href" select="$filename"/>
                       <xsl:attribute name="xpointer" select="$xpointer"></xsl:attribute>
                   </xsl:element>
               </xsl:for-each>
           </group>
        </text>
        </TEI>
        </xsl:result-document>
        
    </xsl:template>
</xsl:stylesheet>