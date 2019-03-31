<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
	<xsl:template match="/document">
		<html>
			<body>
				<h2>测试4</h2>
				<table border="1" cellspacing="0">
					<tbody>
						<xsl:apply-templates select="mts"/>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="mts">
		<tr>
			<xsl:apply-templates select="ms"/>
		</tr>
	</xsl:template>

	<xsl:template match="ms">
		<xsl:choose>
			<xsl:when test="@name">
				<td colspan="{@name}"></td>
			</xsl:when>
			<xsl:when test="@value">
				<td>
					<xsl:value-of select="key3"/>&#32;=&#32;
					<xsl:value-of select="key2"/>&#32;&#215;&#32;
					<xsl:value-of select="key1"/>
				</td>
			</xsl:when>
			<xsl:otherwise>
				<td>
					<xsl:value-of select="key1"/>&#32;&#215;&#32;
					<xsl:value-of select="key2"/>&#32;=&#32;
					<xsl:value-of select="key3"/>
				</td>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>