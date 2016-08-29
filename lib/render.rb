require 'pry'

class Render

	def render( root )

		current_node = root

		while current_node != nil

			print "<#{current_node.tag}>" unless !current_node.tag

			print "#{current_node.content}"

			print "</#{current_node.tag}>" if current_node.children.empty?

			puts ''

			current_node = current_node.children[0]

		end

	end #/.render



	def inspect( node )


	end

end #/.Parser