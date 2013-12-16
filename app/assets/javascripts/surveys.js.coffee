$ ->
  $('form').on 'keypress', 'input[type=number]', (e) ->
    a = [48..58]
    k = e.which

    if (!($.inArray(k, a) >= 0))
      e.preventDefault()
