# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate presence of name' do
      category = Category.create(name: 'Test Category')
      product = Product.new(name: nil, price: 10, quantity: 5, category: category)
      
      product.valid?
    
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate presence of price' do
      category = Category.create(name: 'Test Category')
      product = Product.new(name: 'Test Product', price_cents: nil, quantity: 5, category: category)
      
      product.valid?
    
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should validate presence of quantity' do
      category = Category.create(name: 'Test Category')
      product = Product.new(name: 'Test Product', price: 10, quantity: nil, category: category)
      
      product.valid?
    
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should validate presence of category' do
      category = Category.create(name: 'Test Category')
      product = Product.new(name: 'Test Product', price: 10, quantity: 4, category: nil)
      
      product.valid?
    
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
