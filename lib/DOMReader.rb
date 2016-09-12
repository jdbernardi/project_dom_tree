# master file to house the main functionality
# 1. start from root node document
# 2. ignore href and name
# 3. assume tags are closed properly
# 4. remove or ignore < !doctype html >
# 5. should handle cases where text occurs in multiple places such as 		<p> text text <span> hello </span> text text </p>


# set up RSpec
# parser handle simple tags?
# parser handle tags with attributes?
# parser handle nested tags?
# parser handle text before and after nested tags?
# tree have correct number of total nodes?


require 'pry'

require_relative 'html'
require_relative 'parser'
require_relative 'render'
require_relative 'searcher'
require_relative 'tree'

class DOMReader

	def initialize


		@parser = nil

		@html = nil

		@search_tree = nil


	end

	def build_tree( file )

		# here the file will be parsed and fed into the tree
		@html = HTML.new( file )

		@string = @html.html_to_string

		@parser = Parser.new( @string )

		@search_tree = @parser.parse


	end


	def render

		@parser.render

	end

	def search

		Searcher.new( @search_tree )

	end


end #/.DOMReader


dom = DOMReader.new
dom.build_tree( '/Users/JoeBernardi/VCS/Ruby/project_dom_tree/test.html' )
dom.render
dom.search


