class OrdersController < ApplicationController
  def new

  end

  def create
    items = params[:items]

    product = Product.find(items['0']['id'])
    order = Order.new(user_id: current_user.id)

    if order.save
      # items.each |k, v|{

      # }
      order_products = OrdersProduct.new(order: order, product_id: items['0']['id'], unit_price: items['0']['price'], qty: product.qty_in_stock)

       if order_products.save
         render plain: "{success: true}"
       else
         render plain: "{success: false}"
       end

    else
      render plain: "{success: false}"
    end

  end
end
