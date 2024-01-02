<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Rockville opens new Library</title>
            </head>
            <body>
                <xsl:apply-templates select="//text"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="text">
        <xsl:variable name="tagName" select="@style"/>
        <xsl:element name="{$tagName}">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
