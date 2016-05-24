require 'rails_helper'

RSpec.feature "Products", type: :feature, :js => true do
  describe "#index" do
    let! (:product) {Product.create(name: "banana", description: "lorem ipsum", price: 3.40)}
    it "should return the list of products" do
      visit root_path
      expect(page).to have_content(product.name)
    end
  end
end
