// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){

var destroy_local_storage = function(){localStorage.clear();
}
var hide_cart = function(){
  $('#cart-div').attr('style', '');
}
var print_thank_you = function(){
  $('.container').html('<h1>Thank you for shopping whit us...</h1>')
}

console.log('inside jquery')

  $('#place_order').on('submit', function(event) {

    event.preventDefault();



    var cart = localStorage.getItem('cart');
    var the_data = JSON.parse(cart);



    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      dataType: 'json',
      data: the_data
    }).
      done(function(response){
        if (response.success){
          destroy_local_storage();
          hide_cart();
          print_thank_you();
        }
    });

  });

})
