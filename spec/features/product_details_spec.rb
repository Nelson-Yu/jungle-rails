require 'rails_helper'

RSpec.feature "Visitor clicks on product on home page", type: :feature, js: true do

  # SETUP
  before :each do 
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They see the product, they clicked on" do
    # ACT
    visit root_path
    click_on 'Details »'

    # DEBUG
    
    # VERIFY
    expect(page).to have_css '.products-show', count: 1
    save_screenshot
  end

end
