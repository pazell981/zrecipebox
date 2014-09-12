var recipeApp = angular.module('recipeApp',[]);

recipeApp.controller('CookbookCtrl', function($scope, $http){
	var time
	$http.get('/recipes.json').success(function(data){
		console.log(data)
		$scope.recipes=data
		time = Date.now()
	})

	if (time + 120 == Date.now() ){
		$http.get('/recipes.json').success(function(data){
		console.log(data)
		$scope.recipes=data
		time = Date.now()
	})
	}
});

