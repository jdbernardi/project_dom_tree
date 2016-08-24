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

	  binding.pry


	end


	def create_leaf


		@current_node.children = []

		#have to go back up the tree for more children
		@current_node = @current_node.parent


	  binding.pry


	end


	def insert_node( node )

		# this node will always have a parent


	end


  def add_parent( parent, new_node )

    parent.children << new_node

    new_node.parent = parent

  end



	def add_child( parent )

		moves = within_board?( [ parent.x, parent.y ])

	  moves.each do | coords |

      new_node = Move.new( coords[ 0 ], coords[ 1 ], parent.depth + 1, [], nil )

      add_parent( @current_node, new_node )

    end

    return parent

	end





  def inspect

    puts "Tree has #{ @count } nodes."

  end



end


