require 'rails_helper'

RSpec.describe User, type: :model do
  
  # Test validations relating to password and password confirmation
  describe 'password and password_confirmation' do
    # Test that a User is invalid without a password
    it 'is invalid without a password' do
      user = User.new(password: nil, password_confirmation: 'password')
      expect(user).to_not be_valid
    end

    
  end
end
