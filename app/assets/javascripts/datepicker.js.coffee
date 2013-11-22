$ ->
  maxDate = new Date($('.datepicker').data('maxDate') || new Date)
  minDate = new Date($('.datepicker').data('minDate') || new Date('1900-01-01'))
  $('.datepicker').pickadate
    max: maxDate
    min: minDate
