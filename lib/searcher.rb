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

		puts "KEYWORD SEARCH FOR #{attribute} and #{value}"
		puts ""

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

		if child.attributes[@attribute]

			if @attribute == :text

				@results << child if child.attributes[ @attribute ].include?( @value )

			else

			  @results << child if child.attributes[ @attribute ] == @value

		  end

		else

			return

		end

	end

	def search_text( child )

		child.include?( @value ) ? @results << child.to_s : return

	end


	def search_children( node, attribute, value )
		puts "SEARCH CHILDREN"
		puts "For node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		current_node = @tree

		@tag = node
		@attribute = attribute.to_sym
		@value = value

		children( current_node )

		@render.render( @results )


	end


	def children( root )

		return if !root

		current_node = root

		if current_node.tag == @tag

			current_node.children.each do | child |

				# this renders anything below the node
				#@render.render( child )
				search_node( child )

			end

		else

			current_node.children.each do | child |

				children( child )

			end

		end

	end


	def search_ancestors( node, attribute, value )

		puts "SEARCH ANCESTORS"
		puts "For node: #{node} with attribute: #{attribute} and value: #{value}"
		puts ""

		current_node = @tree

		@tag = node
		@attribute = attribute.to_sym
		@value = value

		ancestors( current_node )
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
