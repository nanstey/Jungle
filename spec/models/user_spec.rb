require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid with all fields present' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizza', password_confirmation: 'pizza')
      expect(user).to be_valid
    end
    it 'should not be valid with mismatched passwords' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizza', password_confirmation: 'taco')
      expect(user).to_not be_valid
    end
    it 'should not be valid without password' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: nil, password_confirmation: 'taco')
      expect(user).to_not be_valid
    end
    it 'should not be valid without password confirmation' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizza', password_confirmation: nil)
      expect(user).to_not be_valid
    end
    it 'should not be valid to reuse an email' do
      User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizza', password_confirmation: 'pizza')
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@DOE.com', password: 'taco', password_confirmation: 'taco')
      expect(user).to_not be_valid
    end
  end
end
