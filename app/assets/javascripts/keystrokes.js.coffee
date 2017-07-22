$ ->
  $(document).keyup (e) ->
    $("input.modal-state:checked").trigger "click" if e.keyCode is 27
    $("body").removeClass "modal-open"

  $(document).on 'change', 'input.modal-state', (e) ->
    # add class that prevents page from scrolling behind open modal
    $("body").toggleClass "modal-open"