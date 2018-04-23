<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication18.Default" %>

<%@ Register Assembly="DevExpress.Dashboard.v16.2.Web, Version=16.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        function onInit(s, e) {
            var toolbox = s.dashboardDesigner.toolbox();

            // Remove the "Grid" and "Pivot" items from the Common group...
            var commonGroup = toolbox.filter(function (item) { return item.name === "DashboardWinStringId.RibbonGroupCommonCaption" })[0];
            var groupItems = commonGroup.content();
            var newItems = groupItems.filter(function (item) { return item.name !== "Grid" && item.name !== "Pivot"; });
            commonGroup.content(newItems);
            //...

            // Remove the "Maps" group from the Toolbox
            var newGroups = toolbox.filter(function (item) { return item.name !== "DashboardStringId.DescriptionMaps" });
            s.dashboardDesigner.toolbox(newGroups);
            //...
        }
    </script>

    <script type="text/html" id="dx-dshd-item-placeholder">
        <!-- ko if: $parent.isDesignMode() -->
        <div class="dx-layout-item-placeholder" data-bind="css: itemStyle">
            <div>
                <div>
                    <span>Drag an item from the Toolbox to create a new item</span>
                </div>
            </div>
        </div>
        <!-- /ko -->
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxDashboard ID="ASPxDashboardDesigner1" runat="server" ClientInstanceName="designer" DashboardStorageFolder="~/App_Data/Dashboards" AllowExportDashboard="True">
                <ClientSideEvents Init="onInit" />
            </dx:ASPxDashboard>
        </div>
    </form>
</body>
</html>