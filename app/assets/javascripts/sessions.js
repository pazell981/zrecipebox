function Login(){
	if (window.location != window.parent.location){
		setTimeout(function(){
    	$(".accordion-navigation .content").removeClass('active')
      $("#panel2").addClass('active')
		}, 250)	
		setTimeout(function(){
			$("input[name='email']").val('u')
		}, 500)
		setTimeout(function(){
			$("input[name='email']").val('us')
		}, 750)
		setTimeout(function(){
			$("input[name='email']").val('use')
		}, 1000)
		setTimeout(function(){
			$("input[name='email']").val('user')
		}, 1250)
		setTimeout(function(){
			$("input[name='email']").val('user@')
		}, 1500)
		setTimeout(function(){
			$("input[name='email']").val('user@g')
		}, 1750)
		setTimeout(function(){
			$("input[name='email']").val('user@gm')
		}, 2000)
		setTimeout(function(){
			$("input[name='email']").val('user@gma')
		}, 2250)
		setTimeout(function(){
			$("input[name='email']").val('user@gmai')
		}, 2500)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail')
		}, 2750)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail')
		}, 3000)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.')
		}, 3250)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.c')
		}, 3500)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.co')
		}, 3750)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.com')
		}, 4000)
		setTimeout(function(){
			$("input[name='password']").val('Ja')
		}, 4250)
		setTimeout(function(){
			$("input[name='password']").val('Ja')
		}, 4500)
		setTimeout(function(){
			$("input[name='password']").val('JaV')
		}, 4750)
		setTimeout(function(){
			$("input[name='password']").val('JaVa')
		}, 5000)
		setTimeout(function(){
			$("input[name='password']").val('JaVa9')
		}, 5250)
		setTimeout(function(){
			$("input[name='password']").val('JaVa98')
		}, 5500)
		setTimeout(function(){
			$("input[name='password']").val('JaVa981')
		}, 5750)
		setTimeout(function(){
			$("#submit").trigger('click')
		}, 6000)	
	}
}
Login();