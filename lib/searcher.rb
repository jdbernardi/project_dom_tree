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
binding.pry
	end


	def search_keyword( root )

		current_node = root

		return if current_node.children.nil?

			current_node.children.each do | child |

				search_node( child ) if child.class == Node
				search_text( child ) if child.class == String

				search_keyword( child )

			end


	end


	def search_node( child )
binding.pry
				# take the attribute passed in
			case @attribute
		# if the attribute is class
			when "class"
		# check the class of each tag
				if child.cls
			# if a class is found
			binding.pry
					@results << child if child.cls == @value
				end

			end

	end


	def search_text( child )

		child.include?( @value ) ? @results << child.to_s : return


	end

end # ./Searcher
