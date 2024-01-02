<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:zoo="urn:myspace:vsrzoo" >

<xsl:template match="/">
	<html lang="en">
		<head>
			<meta charset="UTF-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<title>Sorted Animals</title>
		</head>
		<body>
            <h1>Sorted Animals</h1>
            <h3>By name:</h3>
            <xsl:apply-templates select="//*[local-name()='name']"/>
            <h3>By id:</h3>
            <xsl:apply-templates select="//*[local-name()='zoo_animal']" mode="by-id" />
            <h3>By age:</h3>
            <xsl:apply-templates select="//*[local-name()='zoo_animal']" mode="by-age"/>
        </body>
	</html>
</xsl:template>

<xsl:template match="//*[local-name()='name']">
    <ul>
        <li>
            <xsl:value-of select="."/>
        </li>
    </ul>
</xsl:template>

<xsl:template match="//*[local-name()='zoo_animal']" mode="by-id">
    <ul>
        <li>
            <xsl:value-of select="zoo:name"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>)</xsl:text>
        </li>
    </ul>
</xsl:template>

<xsl:template match="//*[local-name()='zoo_animal']" mode="by-age">
    <ul>
        <li>
            <xsl:value-of select="zoo:name"/>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="zoo:age"/>
            <xsl:text>)</xsl:text>
        </li>
    </ul>
</xsl:template>

</xsl:stylesheet>
