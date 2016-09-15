require_relative 'tree'
require 'pry'


class Searcher

	attr_accessor :tree

	attr_reader :results, :attribute, :value

	def initialize( tree = nil )

		@tree = tree
		@render = Render.new
		@results = []
		@tag = nil


	end



	def start_keyword_search( attribute, value )

		puts ""
		puts "KEYWORD SEARCH FOR #{attribute} and #{value}"
		puts ""

		@results = []

		@attribute = attribute.to_sym
		@value = value

		search_tree( @tree )

		@render.render( @results )

	end




	def search_tree( root )

		current_node = root

		return if current_node.children == []

			current_node.children.each do | child |

				search_node( child )

				search_tree( child )

			end


	end




	def search_node( child )

		if child.attributes

			if @attribute == :text

				@results << child if child.attributes[ @attribute ].include?( @value )

			elsif child.attributes[@attribute] && child.attributes[@attribute].include?(@value)

			  @results << child

			else

				return

		  end

		end

	end




	def search_text( child )

		child.include?( @value ) ? @results << child.to_s : return

	end


	def search_children( node, attribute, value )
		puts ""
		puts "SEARCH CHILDREN"
		puts "Below node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		@results = []

		current_node = @tree

		@tag = node
		@attribute = attribute.to_sym
		@value = value

		search_tree( current_node )

		@render.render( @results )


	end







	def search_ancestors( node, attribute, value )

		puts ""
		puts "SEARCH ANCESTORS"
		puts "For node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		current_node = @tree
		@results = []

		@tag = node
		@attribute = attribute.to_sym
		@value = value

		ancestors( current_node )


	end



	def ancestors( node )

		return if !node
		# pass in the element (AKA node)
		current_node = root
		# if the tag of the current node matches the result
		if current_node.tag == @tag

			current_node.parent.each do | parent |

				@render.render( parent )

			end

		else

			current_node.children.each do | child |

				children( child )

			end

		end

	end

end # ./Searcher
