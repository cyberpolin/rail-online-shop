class OrdersController < ApplicationController
  def index

    @orders = Order.where("user_id = #{current_user.id}").order(created_at: :desc)
    
  end

  def new

    redirect_to '/sessions/new' unless current_user
  end

  def create
    items = params[:items]
    order = Order.new(user_id: current_user.id)
    order.total = params[:total]
    items.each do |item|
      # p ">>>"
      # p item[1]['id']

      product = Product.find(item[1]['id'])


      if not order.save
        render plain: "{success: false}"
      else
        order_products = OrdersProduct.new(order: order, product_id: item[1]['id'], unit_price: item[1]['price'], qty: product.qty_in_stock)
        if not order_products.save
          render plain: {success: true}.to_json
        end
      end
      product.qty_in_stock -=1
    end
    to_client = {success: true}
    render plain: to_client.to_json

    # product = Product.find(items['0']['id'])
    # order = Order.new(user_id: current_user.id)

    # if order.save
    #   order_products = OrdersProduct.new(order: order, product_id: items['0']['id'], unit_price: items['0']['price'], qty: product.qty_in_stock)

    #    if order_products.save
    #      render plain: "{success: true}"
    #    else
    #      render plain: "{success: false}"
    #    end

    # else
    #   render plain: "{success: false}"
    # end




  end
end
