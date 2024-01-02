<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:del="urn:myspace:deliveries">

<xsl:key name="supplier-items" match="//*[local-name()='article']" use="*[local-name()='supplier']" />

<xsl:template match="/">

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Supplier Items </title>
</head>
<body>
    <h1>Supplier</h1>
     
    <xsl:for-each select="//*[local-name()='article'][generate-id() = generate-id(key('supplier-items', *[local-name()='supplier'])[1] )]">
        
        <xsl:variable name="currentsupplier" select="*[local-name()='supplier']" />
        <xsl:text> Fa. </xsl:text>
        <xsl:value-of select="$currentsupplier" />
        <xsl:text> supplies : </xsl:text>

        <xsl:for-each select="key('supplier-items', *[local-name()='supplier'])">
            <xsl:value-of select="*[local-name()='name']" />
            <xsl:if test="position() != last()">
                <xsl:text> , </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <br></br>

    </xsl:for-each>
    
    
    
    
    
    <!-- <ul>
        <xsl:for-each select="//*[local-name()='article']">
            <li>Fa. <xsl:value-of select="*[local-name()='supplier']"/> : </li>
        </xsl:for-each>
    </ul> -->
        
</body>
</html>

</xsl:template>
</xsl:stylesheet>
