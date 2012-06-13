// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready( function() {
  $('.submit_new_address').click(function() {
    $('.create_loader').show()
    $('#error_explanation').hide()
    $('.error_list').html('')
    submitted_json = {address: {email: $('#email_input').val(), first_name: $('#first_name_input').val(), last_name: $('#last_name_input').val(), address: $('#address_input').val(), city: $('#city_input').val(), state: $('#state_input').val(), zip: $('#zip_input').val()}}

    $.ajax({
      type: "post",
      data: submitted_json,
      url: "/addresses",
      dataType: 'json',
      success: function(data) {
        $('.create_loader').hide()
        $('input').val('')
        $('.success').fadeIn('slow', function(){
          $('.success').fadeOut('slow')
        })
      },
      error: function(xhr) {
        $('#error_explanation').show()
        error_response = JSON.parse(xhr.responseText)
        for(var key in error_response.errors){
          for(var error in error_response.errors[key]) {
            $('.error_list').append("<li>" + key + " " + error_response.errors[key][error])
          }
        }
        $('.create_loader').hide()
      }
    })
  })

  $('.filter_button').click( function() {
    $('.addresses_list').html('')
    $('.address_loader').show()
    $.ajax({
      type: "get",
      url: "/addresses",
      data: { q: $('.first_name_input').val() },
      dataType: 'json',
      success: function(data) {
        $('.address_loader').hide()
        for(var address_index in data) {
          address = data[address_index]
          $('.addresses_list').append("<tr class='address'><td>" + address.first_name + "</td><td>" + address.last_name + "</td><td>" + address.address + "</td><td>" + address.city + "</td><td>" + address.state + "</td><td>" + address.zip + "</td><td><span class='icon delete' address_id='" + address.id + "'></span></td></tr>")
        }
      }
    })
  })

  $('span.delete').live('click', function() {
    address_id = $(this).attr('address_id')
    address_tr = $(this).closest('.address')
    $('.address_loader').show()
    $.ajax({
      type: "delete",
      url: "/addresses/" + address_id,
      dataType: 'json',
      success: function(data) {
        $('.address_loader').hide()
        address_tr.fadeOut('fast');
      }
    })
  })
})


