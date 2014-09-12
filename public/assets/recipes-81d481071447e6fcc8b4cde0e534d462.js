var recipeApp = angular.module('recipeApp',[]);

recipeApp.controller('RecipeCtrl', function($scope, $http){
	$http.get('/recipes.json').success(function(data){
		console.log(data)
		$scope.recipes=data
	})
});
