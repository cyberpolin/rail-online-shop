class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end

  end
  def update
  end

  def destroy
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :photo, :sku, :price, :color, :size)
    end

end
