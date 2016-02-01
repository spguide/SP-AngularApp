demoApp.controller('BookController', ['$scope', 'bookService', function BookController($scope, bookService) {

  SP.SOD.executeOrDelayUntilScriptLoaded(runMyCode, "SP.js");

  function runMyCode() {
    $scope.queryString = document.URL.split('?')[1];
    $scope.books = [];
    $.when(bookService.getBooks($scope))
          .done(function (jsonObject) {
            angular.forEach(jsonObject.d.results, function (book) {
              $scope.books.push({
                title: book.Title,
                author: book.BookAuthor,
                category: book.BookCategory,
                id: book.ID
              });
              //$scope is not updating so force with this command
              if (!$scope.$$phase) { $scope.$apply(); }
            });
          })
          .fail(function (err) {
            console.info(JSON.stringify(err));
          });
    $scope.gridOptions = {
      data: $scope.books,
      columnDefs: [
        { name: 'title', field: 'title' },
        { name: 'author', field: 'author' },
        { name: 'category', field: 'category' },
        { name: 'edit', cellTemplate: '<button type="submit" class="btn btn-primary" ng-click="grid.appScope.edit(row.entity)">Save</button>' },
        { name: 'delete', cellTemplate: '<button type="submit" class="btn btn-primary" ng-click="grid.appScope.delete(row.entity.id)">Delete</button>' }
      ]
    };
    $scope.delete = function (id) {
      bookService.deleteBook(id)
      .success(function (response) {
        console.log('success', data);
      })
      .error(function (data, status, headers, config) {
        console.log('failure', data);
      });
    }
    $scope.edit = function (book) {
      bookService.saveBook(book)
        .success(function (response) {
          alert('item updated successfully');
          //console.log('success', response);
        })
        .error(function (data, status, headers, config) {
          console.log('failure', data);
        });
    }
  }
}]);
