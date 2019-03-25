<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output version="1.0" indent="yes" encoding="UTF-8" method="html"/>

        <xsl:template match="/">
                <html>
                        <body>
                                <h2>九九乘法表2</h2>
                                <table border="111">
                                        <tbody>
                                                <xsl:apply-templates select="document"/>
                                        </tbody>
                                </table>
                        </body>
                </html>
        </xsl:template>

        <xsl:template match="document">
                <xsl:apply-templates select="mts"/>
        </xsl:template>

        <xsl:template match="mts">
                <tr>
                        <xsl:apply-templates select="ms"/>
                </tr>
        </xsl:template>

        <xsl:template match="ms">
                <td>
                        <xsl:value-of select="mt"/>&#215;
                        <xsl:value-of select="mt1"/>
                        <xsl:value-of select="mt2"/>
                </td>
        </xsl:template>

</xsl:stylesheet>