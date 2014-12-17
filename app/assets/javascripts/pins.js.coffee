# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#pins").infinitescroll
    navSelector: "nav.pagination" 
    nextSelector: "nav.pagination a[rel=next]" 
    itemSelector: ".box"
    animate: true
    loading: 
    	img: "http://i.imgur.com/6RMhx.gif"
   		finishedMsg: "No more pins to load."
    	msgText: "More pins..."

		,
		(newElements) ->
	  $newElems = $(newElements).css(opacity: 0)
	  $newElems.imagesLoaded ->
	    $newElems.animate opacity: 1
			$("#pins").masonry "appended", $newElems, true
	    		
		

jQuery ->
  $container = $("#pins")
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
