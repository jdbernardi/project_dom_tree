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


		format_render( current_node )

		# then iterate through each of the children of the node
		if current_node.children != []
			current_node.children.each do | child |

					render( child )

			end

		end


		puts "</#{current_node.tag}>" unless current_node.tag == {}


	end #/.render



	def print_tag( child )

	  print "<#{child.tag}".rjust(@open_tag_spacing) if child.tag != {}

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

		print current_node.attributes[ :text ]

	end


	def format_render( child )


		print_tag( child ) if child.tag != {}

		adjust_spacing( child )

		if child.tag == 'em'

			print_text( child )

		# the tag will have either text or a child
		elsif child.attributes[:text] && child.children == []
		# if there is no text then we jump to next line
			print_text( child )

		elsif child.children != []
			# if there is a child, then we jump to next line
			print_text( child )
			puts ""

		end

	end


	def adjust_spacing( child )

		if child.children != []

			@open_tag_spacing += 2

		end

	end


end #/.Parser