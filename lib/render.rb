require 'pry'

class Render


	def render( root )


		current_node = root

		return if !current_node

		print_tag( current_node )

		print ">"

		print_text( current_node )

		current_node.children.each do | child |

				puts "" if child.children != []

				render( child )


		end


		puts "</#{current_node.tag}>" if current_node.tag != {}


	end #/.render


	def render_text( child )

		print child.to_s

	end




	def print_tag( child )


		print "<#{child.tag}" if child.tag != {}


		child.attributes.each do | key, value |


			case key

				when :class

					print " class='#{value}'"

				when :name

					print " name='#{value}'"

				when :id

					print " id='#{value}'"

			end

		end

	end



	def print_text( current_node )

		if current_node.attributes[:text] != ""

			print current_node.attributes[:text]

		end

	end



	def render_keyword_search( attribute, name )

		binding.pry

	end


	def inspect( node )


	end

end #/.Parser