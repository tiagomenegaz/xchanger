get_rate = ->
  if $('form').attr('action') == '/exchange'
   $.ajax '/exchange',
    type: 'POST'
    dataType: 'json'
    data: {
            currency: $("#currency").val(),
            currency_destination: $("#currency_destination").val(),
            quantity: $("#quantity").val()
          }
    error: (jqXHR, textStatus, errorThrown) ->
      alert textStatus
    success: (data, text, jqXHR) ->
      $('#result').val(data.value)
  return false;


$(document).ready ->
  $('#quantity').keyup ->
    get_rate()
  $('#currency').change ->
    get_rate()
  $('#currency_destination').change ->
    get_rate()
  $('#revert_currency').click ->
    current = $("#currency").val()
    $("#currency").val($("#currency_destination").val())
    $("#currency_destination").val(current)
    get_rate()
