<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:sc3="urn:vsr:xml-werkzeuge:aufgabe2.3">

<xsl:template match="/">
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>XML Document Task_1</title>
</head>
<body>
    <h1>Person</h1>
    <table border="1">
        <xsl:for-each select="sc3:form/*">
            <tr>
                <td><xsl:value-of select="local-name()"/></td>
                <td><xsl:value-of select="."/></td>
            </tr>
        </xsl:for-each>
    </table>
</body>
</html>

</xsl:template>
</xsl:stylesheet>