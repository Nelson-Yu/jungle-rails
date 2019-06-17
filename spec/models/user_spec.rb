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
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      expect(user.errors.full_messages).to include ("Email has already been taken")
    end

    it 'is not valid when password is too short' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: '1',
        password_confirmation: '1'
      )
      expect(user.errors.full_messages).to include ("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns user if valid' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      current_user = User.authenticate_with_credentials('jungletest@gmail.com', 'jungle123')

      expect(current_user).to eql(user)
    end

    it 'returns nil if invalid password' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      current_user = User.authenticate_with_credentials('jungletest@gmail.com', 'jungle456s')

      expect(current_user).to eql(nil)
    end

    it 'returns user if valid and email has extra spaces' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      current_user = User.authenticate_with_credentials(' jungletest@gmail.com  ', 'jungle123')

      expect(current_user).to eql(user)
    end

    it 'returns user if valid and email is in wrong case' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      current_user = User.authenticate_with_credentials('junGLEteST@gmAIL.com', 'jungle123')

      expect(current_user).to eql(user)
    end

  end

end
