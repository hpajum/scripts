<%@ Register TagPrefix="RSWP" Namespace="Microsoft.ReportingServices.SharePoint.UI.WebParts" Assembly="Microsoft.ReportingServices.SharePoint.UI.WebParts,Version=13.0.0.0,Culture=neutral,PublicKeyToken=89845dcd8080cc91" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Page language="C#" Codebehind="RSViewerPage.aspx.cs" AutoEventWireup="false" Inherits="Microsoft.ReportingServices.SharePoint.UI.RSViewerPage,Microsoft.ReportingServices.SharePoint.UI.ServerPages,Version=13.0.0.0,Culture=neutral,PublicKeyToken=89845dcd8080cc91" %>
<%= GetDocType() %>
<html dir="<%$Resources:wss,multipages_direction_dir_value%>" runat="server" style="overflow:hidden;width:100%;height:100%">
<head runat="server" lang="<%$Resources:wss,language_value%>">
    <meta name="WebPartPageExpansion" content="full" />
    <meta name="GENERATOR" content="Microsoft SharePoint" />
    <meta name="ProgId" content="SharePoint.WebPartPage.Document" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style id="ActionMenuStyles" type="text/css">
      .ms-core-menu-title { line-height:normal }
      .ms-core-menu-label { display:inline }
      .ms-core-menu-arrowBox { display:inline }
    </style>
    <title id="m_title" runat="server"></title>
    <SharePoint:CssLink runat="server" Version="15"/>
    <SharePoint:CssRegistration Name="corev15.css" runat="server" />
    <SharePoint:Theme runat="server"/>
    <SharePoint:ScriptLink language="javascript" name="core.js" runat="server" Localizable="False" />
    <SharePoint:ScriptLink language="javascript" Localizable="false" name="sp.ui.dialog.js" LoadAfterUI="true" runat="server" />
    <meta name="Microsoft Theme" content="default" />
    <meta name="Microsoft Border" content="none" />
    <link type="text/xml" rel='alternate' href="_vti_bin/spdisco.aspx" />
    <style id="SkipToContentStyles" type="text/css">
        .ms-skipToContent {
            position: absolute;
 	        left:-999px;
 	        top:auto;
        }
        .ms-skipToContent:focus,
        .ms-skipToContent:active {
            left: auto;
            top: auto;
            white-space: nowrap;
            background-color: #fff;
            opacity: 0.8;
            border-radius: 3px;
        }
    </style>
    <script id="SkipToContentScript" type="text/javascript">
        var SkipToContent = function () {
            window.postMessage('SetFocusOnContent', '*');
        }
    </script>
</head>
<body style="width:100%;height:100%;" onresize="ResizeRSViewerPage();" onload="if (typeof(_spBodyOnLoadWrapper) != 'undefined') _spBodyOnLoadWrapper();">
	<asp:HyperLink ID="HyperLink1" runat="server" OnClick="SkipToContent()" class="ms-skipToContent" href="javascript:void(0);" TabIndex="1">Skip to main content</asp:HyperLink>
    <form id="Form1" runat="server" style="width:100%;height:100%;" onsubmit="if (typeof(_spFormOnSubmitWrapper) != 'undefined') {return _spFormOnSubmitWrapper();} else {return true;}" >
        <SharePoint:FormDigest runat="server"/>
        <asp:ScriptManager ID="AjaxScriptManager" AsyncPostBackTimeout="0" runat="server" />
		<div id="m_breadcrumb" style="width:100%">		
			<!-- begin global header -->
			<table ID="m_globalHeaderTable" width="100%" cellpadding="0" cellspacing="0" border="0" runat="server">
				<tr>
					<td class="ms-globalbreadcrumb">
					    <table class="ms-rtePosition-1">
					        <tr>
					            <td class="ms-titlearea" style="padding-top:2px;height:100%" valign="middle">
					                <asp:PlaceHolder ID="m_breadCrumbs" runat="server"></asp:PlaceHolder>
					            </td>
					        </tr>
					    </table>
					    <table ID="m_globalHeaderRight" class="ms-rtePosition-2" runat="server">
					        <tr>
					            <td style="padding-left:3px;padding-right:6px;" class="ms-titlearea" align="middle">
					                <SharePoint:DelegateControl ControlId="GlobalSiteLink1" Scope="Farm" runat="server" />
					            </td>
					            <td style="padding-left:3px;padding-right:6px;" class="ms-titlearea" align="middle">
					                <SharePoint:DelegateControl ControlId="GlobalSiteLink2" Scope="Farm" runat="server" />
					            </td>
                                <td style="padding-left:3px;padding-right:6px;" class="ms-titlearea" align="middle">
                                    <a href="#" onclick="javascript:window.open('http://go.microsoft.com/fwlink/?LinkId=398790')"">&nbsp;<img align='absmiddle' border="0" src="/_layouts/15/images/helpicon.gif" alt="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,multipages_helplinkalt_text%>' EncodeMethod='HtmlEncode'/>">&nbsp;</a>
					            </td>
					        </tr>
					    </table>
					</td>
				</tr>
			</table>
			<!-- end global header -->

        </div>
		<div id="m_content" style="width:100%;height:100%;" >
			<!-- Begin content -->
			<RSWP:ReportViewerWebPart id="m_sqlRsWebPart" runat="server" SuppressWebPartChrome="true" Height="100%" Width="100%" />
            <asp:PlaceHolder runat="server" ID="m_errorPlaceHolder"></asp:PlaceHolder>
            <!-- End content -->
        </div>
		<script type="text/javascript" language="javascript">
		    var previousWindowHeight = -1;
			function ResizeRSViewerPage()
			{
			    if (previousWindowHeight === document.body.clientHeight)
			        return;
			        
			    var breadcrumbBlock = $get("m_breadcrumb");
			    var contentBlock = $get("m_content"); 
		    
			    if (breadcrumbBlock != null && contentBlock != null)
			    {
			        contentBlock.style.display = "none";
			        
			        var targetHeight = document.body.clientHeight - breadcrumbBlock.clientHeight;
			        if (targetHeight < 0)
			            targetHeight = 0;
			        contentBlock.style.height = targetHeight + "px";

			        contentBlock.style.display = "";
			    }
                
			    previousWindowHeight = document.body.clientHeight;
			}
			ResizeRSViewerPage();
		</script>		
	</form>
</body>
</html>