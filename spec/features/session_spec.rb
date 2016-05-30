require 'rails_helper'

RSpec.feature "Products", type: :feature, :js => true do
  describe "#index" do
    # let! (:product) {Product.create(name: "banana", description: "lorem ipsum", price: 3.40)}
    it "should return the the Sign Up link if not logged in" do
      visit root_path
      expect(page).to have_content('Sign Up')
    end
    it "Should return Log Out" do
      user = User.create(username: "Billy", email: "billy@mail.com", password: "123")
      page.set_rack_session(:user_id => user.id)
       expect(page).to have_content('Log Out')
    end
  end
end
