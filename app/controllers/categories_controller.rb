class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end
  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "You have successfully update the product"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "You have successfully added a category"
      redirect_to @category
    else
      render 'new'
    end

  end

  def destroy

    @category = Category.find(params[:id])
    if @category.products != []
      @category.products = []
      if @category.destroy
         flash[:notice] = "You have successfully deleted the category This category had products in it"
      end
    else

      if @category.destroy

        flash[:notice] = "You have successfully deleted the category"

      end
    end
      redirect_to categories_path
  end
  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  private
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
