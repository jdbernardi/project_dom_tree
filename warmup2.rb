
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

		ALL_CLOSING_TAGS_REGEX = /<\/(.*?)>/

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

			@tree = nil

		end

		def process_html

			arr = []

			@html.readlines.each do | w |

				arr << w.strip

			end

			@html_string = arr.join



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


		def run_regex

		  @current_node = Node.new( find_tag, find_classes, find_id, find_name )

		  @tree.nil? ? @tree = Tree.new( @current_node ) : @tree.add_nodde( @current_node )

		  @html_string = @html_string.sub( ENTIRE_OPEN_TAG, '' )

		  content = []

		  while @html_string[ 0 ] != '<' && !@html_string[ 0 ].nil?


		  	content << @html_string[ 0 ]

		  	@html_string = @html_string[1..-1]

		  end

		  if !content.empty?

		  	@current_node.content = content.join

		  end
binding.pry
				# if none, move on
				# if found - store in node
					# delete from string
			# find next tag
				# if none
				# node empty
			# find the next opening tag
			# do this until string is empty

			# when reprinting the string
				# manufacture the < >, /> and =
				# all content pulled from structs in linked list



	end



end



parse = ParseHTML.new( '/Users/JoeBernardi/VCS/Ruby/project_dom_tree/file.txt' )
parse.process_html
parse.run_regex

