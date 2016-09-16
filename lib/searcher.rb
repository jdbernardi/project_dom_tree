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
		@start_node = nil


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

		  end

		end

	end



	def get_node( root = nil )

		return if !root

		if root.tag == @tag

				search_tree( root )

		else

			root.children.each do | child |

			  get_node( child )

			end

		end

	end



	def search_children( node, attribute, value )
		puts ""
		puts "SEARCH CHILDREN"
		puts "Below node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		@results = []

		current_node = @tree

		set_values( node, attribute, value )

		get_node( @tree )

		@render.render( @results )


	end


	def set_values( tag, attribute, value )

		@tag = tag
		@attribute = attribute.to_sym
		@value = value

	end



	def search_ancestors( node, attribute, value )

		puts ""
		puts "SEARCH ANCESTORS"
		puts "For node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		@results = []

		current_node = @tree

		set_values( node, attribute, value )

		search_tree( current_node )

		@render.render( @results )


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
