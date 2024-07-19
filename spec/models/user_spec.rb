require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Test validations relating to password and password confirmation
  describe 'password and password_confirmation' do
    # Test that a User is invalid without a password
    it 'is invalid without a password' do
      user = User.new(password: nil, password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    # Test that a User is invalid without a password_confirmation
    it 'is invalid without a password_confirmation' do
      user = User.new(password: 'password', password_confirmation: nil)
      expect(user).to_not be_valid
    end

    # Test that a User password and password_confirmation must match
    it 'is invalid if password and password_confirmation do not match' do
      user = User.new(password: 'password', password_confirmation: 'different')
      expect(user).to_not be_valid
    end
  end

  # Test validation for email uniqueness
  describe 'email' do
    # Test that User email must be unique (case insensitive)
    it 'is invalid with a duplicate email' do
      # Create a user with a specific email
      User.create(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password')
      # Attempt to create another user with the same email
      user = User.new(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end
end
