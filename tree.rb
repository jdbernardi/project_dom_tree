require 'pry'
class Tree

	attr_reader :root

	def initialize( node )

		@root = node

    @current_node = @root

    @count = 1

	end


	def add_node



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


