class AdminController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "secret"

  def index
    return @products = Product.all

    BOOM! #Sorry for the lack of professionalism...

  end

end
