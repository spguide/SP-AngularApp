<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.RequestExecutor.js" ></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
    <script src="//cdn.rawgit.com/angular-ui/bower-ui-grid/master/ui-grid.min.js"></script>
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <link rel="Stylesheet" type="text/css" href="//cdn.rawgit.com/angular-ui/bower-ui-grid/master/ui-grid.min.css"></link>

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="../Scripts/App.js"></script>
    <script type="text/javascript" defer="defer" src="../Scripts/services/BookService.js"></script>
    <script type="text/javascript" defer="defer" src="../Scripts/controllers/BookController.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Page Title
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
<div class="container">
        <div ng-app="demoApp">
            <div ng-controller="BookController">
                <div class="navbar">
                    <div class="navbar-inner">
                        <ul class="nav">
                            <li><a ng-href="./NewBook.aspx?{{queryString}}">Add new book</a></li>
                        </ul>
                    </div>
                </div>
                <div>Books: {{books.length}}</div>

                <div ui-grid="gridOptions"  ui-grid-edit ui-grid-selection class="myGrid"></div>

                <%--<div class="row" ng-repeat="book in books">
                    <div class="row">
                        <div class="span11">
                            <h2>{{book.title}}</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span3">
                            <div><strong>Book Author:</strong> {{book.author}}</div>
                            <div><strong>Book Category:</strong> {{book.category}}</div>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
