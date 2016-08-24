
#storing tags in a Data Structure
# reading in the html file
# a tag will begin with < and we use a regex to grab that
# the first tag will be the root
# a tag will always have a type
	# name, class, id will be optional
	# the tag will have children
	# the children will have a parent
# will need to find
	# opening tag
		# closing tag
		# everything in between
	# each pass will be the next child


require 'pry'
require_relative 'tree.rb'

		OPEN_TAG_REGEX = /^<([^\s|>]+)/
	# for establishing #tags...find all groups of tags
	# this captures all opening tags
		# <([^\/].*?)>
		ALL_OPEN_TAGS_REGEX = /<([^\/].*?)>/

		#ALL_CLOSING_TAGS_REGEX = /<\/(.*?)>/

		CLOSING_TAG_REGEX = /^<\/(.*?)>/

		CLASS_REGEX = /class[ = ]*[",'](.*?)[",']/

		ID_REGEX = /id[ = ]*[",'](.*?)[",']/

		NAME_REGEX = /name[ = ]*[",'](.*?)[",']/

		ENTIRE_OPEN_TAG = /^<.*?>/


Node = Struct.new( :type, :class, :id, :name, :content, :parent, :children )


class ParseHTML


		def initialize( file )

			@html = File.open( file, "r" )
			@html_string = nil

			@current_node = nil

			@tree = Tree.new

		end

		def process_html

			arr = []

			@html.readlines.each do | w |

				arr << w.strip

			end

			@html_string = arr.join



		end



	def parse

		return if @html_string == ''

	  @current_node = Node.new( find_tag, find_classes, find_id, find_name, tag_content )

	 	# add node as parent

	 	# add node as child

	 	# add node without child

	  #if closing_tag

	  #	@tree.children = []

	  # if there is a closing tag, no children


	  binding.pry




  end



	def find_tag

		return @html_string.match( OPEN_TAG_REGEX ).captures.join

	end


	def find_classes

		return @html_string.match( CLASS_REGEX).captures.join.split(' ') unless @html_string.match( CLASS_REGEX ).nil?

	end

	def find_id

		return @html_string.match( ID_REGEX ).captures.join unless @html_string.match( ID_REGEX ).nil?

	end

	def find_name

		@html_string.match( NAME_REGEX ).captures.join unless @html_string.match( NAME_REGEX ).nil?

	end



	def closing_tag

		return @html_string.match( CLOSING_TAG_REGEX ).captures.join unless @html_string.match( CLOSING_TAG_REGEX ).nil?

	end



	def tag_content

		@html_string = @html_string.sub( ENTIRE_OPEN_TAG, '' )

	  content = []

	  while @html_string[ 0 ] != '<' && !@html_string[ 0 ].nil?


	  	content << @html_string[ 0 ]

	  	@html_string = @html_string[1..-1]

	  end

	  return content.join unless content.empty?

	end


end



parse = ParseHTML.new( '/Users/JoeBernardi/VCS/Ruby/project_dom_tree/file.txt' )
parse.process_html
parse.parse

