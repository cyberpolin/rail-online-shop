class ProductsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "You have successfully added a product."
      redirect_to @product
    else
      render 'new'
    end

  end

  def update
    @product = Product.find(params[:id])
    puts ">>>>>#{product_params}"
    if @product.update(product_params)
      flash[:notice] = "You have successfully updated the product."
      redirect_to @product
    else
      render 'edit'
    end

  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "You have successfully deleted the product."
    end

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :photo, :sku, :price, :color, :size)
    end

end
