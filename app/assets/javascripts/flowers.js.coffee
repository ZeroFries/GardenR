$ = jQuery
$(document).ready ->
	$(document).keydown (e) ->
		location.pathname = "/flowers/next" if e.keyCode == 39 and ($("#next").length > 0) # checks for existence of "next" link
		location.pathname = "/flowers/prev" if e.keyCode == 37 and ($("#prev").length > 0)