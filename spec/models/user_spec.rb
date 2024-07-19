require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Testing validations relating to password and password confirmation
  describe 'password and password_confirmation' do
    # Testing that a User is invalid without a password
    it 'is invalid without a password' do
      user = User.new(password: nil, password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    # Testing that a User is invalid without a password_confirmation
    it 'is invalid without a password_confirmation' do
      user = User.new(password: 'password', password_confirmation: nil)
      expect(user).to_not be_valid
    end

    # Testing that a User password and password_confirmation must match
    it 'is invalid if password and password_confirmation do not match' do
      user = User.new(password: 'password', password_confirmation: 'different')
      expect(user).to_not be_valid
    end
  end

  # Testing validation for email uniqueness
  describe 'email' do
    # Testing that User email must be unique (case insensitive)
    it 'is invalid with a duplicate email' do
      # Create a user with a specific email
      User.create(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password')
      # Attempt to create another user with the same email
      user = User.new(email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end

  # Testing presence validations for email, first_name, and last_name
  describe 'presence validations' do
    # Testing that a User is invalid without an email
    it 'is invalid without an email' do
      user = User.new(email: nil, first_name: 'First', last_name: 'Last', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    # Testing that a User is invalid without a first_name
    it 'is invalid without a first_name' do
      user = User.new(email: 'test@example.com', first_name: nil, last_name: 'Last', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    # Testing that a User is invalid without a last_name
    it 'is invalid without a last_name' do
      user = User.new(email: 'test@example.com', first_name: 'First', last_name: nil, password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end

   # Testing password minimum length validation
   describe 'password length' do
    it 'is invalid if the password is too short' do
      user = User.new(password: 'short', password_confirmation: 'short', email: 'TEST@TEST.com', first_name: 'First', last_name: 'Last')
      expect(user).to_not be_valid
    end

    it 'is valid with a password of minimum length' do
      user = User.new(password: 'longenough', password_confirmation: 'longenough', email: 'TEST@TEST.com', first_name: 'First', last_name: 'Last')
      expect(user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # Test successful authentication with correct email and password
    it 'returns a user when valid credentials are provided' do
      user = User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password', first_name: 'First', last_name: 'Last')
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end
