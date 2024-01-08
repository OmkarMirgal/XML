<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Task_18</title>
    </head>
    <body>
        <h1>The Book</h1>
        <xsl:apply-templates select="//*[local-name()='chapter']"/>
    </body>
    </html>
</xsl:template>


<xsl:template match="//*[local-name()='chapter']">
  <xsl:variable name="currentPosition">
     <xsl:number level="multiple" count="//*[local-name()='chapter']"/>
  </xsl:variable>
  <xsl:value-of select="concat($currentPosition,' ',@title)"/>
  <br/>
  <br/>
</xsl:template>

</xsl:stylesheet>
