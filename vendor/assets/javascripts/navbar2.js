$(function() {

	// Do our DOM lookups beforehand
	var nav_container = $("#magellan");
	var nav = $("dl.sub-nav");
	
	var top_spacing = 150;
	var waypoint_offset = 50;
	
	var sections = $("#panel1 section");
	var navigation_links = $(".alphabet a");
	
	sections.waypoint(function (event, direction){	
			var active_section = $(this);
			if (direction === 'up'){
				active_section = active_section.prev();
			} else {
				active_section = active_section.next();
			}
			var active_link = $('.'+active_section.attr("id"));
			navigation_links.removeClass("selected");
			active_link.addClass("selected");
		}, {
			context: '#body',
			offset: 160
		}
	)
	
	
	navigation_links.click( function(event) {
		$('#body').scrollTo(
			$(this).attr("href"),
			{
				duration: 1000,
				offset: -160
			}
		);
	});


});
