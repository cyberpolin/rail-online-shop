require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) {Product.new(name: "Banana", description: "This is a descriptio", price: 23.3);}
  let(:bad_product) {Product.new(name: "", description: "This is a descriptio", price: 23.3);}
  context "save" do
    it "returns true" do
      expect{product.save}.to change(Product, :count).by(1)
    end

    it "returns false" do
      expect{bad_product.save}.not_to change(Product, :count)
    end
  end


end
