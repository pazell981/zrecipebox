var recipeApp = angular.module('recipeApp',[]);

recipeApp.controller('FriendBoxCtrl', function($scope, $http){
	$http.get('/friendsbox.json').success(function(data){
		console.log(data)
		$scope.recipes=data
	})
});