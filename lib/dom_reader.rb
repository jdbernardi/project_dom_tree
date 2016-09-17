

require 'pry'

require_relative 'html'
require_relative 'parser'
require_relative 'render'
require_relative 'searcher'
require_relative 'tree'

class DomReader

	def initialize


		@parser = nil

		@html = nil

		@search_tree = nil

		@render = Render.new

		@tree = nil


	end

	def build_tree( file )

		# here the file will be parsed and fed into the tree
		@html = HTML.new( file )

		@string = @html.html_to_string

		@parser = Parser.new( @string )

		@tree = @parser.parse

		@search = Searcher.new( @tree )


	end


	def render

		@render.render( @tree )

	end

	def search( attribute, value )

		@search.start_keyword_search( attribute, value )

	end

	def search_children( element, attribute, value )

		@search.search_children( element, attribute, value)

	end

	def search_ancestors( element, attribute, value )

		@search.search_ancestors( element, attribute, value )

	end

end #/.DOMReader




