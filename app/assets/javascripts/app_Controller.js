(function(){
  "use strict";

  angular.module("app").controller("appCtrl", function($scope, $http){

    $scope.isHidden = {};
    $scope.showHide = function(id) {
      $scope.isHidden[id] = !$scope.isHidden[id]
    };

    $scope.checkHidden = function(id) {
      return $scope.isHidden[id];
    };


  window.scope = $scope;

  });
}());