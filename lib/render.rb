require 'pry'
require_relative 'regex'

class Render

	def initialize


		@open_tag_spacing = 0



	end

	# array is broken up into Nodes
	def render_search_results( root )

		root.each do | node |

			render( node )

		end

	end


	def render( root )

		current_node = root

		return if !current_node


		format_render( current_node )

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

		elsif child.attributes[:text] && child.children == []

			print_text( child )

		elsif child.children != []

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