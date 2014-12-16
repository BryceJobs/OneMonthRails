# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	if $('nav.pagination').length > 0
		$(window).scroll ->
			url = $('nav.pagination span.next a').attr('href');
			if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50 
				$('nav.pagination').text('Fetching more pins...')
				$.getScript(url)
		$(window).scroll()

layout = ->
  $container = $("#pins")
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
      columnWidth: 95

 