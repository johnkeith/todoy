(function(){
  var todoyApp = angular.module('todoyApp', [
    'templates',
    'ngRoute',
    'todoyControllers',
    'ngResource',
    ]);

  todoyApp.config(['$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider){
      $locationProvider.html5Mode(true);
      $routeProvider.
        when('/schedule', {
          templateUrl: "schedule.html",
          controller: 'SchedulesController'
        });
    }]);
})();
