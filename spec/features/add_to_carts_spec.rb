require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Add product to cart on homepage" do
    # ACT
    visit root_path

    within first('.product') do
      click_on 'Add'
    end

    cart = find('.nav.navbar-nav.navbar-right > li:nth-child(2) a')
    expect(cart.text).to eq('My Cart (1)')

    # DEBUG / VERIFY
    save_screenshot
  end
end
