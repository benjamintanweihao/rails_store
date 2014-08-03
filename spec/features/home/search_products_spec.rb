require 'rails_helper'

feature 'Product Search' do
  include_context 'custom products'

  let(:home_page) { HomePage.new }

  before do
    home_page.load
  end

  scenario 'a search term is entered' do
    search_results = home_page.search_for('jersey')
    expect(search_results.products.size).to eq(3)
  end

  scenario 'search limited by dropdown' do
    search_results = home_page.search_for('mug', 'Categories')
    expect(search_results.products.size).to eq(1)
  end

end
