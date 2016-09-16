require_relative 'tree'
require 'pry'


class Searcher

	attr_accessor :tree, :tag

	attr_reader :results, :attribute, :value

	def initialize( tree = nil )

		@tree = tree
		@render = Render.new
		@results = []
		@tag = nil
		@ancestor_search = nil


	end



	def start_keyword_search( attribute, value )

		puts ""
		puts "KEYWORD SEARCH FOR #{attribute} and #{value}"
		puts ""

		@results = []

		@attribute = attribute.to_sym
		@value = value

		traverse_tree( @tree )

		@render.render( @results )

	end




	def traverse_tree( root )

		current_node = root


		return if current_node.children == []

			current_node.children.each do | child |

				search_node( child )

				traverse_tree( child )

			end


	end


	def ascend_tree( root )

		return if root.parent == []
		# set the current node as the parent
		current_node = root.parent

		search_node( current_node )

		ascend_tree( current_node )


	end



	def search_node( child )

		if child.attributes

			if @attribute == :text

				@results << child if child.attributes[ @attribute ].include?( @value )

			elsif !!child.attributes[@attribute] && child.attributes[@attribute].include?(@value)

			  @results << child

		  end

		end

	end



	def find_first_node( root = nil )

		return if !root

		if root.tag == @tag

				@ancestor_search ? ascend_tree( root ) : traverse_tree( root )

		else

			root.children.each do | child |

			  find_first_node( child )

			end

		end

	end



	def search_children( node, attribute, value )
		puts ""
		puts "SEARCH CHILDREN Below node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		@results = []

		current_node = @tree

		set_values( node, attribute, value )

		find_first_node( @tree )

		@render.render( @results )


	end


	def set_values( tag, attribute, value )

		@tag = tag
		@attribute = attribute.to_sym
		@value = value

	end



	def search_ancestors( node, attribute, value )

		puts ""
		puts "SEARCH ANCESTORS For node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		@results = []

		current_node = @tree

		@ancestor_search = true

		set_values( node, attribute, value )

		find_first_node( @tree )

		@render.render( @results )


	end



end # ./Searcher
