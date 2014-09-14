var recipeApp = angular.module('recipeApp',[]);

recipeApp.controller('RecipeCtrl', function($scope, $http){
	$http.get('/recipes.json').success(function(data){
		$scope.recipes=data
	})
});

$(document).ready(function(){
	$("#accordion").accordion({
		heightStyle: "content",
		header: "h4"
	});
	$('#accordion h4').click(function(e) {
	  if($(this).hasClass('ui-accordion-header-active'))
	    return false;
	});
	$("#accordion h4").click(function(){
		if ($(this).attr("id")=="information") {
			$("#recipeimage").animate({height: "175px"}, 300, "linear");
		} else {
			$("#recipeimage").animate({height: "75px"}, 300, "linear");
		}
		$("#recipeshow").children("div").addClass("short");
		$("#recipeshow").children("div").removeClass("tall", "easeOutCirc");
		$("#"+$(this).attr("id")+"panel").addClass("tall", "easeInCirc");
	})
	$("#like").click(function(){
		if ($(this).hasClass("disabled")){
		} else {
			$("#like_form").submit();
		}
	});
});