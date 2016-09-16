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

		set_values( nil, attribute, value )

		traverse_children( @tree )

		render_results

	end



	def traverse_children( root )

		current_node = root


		return if current_node.children == []

			current_node.children.each do | child |

				search_node( child )

				traverse_children( child )

			end


	end


	def traverse_parents( root )

		return if root.parent == []
		# set the current node as the parent
		current_node = root.parent

		search_node( current_node )

		traverse_parents( current_node )


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

				@ancestor_search ? traverse_parents( root ) : traverse_children( root )

		else

			root.children.each do | child |

			  find_first_node( child )

			end

		end

	end



	def search_children( node, attribute, value )

		@results = []

		set_values( node, attribute, value )

		find_first_node( @tree )

		render_results


	end




	def set_values( tag, attribute, value )

		@tag = tag
		@attribute = attribute.to_sym
		@value = value

	end


	def render_results

		@render.render_search_results( @results )

	end


	def search_ancestors( node, attribute, value )


		@ancestor_search = true

		search_children( node, attribute, value )


	end



end # ./Searcher
