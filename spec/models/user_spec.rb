require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created when passwords match' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle123'
      )
      expect(user).to be_valid
    end

    it 'should not be created when passwords do not match' do
      user = User.create(
        first_name: 'Nelson',
        last_name: 'Yu',
        email: 'jungletest@gmail.com',
        password: 'jungle123',
        password_confirmation: 'jungle456'
      )
      expect(user).to_not be_valid
    end
  end


end
