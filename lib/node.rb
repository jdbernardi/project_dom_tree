require 'pry'

class Node

	attr_accessor :tag, :cls, :id, :name, :content, :children, :parent

	def initialize( tag = nil, cls = [], id = nil, name = nil, content = [], children = [], parent = nil )

		@tag = tag
		@cls = cls
		@id = id
		@name = name
		@content = []
		@children = []
		@parent = parent

	end


end