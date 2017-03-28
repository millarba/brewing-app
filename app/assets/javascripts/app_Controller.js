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
      $http.get("https://api.particle.io/v1/devices/360041000a47353138383138/brew_tmp?access_token=4652099c02c9beddddfbf6ff7f74ebd88c02825b").then(function(response) {
        console.log(response.data.result);
        $scope.message = response.data.result;
      })
    };

    $scope.checkHidden = function(id) {
      return $scope.isHidden[id];
    };

//variables for the timer and temperature
    $scope.progressCount = 0;
    var tempArray = [];
    var currentTemp = "";
    $scope.completionPercentage = 0;

    $scope.startTimer = function() {
//every second add time to timer, fill progress bar, and push new temp to array
      var progressInterval = $interval(function(){
          $http.get("https://api.particle.io/v1/devices/360041000a47353138383138/brew_tmp?access_token=4652099c02c9beddddfbf6ff7f74ebd88c02825b").then(function(response) {
            console.log(response.data.result);
            if (response.data.result != currentTemp) {
              tempArray.push(parseInt(response.data.result));
            }
            currentTemp = response.data.result;
            $scope.message = tempArray;
          })

          $scope.progressCount += 1;
          $scope.completionPercentage += 1;
          console.log($scope.progressCount);

          if ($scope.progressCount >= 100) { 
            $interval.cancel(progressInterval); }
        }, 1000);
    };

//changing boilProgress and boilTime to 1 for demo
//use parseFloat(time) and Math.round(time) respectively in production          
    $scope.boilProgress = 0;

    $scope.startBoil = function() {
      var boilTime = document.getElementById('hidden').innerHTML;
      var boilInterval = $interval(function(){
        $scope.boilProgress += 1;
        if ($scope.boilProgress >= 100) {
          $interval.cancel(boilInterval);
        };
      }, 1000);
    };


  window.scope = $scope;
  $scope.Math = window.Math;

  });
}());