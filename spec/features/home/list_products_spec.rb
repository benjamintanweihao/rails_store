require 'rails_helper'

feature 'Home Page' do
	include_context 'custom products'

	let(:home_page) { HomePage.new }

	before do
		home_page.load
	end

	scenario 'enters home page' do
		expect(home_page.product_permalinks).to include('ruby-on-rails-mug', 'ruby-on-rails-tote')
	end

	scenario 'clicks on a product' do
		product_link = home_page.product_links.first
		product_page = home_page.click_on_product_link(product_link)

		expect(product_page).to be_displayed

		expect(product_page.title).not_to be_empty
		expect(product_page.description).not_to be_empty
		expect(product_page.price).not_to be_empty
	end

end
