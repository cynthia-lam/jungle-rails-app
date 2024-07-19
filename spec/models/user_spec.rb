require 'rails_helper'

RSpec.describe User, type: :model do
<<<<<<< HEAD
  describe 'Validations' do
    it "must be created with a password and password_confirmation fields" do 
      user = User.new(
        email: 'test@test.com',
        password: 'password123',
        password_confirmation: 'password123',
        first_name: 'Test',
        last_name: 'User'
      )
      expect(user).to be_valid
    end
  end
=======
  pending "add some examples to (or delete) #{__FILE__}"
>>>>>>> ca06e73bbe2af471f0baaa6416a511f462d6dd59
end
