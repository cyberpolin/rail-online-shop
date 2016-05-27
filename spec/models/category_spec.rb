require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) {Category.new(name: "Steak", description: "This is a steak category")}
  let(:bad_category) {Category.new(description: "This is a steak category")}
  context "save category" do
    it "returns true" do
      expect{category.save}.to change(Category, :count).by(1)
    end
     it "returns false" do
      expect{category.save}.to change(Category, :count)
    end
  end
end
