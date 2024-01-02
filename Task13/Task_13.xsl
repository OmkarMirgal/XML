<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Candidates and their points</title>
            </head>
            <body>
                <h1>Candidates and their points</h1>
                <xsl:apply-templates select="//candidate" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="candidate">
        <ul>
            <div style="display: inline-block; width:45px;"><xsl:value-of select="name"/></div>
            <div>
                <xsl:attribute name="style">
                    <xsl:text>display: inline-block; width:</xsl:text>
                    <xsl:value-of select="points"/>
                    <xsl:text>px; background-color: blue; color: white; text-align: center; padding: 5px;</xsl:text>
                </xsl:attribute>  
                <xsl:value-of select="points"/>
            </div>
        </ul>
    </xsl:template>

</xsl:stylesheet>
