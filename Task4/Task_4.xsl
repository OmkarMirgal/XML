<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:del="urn:myspace:deliveries">
<xsl:template match="/">
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Deliveries Table</title>
    </head>
    <body>
        <h1>Deliveries</h1>
        <table border="1">
            <tr>
                <th>Number</th>
                <th>Article</th>
                <th>Price</th>
                <th>Supplier</th>
            </tr>
            
            <!-- approach 1 without namespace-->
            <xsl:for-each select="//*[local-name()='article']">
                <xsl:sort select="*[local-name()='price']" order="descending" data-type="number"/>
                <tr>
                    <td><xsl:value-of select="@id"/></td>
                    <td><xsl:value-of select="*[local-name()='name']"/></td>
                    <td><xsl:value-of select="*[local-name()='price']"/>
                    <xsl:choose>
                        <xsl:when test="*[local-name()='price']/@unitprice='true'"> (per p)</xsl:when>
                        <xsl:when test="*[local-name()='price']/@unitprice='false'"> (per kg)</xsl:when>
                        <xsl:otherwise> (N/A)</xsl:otherwise>
                    </xsl:choose>
                    </td>
                    <td>Fa. <xsl:value-of select="*[local-name()='supplier']"/></td>
                </tr>
            </xsl:for-each>

        </table>
    </body>
    </html>
</xsl:template> 

</xsl:stylesheet>