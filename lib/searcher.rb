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

		@attribute = attribute
		@value = value

		search_keyword( @tree )

	end


	def search_keyword( root = nil )



=begin
		return if !current_node

			current_node.children.each do | child |

				if child.cls == @attribute && child.name == @name

					@results << child

				end

			search_keyword( child )

		end
=end
	end


end #/.Parser