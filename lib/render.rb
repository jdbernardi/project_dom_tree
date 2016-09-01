require 'pry'

class Render

	def initialize

		@stack = []

	end



	def render( root )

		current_node = root

		@stack << current_node

		return if current_node.children.nil?

# if we are at the last child of the parent
# we print the parents closing tag

	  current_node.children.each_with_index do | child, index |


			print "<#{child.tag}>" unless !child.tag
			print "#{child.content}"
			print "</#{child.tag}>" if child.children.empty?


			puts ''

			render( child )

		end


	end #/.render





	def inspect( node )


	end

end #/.Parser