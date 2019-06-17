require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.new

  describe 'Validations' do
    it 'is valid with valid attributes' do
      product = Product.create(
        name: 'Super Realistic Robot Named Nelson',
        description: 'Buy the greatest creation of all',
        image: 'nelson.jpg',
        price_cents: 10_000,
        quantity: 1,
        category: category
      )
      expect(product).to be_valid
    end
    it 'is not valid without a name' do
      product = Product.create(
        name: nil,
        description: 'Buy the greatest creation of all',
        image: 'nelson.jpg',
        price_cents: 10_000,
        quantity: 1,
        category: category
      )
      expect(product.errors.full_messages).to include ("Name can't be blank")
    end
    it 'is not valid without a price' do
      product = Product.create(
        name: 'Super Realistic Robot Named Nelson',
        description: 'Buy the greatest creation of all',
        image: 'nelson.jpg',
        price_cents: nil,
        quantity: 1,
        category: category
      )
      expect(product.errors.full_messages).to include ("Price can't be blank")
    end
    it 'is not valid without a quantity' do
      product = Product.create(
        name: 'Super Realistic Robot Named Nelson',
        description: 'Buy the greatest creation of all',
        image: 'nelson.jpg',
        price_cents: 10_000,
        quantity: nil,
        category: category
      )
      expect(product.errors.full_messages).to include ("Quantity can't be blank")
    end
    it 'is not valid without a category' do
      product = Product.create(
        name: 'Super Realistic Robot Named Nelson',
        description: 'Buy the greatest creation of all',
        image: 'nelson.jpg',
        price_cents: 10_000,
        quantity: 1,
        category: nil
      )
      expect(product.errors.full_messages).to include ("Category can't be blank")
    end
  end
end
