<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
<xsl:template match="/document">
<html>
<body>
<h2>测试1</h2>
<table border="1">
<tbody>  
	<tr>
	   <th>dataUrl</th>
	   <th>htmlFileId</th>
	   <th>pageAliase</th>
	   <th>pageTemplate</th>
	   <th>pageCreateTime</th>
	   <th>pageWebPath</th>
	   <th>pageParameter</th>
	   <th>pageId</th>
	   <th>templateId</th>
	   <th>pageName</th>
	   <th>pageHtml</th>
	   <th>pagePhysicalPath</th>
	   <th>pageStatus</th>
	   <th>pageType</th>
	   <th>pageParams</th>
	   <th>siteId</th>
	</tr>
    <xsl:apply-templates select="list"/>   
</tbody>
</table>
</body>
</html>
</xsl:template>

<xsl:template match="list">
    <tr>
        <td><xsl:value-of select="dataUrl"/></td>
        <td><xsl:value-of select="htmlFileId"/></td>
        <td><xsl:value-of select="pageAliase"/></td>
        <td><xsl:value-of select="pageTemplate"/></td>
        <td><xsl:value-of select="pageCreateTime"/></td>
        <td><xsl:value-of select="pageWebPath"/></td>
        <td><xsl:value-of select="pageParameter"/></td>
        <td><xsl:value-of select="pageId"/></td>
        <td><xsl:value-of select="templateId"/></td>
        <td><xsl:value-of select="pageName"/></td>
        <td><xsl:value-of select="pageHtml"/></td>
        <td><xsl:value-of select="pagePhysicalPath"/></td>
        <td><xsl:value-of select="pageStatus"/></td>
        <td><xsl:value-of select="pageType"/></td>
        <td><xsl:value-of select="pageParams"/></td>
        <td><xsl:value-of select="siteId"/></td>
	</tr>
</xsl:template>

</xsl:stylesheet>