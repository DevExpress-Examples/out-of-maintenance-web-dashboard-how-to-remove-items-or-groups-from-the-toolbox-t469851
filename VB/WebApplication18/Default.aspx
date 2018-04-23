<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication18.Default" %>

<%@ Register Assembly="DevExpress.Dashboard.v17.1.Web, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" 
    Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function onBeforeRender(sender) {
            var dashboardControl = sender.GetDashboardControl();
            var toolbox = dashboardControl.findExtension('toolbox');

            // Removes the "Grid" and "Pivot" items from the Common group.
            toolbox.removeToolboxItem("common", "Grid");
            toolbox.removeToolboxItem("common", "Pivot");     

            // Removes the "Maps" group from the Toolbox using knockout.
            toolbox.toolboxGroups.remove(function (group) { return group.name === "maps" });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;">
            <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" DashboardStorageFolder="~/App_Data/Dashboards" 
                AllowExportDashboard="True" Width="100%" Height="100%">
                <ClientSideEvents BeforeRender="onBeforeRender" />
            </dx:ASPxDashboard>
        </div>
    </form>
</body>
</html>