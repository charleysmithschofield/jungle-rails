# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      product = Product.new(name: 'Example Product', price: 10.99, quantity: 1, category: Category.new)
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      product = Product.new(name: nil, price: 10.99, quantity: 1, category: Category.new)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
  end
end
