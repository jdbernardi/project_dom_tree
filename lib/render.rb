require 'pry'

class Render


# base case no children
# start with the root node
	# print opening tag
		# render all children
		# recursion
	# print closing

	def render( root )

		current_node = root

		return if current_node.children.nil?

			print_attributes( current_node )

			print ">"

			print_content( current_node )

			current_node.children.each do | child |

				render( child ) if child.class == Node
				render_text( child ) if child.class == String

			end

			print "</#{current_node.tag}>"

			puts ""

	end #/.render


	def render_text( child )

		print child.to_s

	end




	def print_attributes( child )

		print "<#{child.tag}" if child

		print " class='#{child.cls}'" if child.cls

		print " name='#{child.name}'" if child.name

		print " id='#{child.id}'" if child.id

		puts "" if !child.content

	end



	def print_content( child )

			print "#{child.content}"

	end


	def print_closing( child )

		print "</#{child.tag}>" if child.children.empty?

	end


	def render_keyword_search( attribute, name )

		binding.pry

	end


	def inspect( node )


	end

end #/.Parser