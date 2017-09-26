app.controller("SessionsController",['$scope', '$rootScope', '$state', '$http', '$window', 'toastr', 'Auth',
    function ($scope, $rootScope, $state, $http, $window, toastr, Auth) {
    $scope.signIn = function () {
      NProgress.start();
      Auth.signIn($scope.email, $scope.password).then(function(response) {
        NProgress.done();
        if(response.data.code == 1) {
          $rootScope.currentUser = response.data.user;
          $http.defaults.headers.common["Authorization"] = 'Bearer ' + response.data.token;
          $window.localStorage.user = JSON.stringify(response.data.user);
          $window.localStorage.token = response.data.token;
          $state.go("main");
        } else {
          toastr.error(response.data.message);
        }
      });
    }
  }]
)
