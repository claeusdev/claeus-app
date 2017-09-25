# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.claeus.com"

SitemapGenerator::Sitemap.create do
  Store.find_each do |store|
    add store_path(store), :lastmod => store.updated_at
    Product.find_each do |product|
      add store_product_path(store, product), :lastmod => product.updated_at
    end
  end

  
end
