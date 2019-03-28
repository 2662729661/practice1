<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
<xsl:template match="/document">
<html>
<body>
<h2>九九乘法表</h2>
<table border="1">
<tbody>
	<tr>
	   <th>fileName</th>
	   <th>metadata</th>
	   <th>filetag</th>
	   <th>fileSize</th>
	   <th>fileHeight</th>
	   <th>filePath</th>
	   <th>businesskey</th>
	   <th>userId</th>
	   <th>fileType</th>
	   <th>fileId</th>
	   <th>fileWidth</th>
	</tr>
    <xsl:apply-templates select="list"/>
</tbody>
</table>
</body>
</html>
</xsl:template>

<xsl:template match="list">
    <tr>
        <td><xsl:value-of select="fileName"/></td>
        <td><xsl:value-of select="metadata"/></td>
        <td><xsl:value-of select="filetag"/></td>
        <td><xsl:value-of select="fileSize"/></td>
        <td><xsl:value-of select="fileHeight"/></td>
        <td><xsl:value-of select="filePath"/></td>
        <td><xsl:value-of select="businesskey"/></td>
        <td><xsl:value-of select="userId"/></td>
        <td><xsl:value-of select="fileType"/></td>
        <td><xsl:value-of select="fileId"/></td>
        <td><xsl:value-of select="fileWidth"/></td>
	</tr>
</xsl:template>

</xsl:stylesheet>