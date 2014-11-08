function Login(){
	if (window.location != window.parent.location){
		setTimeout(function(){
    	$(".accordion-navigation .content").removeClass('active')
      $("#panel2").addClass('active')
		}, 100)	
		setTimeout(function(){
			$("input[name='email']").val('u')
		}, 200)
		setTimeout(function(){
			$("input[name='email']").val('us')
		}, 300)
		setTimeout(function(){
			$("input[name='email']").val('use')
		}, 400)
		setTimeout(function(){
			$("input[name='email']").val('user')
		}, 500)
		setTimeout(function(){
			$("input[name='email']").val('user@')
		}, 600)
		setTimeout(function(){
			$("input[name='email']").val('user@g')
		}, 700)
		setTimeout(function(){
			$("input[name='email']").val('user@gm')
		}, 800)
		setTimeout(function(){
			$("input[name='email']").val('user@gma')
		}, 900)
		setTimeout(function(){
			$("input[name='email']").val('user@gmai')
		}, 1000)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail')
		}, 1100)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail')
		}, 1200)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.')
		}, 1300)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.c')
		}, 1400)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.co')
		}, 1500)
		setTimeout(function(){
			$("input[name='email']").val('user@gmail.com')
		}, 1600)
		setTimeout(function(){
			$("input[name='password']").val('Ja')
		}, 1700)
		setTimeout(function(){
			$("input[name='password']").val('Ja')
		}, 1800)
		setTimeout(function(){
			$("input[name='password']").val('JaV')
		}, 1900)
		setTimeout(function(){
			$("input[name='password']").val('JaVa')
		}, 2000)
		setTimeout(function(){
			$("input[name='password']").val('JaVa9')
		}, 2100)
		setTimeout(function(){
			$("input[name='password']").val('JaVa98')
		}, 2200)
		setTimeout(function(){
			$("input[name='password']").val('JaVa981')
		}, 2300)
		setTimeout(function(){
			$("#submit").trigger('click')
		}, 2400)	
	}
}
Login();