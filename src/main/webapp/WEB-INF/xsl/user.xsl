<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
	<xsl:template match="/document">
		<html>
			<body>
				<h2>测试3</h2>
				<table border="1">
					<tbody>
						<tr>
							<th>dtype</th>
							<th>id</th>
							<th>dname</th>
							<th colspan="12">dvalue</th>
						</tr>
						<xsl:apply-templates select="mts"/>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mts">
		<tr>
			<td>
				<xsl:value-of select="dtype"/>
			</td>
			<td>
				<xsl:value-of select="id"/>
			</td>
			<td>
				<xsl:value-of select="dname"/>
			</td>
			<xsl:apply-templates select="dvalue"/>
		</tr>
	</xsl:template>
	<xsl:template match="dvalue">
		<td>
			<xsl:value-of select="sdId"/>
		</td>
		<td>
			<xsl:value-of select="sdStatus"/>
		</td>
		<td>
			<xsl:value-of select="sdName"/>
		</td>
	</xsl:template>
</xsl:stylesheet>