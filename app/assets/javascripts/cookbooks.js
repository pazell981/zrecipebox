var source = new EventSource('/cookbooks/stream');
source.addEventListener('message', function (e){
	console.log(e.data);
});
source.addEventListener('recipe', function (recipe){
	console.log(recipe);
});