require 'pry'

class Render




	def render( root )

		current_node = root

		return if current_node.children.nil?


	  current_node.children.each do | child |


			print_attributes( child )

			print ">"

			print "#{child.content}"
			print "</#{child.tag}>" if child.children.empty?
			puts ''


			render( child )

		end


	end #/.render



	def print_attributes( child )

		print "<#{child.tag}" if child

		print " class='#{child.cls}'" if child.cls

		print " name='#{child.name}'" if child.name

		print " id='#{child.id}'" if child.id

	end



	def inspect( node )


	end

end #/.Parser