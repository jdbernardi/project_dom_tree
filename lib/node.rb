require 'pry'

class Node

	attr_accessor :tag, :cls, :id, :name, :content, :children, :parent, :depth

	def initialize( tag = nil, cls = [], id = nil, name = nil, content = [], depth = {}, children = [], parent = [] )

		@tag = tag
		@cls = cls
		@id = id
		@name = name
		@content = content
		@depth = depth
		@children = children
		@parent = parent

	end


end