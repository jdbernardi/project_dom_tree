require 'pry'

class Render


	def render( root )


		current_node = root

		return if !current_node

		current_node.children.each do | child |

				puts ""
				print_attributes( child )
				render( child )

		end


		print "</#{current_node.attributes[:tag]}>" if current_node.attributes != {}


	end #/.render


	def render_text( child )

		print child.to_s

	end




	def print_attributes( child )



		child.attributes.each do | key, value |

			case key

				when :tag

					print "<#{value}"

				when :class

					print "class='#{value}'"

				when :name

					print "name='#{value}'"

				when :id

					print "id='#{value}'"

				when :text

					print "#{value}"

			end

		print ">" if key != :text



		end





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