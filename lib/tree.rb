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



	def create_leaf


		return if @stack.empty?

		node = @stack.pop

		@current_node = node.parent

	end





	def add_content_to_parent( content )

		node = @stack.last

		node.children << content

	end




  def inspect

    puts "Tree has #{ @count } nodes."

  end



end


