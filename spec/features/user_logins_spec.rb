require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    user = User.create!(first_name: 'John', last_name: 'Doe', email: 'john@doe.com', password: 'pizzapie', password_confirmation: 'pizzapie')
  end

  scenario "User loging in" do
    visit login_path

    fill_in 'email', with: 'john@doe.com'
    fill_in 'password', with: 'pizzapie'

    click_on 'Submit'

    cart = find('.nav.navbar-nav.navbar-right > li:nth-child(3) a')
    expect(cart.text).to eq('Logout (John)')

    # DEBUG / VERIFY
    save_screenshot
  end

end
