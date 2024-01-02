<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zoo="urn:myspace:vsrzoo" >

<xsl:template match="/">
	<html lang="en">
		<head>
			<meta charset="UTF-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<title>Animal names in zoo "vsr zoo"</title>
		</head>
		<body>
            <h1>Animal names in zoo "vsr zoo"</h1><hr/>
            <h3>The animals in zoo "vsr zoo" have the following names:</h3>
            <xsl:variable select="count(//zoo:name)" name="nameCounter"/>    
            <xsl:for-each select="//zoo:zoo_animal">
                <span>
                    <xsl:choose>
                        <xsl:when test="position() = $nameCounter">
                            <xsl:text> and </xsl:text>
                            <xsl:value-of select="zoo:name"/>   
                        </xsl:when>
                        <xsl:when test="position() = 1">
                            <xsl:value-of select="zoo:name"/>   
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text> , </xsl:text>
                            <xsl:value-of select="zoo:name"/>   
                        </xsl:otherwise>
                    </xsl:choose>
                </span>
            </xsl:for-each>
            <ul></ul>
        </body>
	</html>
</xsl:template>

</xsl:stylesheet>