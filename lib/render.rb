require 'pry'

class Render

	def initialize

		@stack = []

	end



	def render( root )

		current_node = root



		return if current_node.children.nil?


	  current_node.children.each_with_index do | child, index |

			print "<#{child.tag}>" unless !child.tag

			print "#{child.content}"

			print "</#{child.tag}>" if child.children.empty?

#				if index == current_node.children.count - 1

#					puts "</#{current_node.tag}>"

#			  end

			puts ''

			render( child )

		end



	end #/.render



	def inspect( node )


	end

end #/.Parser