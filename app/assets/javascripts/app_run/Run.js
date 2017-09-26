app.run(['$state', '$window', '$http', '$rootScope', 'Auth', function ($state, $window, $http, $rootScope, Auth) {
  NProgress.start();
  if($window.localStorage.token) {
    $rootScope.currentUser = JSON.parse($window.localStorage.user);
    $http.defaults.headers.common["Authorization"] = 'Bearer ' + $window.localStorage.token;
    $state.go("main");
  } else {
    $state.go("signin");
  }
  $rootScope.common_text = {
    validate: {
      username: "Tên đăng nhập chỉ được chứa ký tự a-z, 0-9 và dấu gạch dưới.",
      require: "Trường này không được để trống.",
      email: "Email không đúng định dạng.",
      password: "Mật khẩu dài ít nhất 8 kí tự.",
      password_confirm: "Mật khẩu xác nhận không đúng."
    }
  }
  $rootScope.$on('$stateChangeStart', function (event, toState, toParams) {
    NProgress.start();
    if (toState.requireLogin && !Auth.isSignedIn()) {
      event.preventDefault();
      $state.go("signin");
    }
  });
  $rootScope.$on('$stateChangeSuccess', function () {
    NProgress.done();
  });
}]);
