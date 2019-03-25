<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>
        <xsl:template match="/document">
                <html>
                        <body>
                                <h2>九九乘法表</h2>
                                <table border="1">
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
                        <xsl:when test="mt3 = 2">
                                <td>
                                        <xsl:value-of select="mt1"/>&#215;
                                        <xsl:value-of select="mt2"/>
                                        <font color='red'>
                                                <xsl:value-of select="mt3"/>
                                        </font>
                                </td>
                        </xsl:when>
                        <xsl:when test="mt3 = 3">
                                <td>
                                        <xsl:value-of select="mt1"/>&#215;
                                        <xsl:value-of select="mt2"/>
                                        <font color='red'>
                                                <xsl:value-of select="mt3"/>
                                        </font>
                                </td>
                        </xsl:when>
                        <xsl:when test="mt3 = 5">
                                <td>
                                        <xsl:value-of select="mt1"/>&#215;
                                        <xsl:value-of select="mt2"/>
                                        <font color='red'>
                                                <xsl:value-of select="mt3"/>
                                        </font>
                                </td>
                        </xsl:when>
                        <xsl:when test="mt3 = 7">
                                <td>
                                        <xsl:value-of select="mt1"/>&#215;
                                        <xsl:value-of select="mt2"/>
                                        <font color='red'>
                                                <xsl:value-of select="mt3"/>
                                        </font>
                                </td>
                        </xsl:when>
                        <xsl:otherwise>
                                <td>
                                        <xsl:value-of select="mt1"/>&#215;
                                        <xsl:value-of select="mt2"/>
                                        <xsl:value-of select="mt3"/>
                                </td>
                        </xsl:otherwise>
                </xsl:choose>
        </xsl:template>
</xsl:stylesheet>