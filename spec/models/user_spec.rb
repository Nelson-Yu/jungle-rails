require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid when passwords match' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      expect(user).to be_valid
    end

    it 'is not valid when passwords do not match' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle456'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without a first name' do
      user = User.create(
        first_name: nil,
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      expect(user.errors.full_messages).to include ("First name can't be blank")
    end

    it 'is not valid without a last name' do
      user = User.create(
        first_name: 'Nelson',
        last_name: nil,
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      expect(user.errors.full_messages).to include ("Last name can't be blank")
    end

    it 'is not valid without an email' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: nil,
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      expect(user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'is not valid when an email already exists' do
      User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )

      user = User.create(
        first_name: 'Nima',
        last_name: 'Boscarino',
        email: 'jungletest@gmail.com',
        password: 'jungle456',
        password_confirmation: 'jungle456'
      )
      expect(user.errors.full_messages).to include ("Email has already been taken")
    end
  end


end
