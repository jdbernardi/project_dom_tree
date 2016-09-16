require 'pry'
require_relative 'regex'

class Render

	def initialize


		@open_tag_spacing = 0
		@closing_tag_spacing = 0


	end


	def render_search_results( root )
		# breaks up the passed results array into nodes to send to render
		root.each do | node |

			render( node )

		end

	end


	def render( root )

		current_node = root

		return if !current_node

		print "".ljust( @open_tag_spacing )

		# print out the entire tag and any text associated with it
		print_tag( current_node ) if current_node.tag != {}
		print_text( current_node )

		# then iterate through each of the children of the node
		if current_node.children != []
			current_node.children.each do | child |

					render( child )

			end

		end


		puts "</#{current_node.tag}>".rjust(@closing_tag_spacing) unless current_node.tag == {}


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

		else

			print text

		end

	end


	def format_render( child )

		# if the node has children
		if child.children != []
			# we render each child with spacing
			print "".ljust( @open_tag_spacing )
			# increment the open_tag_spacing


		elsif child.tag == "li" || child.tag == "h2"
		# if the node does NOT have children
			print "".ljust( @open_tag_spacing )
			# the spacing remains the same
		elsif child.children == []

			print "".ljust( @open_tag_spacing )




		end



	end



end #/.Parser