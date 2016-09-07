require 'pry'
require_relative 'node'

class Tree

	attr_reader :root, :current_node, :children

	def initialize

		@root = Node.new( 'document' )

    @current_node = @root

    @stack = [ @root ]

    @count = 1

	end


	def add_node( node )

		@current_node.children << node

		@stack << node

		node.parent = @current_node

		@current_node = node

		@count += 1

	end



	def create_leaf( node )

		#remove_from_stack
		#have to go back up the tree for more children
		#remove parent to get printout to work
		@current_node = node.parent

	end





	def add_content_to_parent( content )

		@current_node.content << content

	end


	def add_special_tag( tag, content )

		@current_node.content << "<#{tag}>" + content + "</#{tag}>"

	end


  def inspect

    puts "Tree has #{ @count } nodes."

  end



end


