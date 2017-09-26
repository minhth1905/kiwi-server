APP_VERSION = 1;
var app = angular.module("AccountApp", ['app.factory', 'ui.bootstrap',
  'ui.router', 'toastr', 'ngMessages'])
.config(['$stateProvider', '$urlRouterProvider', '$locationProvider', '$httpProvider',
  function ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) {
  $stateProvider
  .state("signin", {
    url: "/signin",
    templateUrl: "/templates/users/sessions/new.html",
    controller: 'SessionsController',
    requireLogin: false
  })
  .state('resetPassword', {
    url: "/passwords/new",
    templateUrl: "/templates/users/passwords/new.html",
    controller: "PasswordsController",
    requireLogin: false
  })
  .state('editPassword', {
    url: "/users/password",
    templateUrl: "/templates/users/passwords/edit.html",
    controller: "EditPasswordController",
    requireLogin: false
  })
  .state('signup', {
    url: "/signup",
    templateUrl: "/templates/users/registrations/new.html",
    controller: "SignUpController",
    requireLogin: false
  })
  .state('confirmation', {
    url: "/user/confirmation",
    templateUrl: "/templates/users/confirmations/new.html",
    controller: "ConfirmationController",
    requireLogin: false
  })
  .state('main', {
    url: "/main",
    templateUrl: "/templates/main.html",
    controller: ['$scope', '$state', 'Auth', function ($scope, $state, Auth) {
      $scope.signOut = function () {
        Auth.signOut();
        $state.go("signin");
      }
    }],
    requireLogin: true
  });
  $urlRouterProvider.otherwise('/main');
}]);
