require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "must be created with a password and password_confirmation fields" do 
      user = User.new(
        email: 'test@test.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to be_valid
    end

    it "is not valid if password and password_confirmation don't match" do 
      user = User.new(
        email: 'test@test.com',
        password: 'password123',
        password_confirmation: 'password12'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid if email exists (not case sensitive)' do
      user_pass = User.new(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      user_fail = User.new(
        email: 'TEST@EXAMPLE.COM',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user_fail).not_to be_valid
      # expect(user.errors.full_messages).to include("Email has already been taken")
    end
  end
end
