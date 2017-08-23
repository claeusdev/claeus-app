
json.products do
	json.array!(@products) do |product|
		json.name product.name
		json.url store_product_path(product.store, product)
	end
end

json.stores do
	json.array!(@stores) do |store|
		json.name store.name
		json.url store_path(store)
	end
end