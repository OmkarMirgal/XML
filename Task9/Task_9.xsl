<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zoo="urn:myspace:vsrzoo" >

<xsl:template match="/">
	<html lang="en">
		<head>
			<meta charset="UTF-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<title>Zoo keepers in zoo "vsr zoo"</title>
		</head>
		<body>
            <h1>Zoo keepers in zoo "vsr zoo"</h1>
            <h4>The zoo "vsr zoo" employs the following zoo keepers:</h4>
            <ul>
                <xsl:for-each select="//zoo:zoo_keeper">
                    <li>
                        <xsl:value-of select="@name"/>
                    </li>
                </xsl:for-each>
            </ul>
            <h3>Zoo keepers and animals</h3>
            <table border="1">
                <tr>
                    <th>Name</th>
                    <th>Animal(s)</th>
                </tr>
                <xsl:for-each select="//zoo:zoo_keeper">
                    <xsl:variable name="currentkeeperName" select="@name"/>
                    <tr>
                        <td><xsl:value-of select="$currentkeeperName"/></td> 
                        <td>
                            <xsl:for-each select="zoo:cares_for">
                                <xsl:variable name="currentAnimalId" select="@animal"/>
                                <xsl:for-each select="//zoo:zoo_animal[@id = $currentAnimalId]"> 
                                    <xsl:value-of select="zoo:name"/>
                                    <xsl:text> (</xsl:text>
                                    <xsl:value-of select="$currentAnimalId"/>
                                    <xsl:text>) </xsl:text>
                                </xsl:for-each>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
	</html>
</xsl:template>

</xsl:stylesheet>