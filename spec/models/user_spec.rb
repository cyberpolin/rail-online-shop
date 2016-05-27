require 'rails_helper'

RSpec.describe User, type: :model do
  let(:cool_user) {User.new(username: "usuario", email:'cyberpolin@gmail.com',password: '123' )}
  let(:bad_user) {User.new(username: "usuario", email:'cyberpolin@gmail.com' )}

  context 'save' do
    it 'returns true' do
       expect{cool_user.save}.to change(User, :count).by(1)
    end

    it "returns false" do
      expect{bad_user.save}.to change(User, :count)
    end
  end

end
