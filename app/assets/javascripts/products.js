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

var show_cart = function(){
  var cart = JSON.parse(localStorage.cart);
  if (cart.items.length > 0){
   // show the cart
    $('#cart-div').css('right', '0px');
  }
}

show_cart();


var print_cart = function(jsonCart){
  $('.fa-usd').html(jsonCart.total);
  var items = jsonCart.items;
  for (i = 0; i < items.length; i++){
    $('#cart-div ul').prepend('<li>'+items[i].name+' <i class="fa fa-times remove-item" item-id='+items[i].id+' aria-hidden="true"></i></li>');
  }
}

  print_cart(cart);
  $('#add_to_cart').on('click', function(event) {
    event.preventDefault();

    $('#cart-div').css('right', '0px');
    var current_total = parseFloat($('.fa-usd').text());
    var product = JSON.parse($(this).attr('info'));


    console.log('This is total: ' +cart.total);

    cart.total += parseFloat(product.price);
    cart.items.push({id:product.id, name:product.name, price:product.price })

    $('#cart-div ul').prepend('<li>'+product.name+' <i class="fa fa-times remove-item" item-id='+product.id+' aria-hidden="true"></i></li>');
    // current_total += parseFloat(product.price);
    $('.fa-usd').html(cart.total);
    var current_item = {'id':product.id};

    localStorage.setItem("cart", JSON.stringify(cart));

    console.log(localStorage.cart);


  });

  // Catching remove button
  $('#cart-div').on('click', '.remove-item', function(event){
    event.preventDefault();
    var id = $(this).attr('item-id');
    // ==================
      var cart = JSON.parse(localStorage.cart);
      for (i = 0; i < cart.items.length; i++){
        if (cart.items[i].id == id){
          delete cart.items[i]
          localStorage.setItem("cart", JSON.stringify(cart));
          break //return
        }

      }
    // ==================
    $(this).parent().remove();
    console.log(id);

  });

});
