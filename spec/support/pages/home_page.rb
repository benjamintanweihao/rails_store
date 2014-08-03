class HomePage < SitePrism::Page
	set_url '/'

	elements :products,        "[data-hook='products_list_item']"
	elements :product_links,   "[data-hook='products_list_item'] a"
	element  :search_field,    "input#keywords"
	element  :search_dropdown, "select#taxon"

	def	search_for(query, scope='All departments')
		search_dropdown.select(scope)
		search_field.set(query)
		click_on('Search')
		SearchResults.new
	end

	def product_permalinks
		product_links.map { |p| p['href'].split("/").last }
	end

	def	click_on_product_link(link)
		link.click
		ProductPage.new
	end

end

class SearchResults < SitePrism::Page
	elements :products, "[data-hook='products_list_item']"
end

class ProductPage < SitePrism::Page
	set_url_matcher /products\/\w+(-(\w+|\d+))*/

	element :product_title,       "h1.product-title"
	element :product_description, "[data-hook='description']"
	element :product_price,       "[data-hook='product_price']"

	def	title
		product_title.text
	end

	def	description
		product_description.text
	end

	def price
		product_price.text
	end

end
