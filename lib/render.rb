require 'pry'

class Render

	def initialize

		@stack = []

	end



	def render( root )

		current_node = root

		@stack << current_node

		return if current_node.children.nil?


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