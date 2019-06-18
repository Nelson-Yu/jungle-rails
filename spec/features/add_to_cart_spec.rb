require 'rails_helper'

RSpec.feature "Visitions click on add to cart button on home page", type: :feature, js: true do

  # SETUP
  before :each do 
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the My Cart counter go up" do
    # ACT
    visit root_path
    first(:button, 'Add').click

    # VERIFY & DEBUG
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end

end
