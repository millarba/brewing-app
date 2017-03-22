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

    $scope.addTemp = function() {
      $http.get("https://api.particle.io/v1/devices/360041000a47353138383138/brew_tmp?access_token=").then(function(response) {
        console.log(response.data.result);
        $scope.message = response.data.result;
      })
    };

    $scope.checkHidden = function(id) {
      return $scope.isHidden[id];
    };

//variables for the timer and temperature
    $scope.progress_count = 0;
    var tempArray = [];
    var currentTemp = "";

    $scope.startTimer = function() {
      var time = document.getElementById('hidden').innerHTML;
      console.log(time);
//every second add time to timer, fill progress bar, and push new temp to array
      var progressInterval = $interval(function(){
          $http.get("https://api.particle.io/v1/devices/360041000a47353138383138/brew_tmp?access_token=").then(function(response) {
            console.log(response.data.result);
            if (response.data.result != currentTemp) {
              tempArray.push(parseInt(response.data.result));
            }
            currentTemp = response.data.result;
            $scope.message = tempArray;
          })
          $scope.progress_count += parseFloat(time);
          console.log($scope.progress_count);
          if ($scope.progress_count >= 100) { $interval.cancel(progressInterval); }
        }, 1000);
    };


  window.scope = $scope;

  });
}());