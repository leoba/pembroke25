<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:eg="http://www.tei-c.org/ns/Examples"
    xmlns:xd="http://www.pnp-software.com/XSLTdoc" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all">
    
	<xd:doc type="stylesheet">
		<xd:short>
			EN: This file contains a template used to generate automatically text label when the element representing the text has no @n attibute
			IT: Questo file contiene un template utilizzato per generare automaticamente l'etichetta del testo quando l'elemento che rappresenta il testo stesso non ha un attributo @n
		</xd:short>
	</xd:doc>
	
	<xsl:template name="generateTextLabel">
		<xsl:param name="text_id" />
		<xsl:choose>
			<!-- DEFAULT -->
			<xsl:when test="$defaulTextLabel=true()">
				<xsl:value-of select="translate($text_id, '_', ' ')" />		
			</xsl:when>
			
			<!-- CUSTOMIZE -->
			<xsl:otherwise>
				<!-- Custom template for generation of text label -->
				
				<!-- Codice Pelavicino -->
				<xsl:variable name="label_parts" select="tokenize($text_id,'_')" />
				<xsl:variable name="numOrig" select="$label_parts[1]" />
				<xsl:variable name="numNuova" select="$label_parts[2]" />
				
				<xsl:choose>
					<xsl:when test="contains($numOrig, 'bis')">
						<!-- Convenzione decisa con la professoressa Salvatori: 
						     se nella numerazione originale e' presente la scritta 'bis' vuol dire che non c'e' numerazione originale -->
						<xsl:value-of select="$numNuova"></xsl:value-of>
						<xsl:value-of select="' (--)'"></xsl:value-of>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$numNuova"></xsl:value-of>
						<xsl:value-of select="' ('"></xsl:value-of>
						<xsl:value-of select="$numOrig"></xsl:value-of>
						<xsl:value-of select="')'"></xsl:value-of>
					</xsl:otherwise>
				</xsl:choose>
				<!-- End Codice Pelavicino -->
			</xsl:otherwise>
		</xsl:choose>
    </xsl:template>		

	
</xsl:stylesheet>
