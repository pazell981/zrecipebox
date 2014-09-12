$(function() {

	// Do our DOM lookups beforehand
	var nav_container = $("#magellan");
	var nav = $("dl.sub-nav");
	
	var top_spacing = 150;
	var waypoint_offset = 50;

	nav_container.waypoint({
		handler: function(event, direction) {
			if (direction == 'down') {
				nav_container.css({ 'height':nav_container.outerHeight() });		
				nav.stop().addClass("sticky").css("top",top_spacing+nav_container.outerHeight()).animate({"top":  top_spacing});
			} else {
				nav_container.css({ 'height':'auto' });
				nav.stop().removeClass("sticky").css("top",nav_container.outerHeight()-waypoint_offset).animate({"top": top_spacing });
			}	
		},
		offset: function() {
			return $(".fixed").outerHeight()+$("#title").outerHeight()+nav_container.outerHeight()-waypoint_offset;
		}
	});
	
	var sections = $("section");
	var navigation_links = $("dd a");
	
	sections.waypoint({
		handler: function(event, direction) {
		
			var active_section;
			active_section = $(this);
			if (direction === "up") active_section = active_section.prev();

			var active_link = $('dd a[href="#'+active_section.attr("id")+'"]');
			navigation_links.removeClass("selected");
			active_link.addClass("selected");

		},
		offset: '25%'
	})
	
	
	navigation_links.click( function(event) {

		$('#body').scrollTo(
			$(this).attr("href"),
			{
				duration: 1000,
				offset: { 'left':0, 'top':-0.15*$('#body') }
			}
		);
	});


});