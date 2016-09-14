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


	def search_descendants( child )

		# a node is passed in ie. div
		# that tag is searched recursively until found
			# when found
			# the children of that that div are then searched recursively for the match
				# matches are fed into results and then to render


	end

	def search_ancestors( child )

		# a node is passed in and attribute and value
		# the tree is searched recursively until a match for the tag is found
		# if there is a match
			# returns if there is no parent
			# the current node is the parent of the child
			# the parents attributes are searched
				# if a match, the results are populates
			# if no match
				# the parent of the current node becomes the current node

		# the results are rendered when completed


	end



end # ./Searcher
