require 'pry'
require_relative 'node'

class Tree

	attr_reader :root, :current_node, :children

	def initialize

		@root = Node.new( 'document' )

    @current_node = @root

    @count = 1

	end


	def add_node( node )


		@current_node.children << node
		node.parent = @current_node

		@current_node = node

		@count += 1

	end



	def create_leaf( node )

		#have to go back up the tree for more children
		@current_node = node


	end



  def print

  	binding.pry

  end



  def inspect

    puts "Tree has #{ @count } nodes."

  end



end


