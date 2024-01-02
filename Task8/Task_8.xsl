<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zoo="urn:myspace:vsrzoo" >

<xsl:template match="/">
	<html lang="en">
		<head>
			<meta charset="UTF-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<title>Dwellings in zoo "vsr zoo"</title>
		</head>
		<body>
			<h1>Dwellings in zoo "vsr zoo"</h1>
				<xsl:for-each select="//zoo:dwelling">
					<ul>
						<xsl:value-of select="count(zoo:houses)" /> 
						<xsl:text> animals lives in  </xsl:text>
						<xsl:value-of select="@name" />
						<xsl:text> : </xsl:text>
						<xsl:for-each select="zoo:houses">
							<xsl:variable name="currentAnimalId" select="@animal"/>
							<xsl:for-each select="//zoo:zoo_animal[@id = $currentAnimalId]" >
								<xsl:value-of select="zoo:name"/>
								<xsl:text> ( </xsl:text>
								<xsl:value-of select="$currentAnimalId"/>
								<xsl:text> ) </xsl:text>
							</xsl:for-each>
						</xsl:for-each>
					</ul>
				</xsl:for-each>
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>