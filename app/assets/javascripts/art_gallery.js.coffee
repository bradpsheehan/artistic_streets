$ ->
	if $('.gallery').length > 0
		alert('hey')
		$container = $(".gallery")
		$container.masonry()
		$container.imagesLoaded ->
		  $container.masonry()