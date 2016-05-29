// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){

console.log('inside jquery')

  $('#place_order').on('submit', function(event) {

    event.preventDefault();

    console.log('clicked place order:')
    console.log(this)

    var cart = localStorage.getItem('cart');
    var the_data = JSON.parse(cart);

    console.log('cart:')
    console.log(cart)



    $.ajax({
      url: $(this).attr('action'),
      method: 'POST',
      data: the_data
    }).
      done(function(response){
        console.log(response)
    });

  });

})
