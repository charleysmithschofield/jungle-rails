require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: 'test@test.com', first_name: 'Test', last_name: 'User', password: 'password', password_confirmation: 'password') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
  end
end
