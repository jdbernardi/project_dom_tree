require_relative 'tree'
require 'pry'


class Searcher

	attr_accessor :tree

	attr_reader :results, :attribute, :value

	def initialize( tree = nil )

		@tree = tree
		@render = Render.new
		@results = []


	end



	def start_keyword_search( attribute, value )

		@attribute = attribute.to_sym
		@value = value

		search_keyword( @tree )

		binding.pry

	end


	def search_keyword( root )

		current_node = root

		return if current_node.children == []

			current_node.children.each do | child |

				search_node( child )

				search_keyword( child )

			end


	end


	def search_node( child )

				# take the attribute passed in
		if child.attributes[@attribute]


			@results << child if child.attributes[ @attribute ] == @value

		end

	end


	def search_text( child )

		child.include?( @value ) ? @results << child.to_s : return


	end

end # ./Searcher
