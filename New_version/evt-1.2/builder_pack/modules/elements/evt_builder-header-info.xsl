<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Copyright (C) 2013-2017 the EVT Development Team.
    
    EVT 1 is free software: you can redistribute it 
    and/or modify it under the terms of the 
    GNU General Public License version 2
    available in the LICENSE file (or see <http://www.gnu.org/licenses/>).
    
    EVT 1 is distributed in the hope that it will be useful, 
    but WITHOUT ANY WARRANTY; without even the implied 
    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
    See the GNU General Public License for more details. 
-->
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
			EN: This file collects functions and templates to tranform information encoded in teiHeader element
			IT: Questo file è una collezione di funzioni e template per trasformare le informazioni codificate nel teiHeader
		</xd:short>
	</xd:doc>
	<xsl:template match="tei:teiHeader">
		<div id="headerInfo_nav_tabs">
			<li data-tab="#generalInfo_tab">
				<a href="javascript:void(0)" lang="def" title="GENERAL_INFORMATION">
					<span lang="def">GENERAL_INFORMATION</span>
				</a>
			</li>
			
			<xsl:if test="tei:fileDesc/publicationStmt">
				<li data-tab="#publicationInfo_tab"> 
					<a href="javascript:void(0)" lang="def" title="PUBLICATION_INFORMATION">
						<span lang="def">PUBLICATION_INFORMATION</span>							
					</a>
				</li>
			</xsl:if>
			<xsl:if test="tei:encodingDesc">
				<li data-tab="#projectDesc_tab">
					<a href="javascript:void(0)" lang="def" title="PROJECT_DESCRIPTION">				
						<span lang="def">PROJECT_DESCRIPTION</span>															
					</a>
				</li>
			</xsl:if>
			<xsl:if test="tei:profileDesc">
				<li data-tab="#profileDesc_tab">
					<a href="javascript:void(0)" lang="def" title="PROFILE_DESCRIPTION">				
						<span lang="def">PROFILE_DESCRIPTION</span>															
					</a>
				</li>
			</xsl:if>
			<xsl:if test="tei:revisionDesc">
				<li data-tab="#revisions_tab">
					<a href="javascript:void(0)" lang="def" title="REVISIONS">				
						<span lang="def">REVISIONS</span>															
					</a>
				</li>
			</xsl:if>
			<li data-tab="#evtInfo_tab">
				<a href="javascript:void(0)" lang="def" title="EVT_INFORMATION">
					<span lang="def">EVT_INFORMATION</span>
				</a>
			</li>
		</div>
		
		<div id="headerInfo_box_tabs">
			<div id="evtInfo_tab" class="box_tab">
				<xsl:copy-of select="$evtTxt"/>	
			</div>
			
			<div id="generalInfo_tab" class="box_tab">
				<xsl:if test="tei:fileDesc/tei:titleStmt/tei:title">
					<div>
						<p class="title"><span lang="def">TITLE</span></p>
						<p class="information"><xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:title"/></p>
					</div>
				</xsl:if>
				<xsl:if test="tei:fileDesc//author and tei:fileDesc//author/normalize-space() != ''">
					<div>
						<p class="title"><span lang="def">TEXT_AUTHOR</span></p>
						<p class="information"><xsl:apply-templates select="tei:fileDesc//author"/></p>		
					</div>
				</xsl:if>
				<xsl:if test="tei:fileDesc//principal and tei:fileDesc//principal/normalize-space() != ''">
					<div>
						<p class="title"><span lang="def">PRINCIPAL_INVESTIGATOR</span></p>
						<p class="information"><xsl:apply-templates select="tei:fileDesc//principal"/></p>	
					</div>
				</xsl:if>
				<xsl:if test="tei:fileDesc//respStmt">
					<xsl:for-each select="tei:fileDesc//respStmt">
						<div>
							<p class="title">
								<xsl:variable name="resp" select="tei:resp"/>
								<xsl:value-of select="translate(normalize-space(translate($resp,':','  ')),':','  ')"/>
							</p>
							<p class="information">
								<xsl:for-each select="tei:name">
									<xsl:value-of select="."/>
									<xsl:if test="position() != last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</p>
						</div>
					</xsl:for-each>
				</xsl:if>				
			</div>
			
			<div id="publicationInfo_tab" class="box_tab">
				<xsl:if test="tei:fileDesc//authority and tei:fileDesc//authority/normalize-space() != ''">
					<div>
						<p class="title"><span lang="def">AUTORITY</span></p>
						<p class="information"><xsl:apply-templates select="tei:fileDesc//authority"/></p>						
					</div>
				</xsl:if>
				<xsl:if test="tei:fileDesc//publisher and tei:fileDesc//publisher/normalize-space() != ''">
					<div>
						<p class="title"><span lang="def">PUBLISHER</span></p>
						<p class="information"><xsl:apply-templates select="tei:fileDesc//publisher"/></p>						
					</div>
				</xsl:if>
				<xsl:if test=" tei:fileDesc//pubPlace and tei:fileDesc//pubPlace/normalize-space() != ''">
					<div>
						<p class="title"><span lang="def">PUBLICATION_PLACE</span></p>
						<p class="information"><xsl:apply-templates select="tei:fileDesc//pubPlace"/></p>
					</div>
				</xsl:if>
				<xsl:if test="tei:fileDesc//date">
					<div>
						<p class="title"><span lang="def">DATE</span></p>
						<p class="information"><xsl:apply-templates select="tei:fileDesc//date"/></p>
					</div>
				</xsl:if>    
				<xsl:if test="tei:fileDesc//availability and tei:fileDesc//availability/normalize-space() != ''">
					<div>
						<p class="title"><span lang="def">AVAILABILITY</span></p>
						<p class="information"><xsl:value-of select="tei:fileDesc//availability"/></p>
					</div>
				</xsl:if>				
			</div>
			
			<div id="projectDesc_tab" class="box_tab">
				<p>Originally supported by a major grant from the National Endowment for the
					Humanities, the project now continues as a collaborative effort by a dozen
					scholars to transcribe one of the most significant Latin manuscripts of the Late
					Anglo-Saxon period. Pembroke College 25, Cambridge, contains ninety-six Latin
					sermons composed on the continent in the ninth century. It is the earliest and
					best surviving witness to a sermon collection known as the Homiliary of
					Saint-Père de Chartres. As the basis for writing sermons in Old English to be
					preached to the laity, Pembroke 25 bridges the worlds of Carolingian and
					Anglo-Saxon learning and dramatizes the close interrelations between Latin and
					Old English literature. Though recognized as a crucial document of Carolingian
					intellectual history and of late Anglo-Saxon preaching some sixty of its
					ninety-six texts remain unpublished and unstudied. In its current physical state
					Pembroke 25 is fragile, requiring special care and limited access </p>
				<p><a target="new" href="https://drive.google.com/file/d/0B2aTLxlvC6kUelM3NGY0RFdfdkk/view?usp=sharing">Cambridge, Pembroke College 25: The Manuscript and Its Historical Context</a>, by Rebecca Rushforth</p>
				<p><a target="new" href="https://drive.google.com/file/d/0B2aTLxlvC6kUVFM1ZDdvVEtWTGs/view?usp=sharing">The Sources of the Pembroke 25 Homiliary</a>, by Thomas N. Hall</p>
				<p>The Schoenberg Institute for Manuscript Studies (University of Pennsylvania) is
					the home for this project. The project has the support of Pembroke College,
					Cambridge.</p>
			</div>
			
			<div id="profileDesc_tab" class="box_tab">
				<xsl:if test="tei:profileDesc/langUsage and tei:profileDesc/langUsage/normalize-space() != ''">
					<p class="title"><span lang="def">LANGUAGE</span></p>
					<p class="information"><xsl:apply-templates select="tei:profileDesc/langUsage"/></p>	
				</xsl:if>
				<xsl:if test="tei:profileDesc/textDesc and tei:profileDesc/textDesc/normalize-space() != ''">
					<p class="title"><span lang="def">TEXT_DESCRIPTION</span></p>
					<p class="information"><xsl:apply-templates select="tei:profileDesc/textDesc"/></p>	
				</xsl:if>
				<xsl:if test="tei:profileDesc/textDesc and tei:profileDesc/settingDesc/normalize-space() != ''">
					<p class="title"><span lang="def">SETTING_DESCRIPTION</span></p>
					<p class="information"><xsl:apply-templates select="tei:profileDesc/settingDesc"/></p>	
				</xsl:if>				
			</div>
			
			<div id="revisions_tab" class="box_tab">
				<xsl:if test="tei:revisionDesc and tei:revisionDesc/normalize-space() != ''">
					<p class="title"><span lang="def">REVISIONS</span></p>
					<ul class="information">
						<xsl:for-each select="tei:revisionDesc/change">							
							<li>
								<xsl:value-of select="@when , @who"/><xsl:text>: </xsl:text>
								<xsl:for-each select="node()">
									<xsl:value-of select="."/>
									<xsl:if test="position() = last()">
										<xsl:text>.</xsl:text>
									</xsl:if>
								</xsl:for-each>
							</li>
						</xsl:for-each>    
					</ul>	
				</xsl:if>				
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
