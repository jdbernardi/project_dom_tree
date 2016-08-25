require 'pry'
class Tree

	attr_reader :root, :current_node

	def initialize( node = nil )

		@root = node

    @current_node = @root

    @count = 1

	end


	def add_node( node )

		@current_node.children << node
		node.parent = @current_node

		@current_node = node

		@count += 1

	end



	def create_leaf


		@current_node.children = []

		#have to go back up the tree for more children
		@current_node = @current_node.parent


	end


  def add_parent( parent, new_node )

    parent.children << new_node

    new_node.parent = parent

  end


  def print

  	binding.pry

  end



  def inspect

    puts "Tree has #{ @count } nodes."

  end



end


