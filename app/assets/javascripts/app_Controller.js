(function(){
  "use strict";

  angular.module("app").controller("appCtrl", function($scope, $http){

    $scope.isHidden = true;
    $scope.showHide = function() {
      if ($scope.isHidden === true) {
        $scope.isHidden = false;
        document.getElementById("commentToggle").innerHTML = "Hide"
      } else {
        $scope.isHidden = true;
        document.getElementById("commentToggle").innerHTML = "Show"
      }

    };





  });
}());