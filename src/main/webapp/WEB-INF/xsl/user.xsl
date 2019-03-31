<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
	<xsl:template match="/document">
		<html>
			<body>
				<h2>测试4</h2>
				<table border="1">
					<tbody>
						<tr>
							<th rowspan="2">dtype</th>
							<th rowspan="2">id</th>
							<th rowspan="2">dname</th>
							<th colspan="3">dvalue</th>
						</tr>
						<tr>
							<th>sdId</th> 
							<th>sdStatus</th> 
							<th>sdName</th>
						</tr>
						<xsl:apply-templates select="mts"/>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mts">
		<tr>
			<td rowspan="{@name}">
				<xsl:value-of select="dtype"/>
			</td>
			<td rowspan="{@name}">
				<xsl:value-of select="id"/>
			</td>
			<td rowspan="{@name}">
				<xsl:value-of select="dname"/>
			</td>
		</tr>
		<xsl:apply-templates select="dvalue"/>
	</xsl:template>
	<xsl:template match="dvalue">
		<tr>
			<td>
				<xsl:value-of select="sdId"/>
			</td>
			<td>
				<xsl:value-of select="sdStatus"/>
			</td>
			<td>
				<xsl:value-of select="sdName"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>