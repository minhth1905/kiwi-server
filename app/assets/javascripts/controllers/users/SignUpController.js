app.controller("SignUpController", ['$scope', '$rootScope', '$state', '$http',
  '$window', 'toastr', 'Auth', function ($scope, $rootScope, $state, $http,
  $window, toastr, Auth) {
  $scope.signUp = function () {
    NProgress.start();
    $scope.user = {
      user: {
        first_name: $scope.first_name,
        last_name: $scope.last_name,
        email: $scope.email,
        password: $scope.password
      }
    };
    Auth.signUp($scope.user).then(function(response) {
      NProgress.done();
      if(response.data.code == 1) {
        toastr.success(response.data.message);
        $state.go("main");
      } else {
        toastr.error(response.data.message);
      }
    });
  }
}]);
