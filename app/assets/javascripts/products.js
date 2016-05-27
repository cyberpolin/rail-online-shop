// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  // localStorage.clear();
  if (localStorage.cart == undefined){
    var cart = {};
    cart.total = 0;
    cart.items = [];
    localStorage.setItem("cart", JSON.stringify(cart));
    console.log('Create localStorage')
  }


  var cart = JSON.parse(localStorage.cart);

  $('#add_to_cart').on('click', function(event) {

    event.preventDefault();
    var current_total = parseFloat($('.fa-usd').text());
    var product = JSON.parse($(this).attr('info'));


    console.log('This is total: ' +cart.total);

    cart.total += parseFloat(product.price);
    console.log('This is new total: ' +cart.total);

    $('#cart-div ul').prepend('<li>'+product.name+'</li>');
    // current_total += parseFloat(product.price);
    $('.fa-usd').html(cart.total);
    var current_item = {'id':product.id};

    localStorage.setItem("cart", JSON.stringify(cart));

    console.log(localStorage.cart);


  });

});
