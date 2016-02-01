<%@ Page Language="C#" MasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.RequestExecutor.js"></script>
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
    <script type="text/javascript" defer="defer" src="../Scripts/controllers/NewBookController.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <SharePoint:ScriptLink Name="sp.RequestExecutor.js" runat="server" LoadAfterUI="true" Localizable="false" />

<div class="container">
    <div ng-app="demoApp">
        <div ng-controller="NewBookController">
            <div class="container">
                <div class="navbar">
                    <div class="navbar-inner">
                        <ul class="nav">
                            <li><a ng-href="./Default.aspx?{{queryString}}">Add new book</a></li>
                        </ul>
                    </div>
                </div>
                <h1>New Book</h1>
                <hr />
                <form>
                    <fieldset>
                        <label for="title"></label>
                        <input required id="title" type="text" ng-model="newBook.Title" placeholder="Title of book.." />
                        <label for="bookAuthor"></label>
                        <input id="bookAuthor" type="text" ng-model="newBook.BookAuthor" placeholder="Author of book.." />
                        <label for="bookCategory"></label>
                        <input id="bookCategory" type="text" ng-model="newBook.BookCategory" placeholder="Category of book.." />

                        <br />
                        <br />
                        <button type="submit" ng-click="saveBook(newBook)" class="btn btn-primary">Save</button>
                        <button type="button" ng-click="cancelEdit()" class="btn btn-default">Cancel</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
</asp:Content>
