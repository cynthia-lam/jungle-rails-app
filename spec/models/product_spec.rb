require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "can save a product with a name, price, quantity, and category" do 
      @category = Category.new
      @product = Product.new(
        name: "Cheese", 
        price: 500,
        quantity: 42,
        category: @category)

      @product.save!
      expect(@product.id).to be_present
    end

    it 'must have a name' do
      product = Product.new(
        name: nil,
        price: 10,
        quantity: 1,
        category: @category
      )
      expect(product).not_to be_valid
    end

    it 'must have a price' do
      product = Product.new(
        name: 'nil',
        price: nil,
        quantity: 1,
        category: @category
      )
      expect(product).not_to be_valid
    end

    it 'must have a quantity' do
      product = Product.new(
        name: 'nil',
        price: 10,
        quantity: nil,
        category: @category
      )
      expect(product).not_to be_valid
    end

    it 'must have a category' do
      product = Product.new(
        name: nil,
        price: 10,
        quantity: 1,
        category: nil
      )
      expect(product).not_to be_valid
    end
  end
end