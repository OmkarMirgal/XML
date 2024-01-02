<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zoo="urn:myspace:vsrzoo" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

<xsl:template match="/">
    <html lang="en">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Animals in Zoo "vsr zoo"</title>
        </head>
        <body>
            <h1>Animals in Zoo "vsr zoo"</h1>
            <table border="1">
                <tr>
                    <th>Number</th>
                    <th>Animal</th>
                    <th>ID</th>
                    <th>Age</th>
                    <th>Gestation Period</th>
                    <th>Remarks</th>
                </tr>
                <xsl:for-each select="//zoo:zoo_animal">
                    <tr>
                        <td><xsl:value-of select="position()" /></td>
                        <td><xsl:value-of select="zoo:name" /></td>
                        <td><xsl:value-of select="@id" /></td>
                        <td><xsl:value-of select="zoo:age" /></td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="not(zoo:gestation_period)">N/A</xsl:when>
                                <xsl:otherwise><xsl:value-of select="zoo:gestation_period" /></xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="@xsi:type='goose_ct'">
                                    <xsl:text>Slaughter Weight:: </xsl:text>
                                    <xsl:value-of select="zoo:slaughter_weight" />
                                    <xsl:text>g</xsl:text>    
                                </xsl:when>
                                <xsl:when test="@xsi:type='horse_ct'">
                                    <xsl:choose>
                                        <xsl:when test="@white_horse='true'">yes White Horse</xsl:when>
                                        <xsl:when test="@white_horse!='true'">no White Horse</xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="@xsi:type='cat_ct'">
                                    <xsl:value-of select="zoo:fur_color" />
                                </xsl:when>
                                <xsl:when test="@xsi:type='starling_ct'">
                                    <xsl:choose>
                                        <xsl:when test="@ringed='true'">ringed</xsl:when>
                                        <xsl:when test="@ringed!='true'">not ringed</xsl:when>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:otherwise>None</xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>