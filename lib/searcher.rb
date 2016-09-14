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

		@results = []

		@attribute = attribute.to_sym
		@value = value

		search_keyword( @tree )

		@render.render( @results )

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

			if @attribute == :text

				@results << child if child.attributes[ @attribute ].include?( @value )

			else

			  @results << child if child.attributes[ @attribute ] == @value

		  end

		end

	end


	def search_text( child )

		child.include?( @value ) ? @results << child.to_s : return


	end

end # ./Searcher
