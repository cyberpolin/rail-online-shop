require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(username: "usuario", email:'cyberpolin@gmail',password: '123' );}
  let(:bad_user) {User.new(username: "usuario", email:'cyberpolin@gmail' );}

  context 'save' do
    it 'returns true' do
       expect{user.save}.to change(User, :count).by(1)
    end

    it "returns false" do
      expect{bad_user.save}.to change(User, :count)
    end
  end
end
