<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Numbers</title>
            </head>
            <body>
                <h1>Numbers</h1>
                <xsl:apply-templates select="//number" />
            </body>
        </html>
    </xsl:template>


    <xsl:template match="number">
        <xsl:variable name="times" select="@value"/>
        <br/>
        <xsl:call-template name="repeat">
            <xsl:with-param name="value" select="$times"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="repeat">
        <xsl:param name="value"/>
        <xsl:if test="$value > 0">
            <xsl:value-of select="@value"/>
            <xsl:text> </xsl:text>
            <!-- Recursive call to repeat the value -->
            <xsl:call-template name="repeat">
                <xsl:with-param name="value" select="$value - 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
