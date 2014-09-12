var recipeApp = angular.module('recipeApp',[]);

recipeApp.controller('RecipeBoxCtrl', function($scope, $http){
	$http.get('/recipebox.json').success(function(data){
		console.log(data)
		$scope.recipes=data
	})
});
