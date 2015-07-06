angular.module('Todo', ['ui.router', 'templates', 'Devise'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {
  

  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      controller: 'MainCtrl',
      resolve: {
  postPromise: ['lists', function(lists){
    return lists.getAll();
  }]
}
    })
    .state('login', {
      url: '/login',
      templateUrl: 'auth/_login.html',
      controller: 'AuthCtrl',
      controller: 'AuthCtrl',
      onEnter: ['$state', 'Auth', function($state, Auth) {
        Auth.currentUser().then(function (){
          $state.go('home');
        })
      }]
    })
    .state('register', {
      url: '/register',
      templateUrl: 'auth/_register.html',
      controller: 'AuthCtrl',
      controller: 'AuthCtrl',
      onEnter: ['$state', 'Auth', function($state, Auth) {
        Auth.currentUser().then(function (){
          $state.go('home');
        })
      }]
    });

  $urlRouterProvider.otherwise('home');
}]);
