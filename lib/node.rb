require 'pry'

class Node

	attr_accessor :attributes, :children, :parent

	def initialize( attributes = {}, children = [], parent = [] )

		@attributes = attributes
		@children = children
		@parent = parent


	end


end