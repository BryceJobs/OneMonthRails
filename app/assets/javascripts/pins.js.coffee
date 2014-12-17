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
   		finishedMsg: "No more pages to load."
    	img: "http://i.imgur.com/6RMhx.gif"
    	msgText: "Loading more pins..."

		,(newElements) ->
	  	$newElems = $(newElements).css(opacity: 0)
	  	$newElems.imagesLoaded ->
	    		$newElems.animate opacity: 1
			    $("#pins").masonry "appended", $newElems, true
	    		


				

jQuery ->
  $container = $("#pins")
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
