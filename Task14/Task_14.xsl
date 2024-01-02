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
                <xsl:text>\documentclass{article}</xsl:text>
                <br/>
                <xsl:text>\usepackage[utf-8]{inputenc}</xsl:text>
                <br/>
                <xsl:text>\usepackage{ngerman}</xsl:text>
                <br/>
                <xsl:text>\pagestyle{empty}</xsl:text>
                <br/>
                <xsl:text>\begin{document}</xsl:text>
                <br/>
                <xsl:text>\begin{tabular}{|c|c|c|c|}</xsl:text>
                <br/>
                <xsl:text>\hline</xsl:text>
                <br/>
                <xsl:apply-templates select="//row" />
                <br/>
              <xsl:text>\end{tabular}
                \end{document}</xsl:text>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="row">     
        <br/>
        <xsl:apply-templates select="column"/>
        <xsl:text>\\ \hline</xsl:text>
        <br/>
    </xsl:template>

    <xsl:template match="column">
        <xsl:value-of select="."/>
        <xsl:if test="position() != last()">
            <xsl:text> &amp; </xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
