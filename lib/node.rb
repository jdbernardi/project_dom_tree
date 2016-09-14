require 'pry'

class Node

	attr_accessor :attributes, :children, :parent, :tag

	def initialize( tag = "", attributes = {}, children = [], parent = [] )

		@tag = tag
		@attributes = attributes
		@children = children
		@parent = parent


	end


end