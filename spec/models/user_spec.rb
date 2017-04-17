require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations:' do
    it 'should be valid with all fields present' do
      user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
      expect(user).to be_valid
    end
    it 'should not be valid with mismatched passwords' do
      user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'tacobell')
      expect(user).to_not be_valid
    end
    it 'should not be valid without password' do
      user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: nil, password_confirmation: 'tacobell')
      expect(user).to_not be_valid
    end
    it 'should not be valid without password confirmation' do
      user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: nil)
      expect(user).to_not be_valid
    end
    it 'should not be valid to reuse an email' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
      user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@DOE.com', password: 'tacobell', password_confirmation: 'tacobell')
      expect(user).to_not be_valid
    end
    it 'should not be valid to use a password shorter than 6 characters' do
      user = User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizza', password_confirmation: 'pizza')
      expect(user).to_not be_valid
    end
  end
end
