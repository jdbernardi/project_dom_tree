require 'pry'

class Render


	def render( root )

		# on search function an array is passed in with results - check is made if this is the case
		if root.is_a?( Array )

			root.each do | node |

				render( node )

			end

		end



		current_node = root

		return if !current_node || current_node.is_a?( Array )

		print_tag( current_node ) if current_node.tag != {}

		print_text( current_node )


		current_node.children.each do | child |

				render( child )

		end

		puts "</#{current_node.tag}>" unless current_node.tag == {}

	end #/.render


	def render_text( child )

		print child.to_s

	end


	def new_line?( child )

		!!child.children != []

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

		print ">"


	end



	def print_text( current_node )

		text = current_node.attributes[ :text ]

		if text == "" || !text

			puts ""

		else print text

		end

	end



	def inspect( node )


	end

end #/.Parser