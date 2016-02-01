demoApp.factory('bookService', function ($q, $http) {
  return {
    getBooks: function () {
      var deferred = $.Deferred();
      //First we must call the EnsureSetup method
      JSRequest.EnsureSetup();
      hostweburl = decodeURIComponent(JSRequest.QueryString["SPHostUrl"]);
      appweburl = decodeURIComponent(JSRequest.QueryString["SPAppWebUrl"]);

      var restQueryUrl = appweburl + "/_api/SP.AppContextSite(@target)/web/lists/getByTitle('Books')/items?$select=Title,ID,BookAuthor,BookCategory&@target='" + hostweburl + "'";

      var executor = new SP.RequestExecutor(appweburl);
      executor.executeAsync({
        url: restQueryUrl,
        method: "GET",
        headers: { "Accept": "application/json; odata=verbose" },
        success: function (data, textStatus, xhr) {
          deferred.resolve(JSON.parse(data.body));
        },
        error: function (xhr, textStatus, errorThrown) {
          deferred.reject(JSON.stringify(xhr));
        }
      });
      return deferred;
    },
    deleteBook: function (id) {
      var hostweburl = decodeURIComponent(JSRequest.QueryString["SPHostUrl"]);
      var appweburl = decodeURIComponent(JSRequest.QueryString["SPAppWebUrl"]);
      var digest = document.getElementById('__REQUESTDIGEST').value;
      var requestHeader = {
        delete: {
          'headers': {
            'X-RequestDigest': digest,
            "IF-MATCH": '*',
            "X-HTTP-Method": 'DELETE'
          }
        }
      }
      var restQueryUrl = appweburl + "/_api/SP.AppContextSite(@target)/web/lists/getByTitle('Books')/items(" + id + ")?@target='" + hostweburl + "'";

      return $http.post(restQueryUrl, null, requestHeader.delete);
    },
saveBook: function (book) {
      JSRequest.EnsureSetup();
      hostweburl = decodeURIComponent(JSRequest.QueryString["SPHostUrl"]);
      appweburl = decodeURIComponent(JSRequest.QueryString["SPAppWebUrl"]);

      var restQueryUrl = appweburl + "/_api/SP.AppContextSite(@target)/web/lists/getByTitle('Books')/items?@target='" + hostweburl + "'";
      var digest = document.getElementById('__REQUESTDIGEST').value;

      var item = {
        Title: book.Title,
        BookAuthor: book.BookAuthor,
        BookCategory: book.BookCategory,
        __metadata: { type: 'SP.Data.BooksListItem' }
      };

      var requestHeader = {
        get: {
          'headers': {
            'accept': 'application/json;odata=verbose'
          }
        },

        post: {
          'headers': {
            'X-RequestDigest': digest,
            'content-type': 'application/json;odata=verbose',
            'accept': 'application/json;odata=verbose'
          }
        },
        update: {
          'headers': {
            'X-RequestDigest': digest,
            "IF-MATCH": '*',
            "X-HTTP-Method": 'MERGE',
            'content-type': 'application/json;odata=verbose',
            'accept': 'application/json;odata=verbose'
          }
        }
      };
      if (book.id) {
        restQueryUrl = appweburl + "/_api/SP.AppContextSite(@target)/web/lists/getByTitle('Books')/items(" + book.id + ")?@target='" + hostweburl + "'";
        item = {
          Title: book.title,
          BookAuthor: book.author,
          BookCategory: book.category,
          __metadata: { type: 'SP.Data.BooksListItem' }
        };
        return $http.post(restQueryUrl, item, requestHeader.update);
      }
      else {
        return $http.post(restQueryUrl, item, requestHeader.post);
      }

    }
  }
})