(function(){
  "use strict";

  angular.module("app").controller("appCtrl", function($scope, $http, $interval){

    $scope.setup = function() {
      $http.get('/recipes.json').then(function(response) {
        $scope.recipes = response.data;
      });
    };

    $scope.isHidden = {};
    $scope.showHide = function(id) {
      $scope.isHidden[id] = !$scope.isHidden[id]
    };

    $scope.checkHidden = function(id) {
      return $scope.isHidden[id];
    };

    $scope.progress_count = 0;

    $scope.startTimer = function() {
      var trial = document.getElementById('hidden').innerHTML;
      console.log(trial);

      var progressInterval = $interval(function(){
          $scope.progress_count += parseFloat(trial);
          console.log($scope.progress_count);
          if ($scope.progress_count >= 100) { $interval.cancel(progressInterval); }
        }, 1000);
    };


  window.scope = $scope;

  });
}());