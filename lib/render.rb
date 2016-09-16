require 'pry'

class Render

	def initialize


		@spacing = 0


	end


	def render_search_results( root )

		root.each do | node |

			render( node )

		end

	end


	def render( root )


		current_node = root

		return if !current_node || current_node.is_a?( Array )

		print_tag( current_node ) if current_node.tag != {}

		print_text( current_node )


		current_node.children.each do | child |

				render( child )

		end

		puts "</#{current_node.tag}>" unless current_node.tag == {}

	end #/.render



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