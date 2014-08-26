(function(){
  var controllers = angular.module('todoyControllers', []);

  todoyControllers.controller('schedulesController', ['$scope', '$resource',
    function($scope, $resource){
      var schedule = $resource("/schedule");

      $scope.getSchedule = function(){
        $scope.schedule = schedule.get();
      }

      $scope.postSchedule = function(){
        var response = $scope.schedule.$save(function(){
          alert("Schedule saved!");
        });
      }
    }
  ]);
})();
