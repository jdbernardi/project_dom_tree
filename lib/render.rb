require 'pry'

class Render




	def render( root )

		current_node = root

		return if current_node.children.nil?


	  current_node.children.each do | child |

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