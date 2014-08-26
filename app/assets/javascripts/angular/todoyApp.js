(function(){
  var todoyApp = angular.module('todoyApp', [
    'templates',
    'ngRoute',
    'todoyControllers',
    'ngResource',
    ]);

  todoyApp.config(['$routeProvider', function($routeProvider){
    $routeProvider.
      when('/schedule', {
        templateUrl: "schedule.html",
        controller: 'schedulesController'
      });
  }]);
})();
