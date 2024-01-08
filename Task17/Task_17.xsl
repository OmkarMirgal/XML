<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Task_17</title>
    </head>
    <body>
        <rss>
            <xsl:apply-templates select="//chapter"/>
        </rss>  
    </body>
    </html>
</xsl:template>

<xsl:template match="chapter">
    <xsl:variable name="titleName" select="@title"/>
    
    <xsl:element name="chapter">
        <xsl:value-of select="$titleName"/>
    </xsl:element>
    <xsl:element name="description">
        <xsl:apply-templates select="text"/>
    </xsl:element>
    <br/>

</xsl:template>

<xsl:template match="text">
        <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>