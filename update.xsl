<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited by XMLSpy® -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    
  <table>
  <tr>
  <td><img border="0" src="logo.jpg" alt="logo" width="200" height="100" /></td>
  </tr>
  </table>
  <table>
  <tr>
  <td><br/>For any issues during an Update installation please visit the below link <br/> or get in touch with Temenos Customer Support</td>
  </tr>
  <tr>
  <td><a href="https://tcsp.temenos.com/HowTo/TroubleshootUpdates.aspx" target="_blank">https://tcsp.temenos.com/HowTo/TroubleshootUpdates.aspx</a></td>
  </tr>
   </table>

  <table width="100%"> 
  <xsl:for-each select="update/libraries/library">
          <xsl:variable name="releasedetail" select = "@branch"/>
  <tr>
  <td align = "middle"><h2>T24 Release <xsl:value-of select ="substring-before($releasedetail,'_')"/> </h2></td>
  </tr>
  </xsl:for-each>
  </table>

  <table> 
  <xsl:for-each select="update/libraries/library">
          <xsl:variable name="releasedetail" select = "@branch"/>
  <tr>
  <td align = "middle"><h3>Client OS <xsl:value-of select ="substring-after($releasedetail,'_')"/> </h3></td>
  </tr>
  </xsl:for-each>
  </table>

    <table>
      <xsl:for-each select="update/libraries/library">
      <tr>
        <td><h3>Update Date <xsl:value-of select ="@CreateDate"/></h3></td>       
      </tr>
     </xsl:for-each>
   </table>
   
       <table>
      <xsl:for-each select="update/libraries/library">
      <tr>
        <td><h3>Number of Fixes <xsl:value-of select ="@TotFix"/></h3></td>       
      </tr>
     </xsl:for-each>
   </table>
  
    <table border="1">
     <h2>Update Details</h2>
      <tr bgcolor="#87CEEB">
        <th>Module</th>
        <th>Component</th>
        <th>Update No</th>
      </tr>
      <xsl:for-each select="update/libraries/library">
          <xsl:variable name="updatename" select = "@name"/>
      <tr>
        
        <td><xsl:value-of select ="substring-before($updatename,'_')"/> </td>
         <td><xsl:value-of select ="substring-after($updatename,'_')"/> </td>
        <td align = "middle"><xsl:value-of select="@revision"/></td>
      </tr>
     </xsl:for-each>
   
    </table>

  
<div>
    <h2>Fix Details</h2>
    <table border="1">
    <tr bgcolor="#87CEEB">
        <th>Update No</th>
        <th>Temenos Reference</th>
        <th>Priority</th>
        <th>Symptoms</th>
      	<th>Description</th>
        <th>Nature of Fix</th>
        <th>Testing Considerations</th>
	<th>Post Installation Steps</th>

      </tr>
      <xsl:for-each select="update/changes/change">
      <xsl:variable name="Prior" select = "Priority"/>
      <xsl:choose>
 <xsl:when test="$Prior='Critical'">
       <tr>
        <td align = "middle">
        <xsl:value-of select ="@update"/></td>
        <td><xsl:value-of select="Reference"/></td>
        <td><img border="0" src="critical.png" alt="critical" width="20" height="20" /><xsl:value-of select="Priority"/></td>
        <td><xsl:value-of select="Symptoms/symptom"/></td>
	      <td><xsl:value-of select="Problem"/></td>
	      <td><xsl:value-of select="NatureOfFix"/></td>
	      <td><xsl:value-of select="TestConsiderations"/></td>
	      <td><xsl:value-of select="PostInstallSteps"/></td>
      </tr>
      </xsl:when>
    
     <xsl:otherwise>
      <tr>
       <td align = "middle"><xsl:value-of select ="@update"/></td>
        <td><xsl:value-of select="Reference"/></td>
        <td><xsl:value-of select="Priority"/></td>
        <td><xsl:value-of select="Symptoms/symptom"/></td>
	      <td><xsl:value-of select="Problem"/></td>
	      <td><xsl:value-of select="NatureOfFix"/></td>
	      <td><xsl:value-of select="TestConsiderations"/></td>
	      <td><xsl:value-of select="PostInstallSteps"/></td>
      </tr>
      </xsl:otherwise>
      
      </xsl:choose>
      </xsl:for-each>
   
    </table>

 <h2>Relationships</h2>
    <table border="1">
       <tr bgcolor="#87CEEB">
         <th>Module</th>
        <th>Component</th>
        <th>Update No</th>
      </tr>
      <xsl:for-each select="update/libraries/library/dependencies/dependency">
           <xsl:variable name="updatename" select = "@name"/>
      <tr> 
         <td><xsl:value-of select ="substring-before($updatename,'_')"/> </td>
         <td><xsl:value-of select ="substring-after($updatename,'_')"/> </td>
        <td align ="middle"><xsl:value-of select="@rev"/></td>
      </tr>
      </xsl:for-each>
   
    </table>

    </div>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
