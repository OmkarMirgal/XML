<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:del="urn:myspace:deliveries">

<xsl:key name="item_name" match="//del:article" use="del:name" />

<xsl:template match="/">
    <html lang="en">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Articles with same Name but different ID</title>
        </head>
        <body>
            <h1>Articles with same Name but different ID</h1>
            <h4>The following name-pairs were found: </h4>
            <xsl:for-each select="//del:article[generate-id() = generate-id(key('item_name', del:name)[1])]">
                <xsl:variable name="currentName" select="del:name"/>
                <xsl:text> Name = </xsl:text>
                <xsl:value-of select="$currentName"/>

               <xsl:for-each select="key('item_name', $currentName)">    
                    <xsl:text> ; supplier = Fa. </xsl:text>
                    <xsl:value-of select="del:supplier"/>
                    <xsl:text> ; ID = </xsl:text>
                    <xsl:value-of select="@id"/>
                </xsl:for-each>

                <br/>
            </xsl:for-each>

            


        </body>
    </html>
</xsl:template>

</xsl:stylesheet>