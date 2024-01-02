<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Tool-Storage</title>
            </head>
            <body>
               <h1>stock sorted by value</h1>
               <h3>articles with the value 123.16</h3>
               <table border="1">
                <tr>
                    <th>Article number</th>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Condition</th>
                    <th>Comment</th>
                    <th>House</th>
                    <th>Shelf</th>
                </tr>
                    <xsl:apply-templates select="//*[local-name()='article']" mode="by-value-123.16"/>
            </table>

              <h3>articles with the value 21.45</h3>
               <table border="1">
                    <tr>
                        <th>Article number</th>
                        <th>Name</th>
                        <th>Value</th>
                        <th>Condition</th>
                        <th>Comment</th>
                        <th>House</th>
                        <th>Shelf</th>
                    </tr>
                    <xsl:apply-templates select="//*[local-name()='article']" mode="by-value-21.45"/>
                </table>

              <h3>articles with the value 17.48</h3>
                <table border="1">
                <tr>
                    <th>Article number</th>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Condition</th>
                    <th>Comment</th>
                    <th>House</th>
                    <th>Shelf</th>
                </tr>
                <xsl:apply-templates select="//*[local-name()='article']" mode="by-value-17.48"/>
                </table>

              <h3>articles with the value 7.20</h3>
                <table border="1">
                <tr>
                    <th>Article number</th>
                    <th>Name</th>
                    <th>Value</th>
                    <th>Condition</th>
                    <th>Comment</th>
                    <th>House</th>
                    <th>Shelf</th>
                </tr>
                        <xsl:apply-templates select="//*[local-name()='article']" mode="by-value-7.20"/>
                </table>
              
            </body>
        </html>
    </xsl:template>

    <xsl:template match="article" mode="by-value-123.16">
        <xsl:variable name="articleValue" select="@value" />
        <xsl:if test="$articleValue = 123.16">
            <tr>
                <td><xsl:value-of select="@nr"/></td>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="$articleValue"/></td>
                <td><xsl:value-of select="@condition"/></td>
                <td>
                     <xsl:choose>
                      <xsl:when test="not(normalize-space(.))">
                        <xsl:text>kiene</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="."/>
                     </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td><xsl:value-of select="ancestor::house/@id"/></td>
                <td><xsl:value-of select="ancestor::shelf/@id"/></td>
            </tr>
        </xsl:if>
    </xsl:template>

  <xsl:template match="article" mode="by-value-21.45">
        <xsl:variable name="articleValue" select="@value" />
        <xsl:if test="$articleValue = 21.45">
            <tr>
                <td><xsl:value-of select="@nr"/></td>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="$articleValue"/></td>
                <td><xsl:value-of select="@condition"/></td>
                <td>
                     <xsl:choose>
                      <xsl:when test="not(normalize-space(.))">
                        <xsl:text>kiene</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="."/>
                     </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td><xsl:value-of select="ancestor::house/@id"/></td>
                <td><xsl:value-of select="ancestor::shelf/@id"/></td>
            </tr>
        </xsl:if>
    </xsl:template>

  <xsl:template match="article" mode="by-value-17.48">
        <xsl:variable name="articleValue" select="@value" />
        <xsl:if test="$articleValue = 17.48">
            <tr>
                <td><xsl:value-of select="@nr"/></td>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="$articleValue"/></td>
                <td><xsl:value-of select="@condition"/></td>
                <td>
                     <xsl:choose>
                      <xsl:when test="not(normalize-space(.))">
                        <xsl:text>kiene</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="."/>
                     </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td><xsl:value-of select="ancestor::house/@id"/></td>
                <td><xsl:value-of select="ancestor::shelf/@id"/></td>
            </tr>
        </xsl:if>
    </xsl:template>

  <xsl:template match="article" mode="by-value-7.20">
        <xsl:variable name="articleValue" select="@value" />
        <xsl:if test="$articleValue = 7.20">
            <tr>
                <td><xsl:value-of select="@nr"/></td>
                <td><xsl:value-of select="@name"/></td>
                <td><xsl:value-of select="$articleValue"/></td>
                <td><xsl:value-of select="@condition"/></td>
                <td>
                     <xsl:choose>
                      <xsl:when test="not(normalize-space(.))">
                        <xsl:text>kiene</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="."/>
                     </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td><xsl:value-of select="ancestor::house/@id"/></td>
                <td><xsl:value-of select="ancestor::shelf/@id"/></td>
            </tr>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
