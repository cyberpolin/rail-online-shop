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

  // If we're on the Checkout page, display cart on page.
  var cartForPageStr = localStorage.getItem('cart');
  var cartForPageObj = JSON.parse(cartForPageStr);

  if (cartForPageObj && cartForPageObj.items) {
    for (i=0;i<cartForPageObj.items.length;i++) {
      $('#cart_table').append('<tr> \
                                <td>' + cartForPageObj.items[i].name + '</td> \
                                <td>' + cartForPageObj.items[i].price + '</td> \
                               </tr>');
    }
    $('#total').text('Total: $' + cartForPageObj.total);
  }

  // Listen for user clicking on 'Place Order' button.
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
