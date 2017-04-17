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
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should be valid for existing email and password' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
      user = User.authenticate_with_credentials('john@doe.com', 'pizzapie')
      expect(user).to be_present
    end
    it 'should be valid for existing email with altered case' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'JOHN@DOE.COM', password: 'pizzapie', password_confirmation: 'pizzapie')
      user = User.authenticate_with_credentials('john@doe.com', 'pizzapie')
      expect(user).to be_present
    end
    it 'should not be valid for non-existing email' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
      user = User.authenticate_with_credentials('john@do.com', 'pizzapie')
      expect(user).to be_nil
    end
    it 'should not be valid for incorrect password' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
      user = User.authenticate_with_credentials('john@doe.com', 'pizzapi')
      expect(user).to be_nil
    end
    it 'should be valid for email with trailing spaces' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
      user = User.authenticate_with_credentials(' john@doe.com ', 'pizzapie')
      expect(user).to be_nil
    end
  end
end
