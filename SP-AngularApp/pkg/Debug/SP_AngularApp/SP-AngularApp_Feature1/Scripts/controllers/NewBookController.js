demoApp.controller('NewBookController', ['$scope', 'bookService',
  function EditBookController($scope, bookService) {
    $scope.queryString = document.URL.split('?')[1];
    $scope.saveBook = function (book) {
      bookService.saveBook(book)
        .success(function (response) {
          window.location = "./Default.aspx?" + document.URL.split('?')[1];
        })
        .error(function (data, status, headers, config) {
          console.log('failure', data);
        });
    }
    $scope.cancelEdit = function () {
      window.location = "./Default.aspx?" + document.URL.split('?')[1];
    }
  }]
  )