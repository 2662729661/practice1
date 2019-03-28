<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
	<xsl:template match="/document">
		<html>
			<body>
				<h2>测试2</h2>
				<table border="1">
					<tbody>
						<tr>
							<th>templateParameter</th>
							<th>templateName</th>
							<th>templateFileId</th>
							<th>siteId</th>
							<th>templateId</th>
						</tr>
						<xsl:apply-templates select="list"/>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="list">
		<tr>
			<td>
				<xsl:value-of select="templateParameter"/>
			</td>
			<td>
				<xsl:value-of select="templateName"/>
			</td>
			<td>
				<xsl:value-of select="templateFileId"/>
			</td>
			<td>
				<xsl:value-of select="siteId"/>
			</td>
			<td>
				<xsl:value-of select="templateId"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>