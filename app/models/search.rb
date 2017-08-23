class Search

	attr_reader :term

	def to_partial_path
		'searches/show'
	end


	def initialize(options = {})
		@term = options.fetch(:term, "")
	end

	def products
		Product.where("name iLike?", search_term)
	end


	private

	def search_term
		"%#{term}%"
	end
end