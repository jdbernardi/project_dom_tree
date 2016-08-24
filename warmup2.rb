
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
require_relative 'linked_list'

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


Tag = Struct.new( :type, :class, :id, :name, :content )


class ParseHTML


		def initialize( file )

			@html = File.open( file, "r" )
			@html_string = nil

			@current_node = nil

			@list = LinkedList.new

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

			# find opening tag
				# store in var for first node
			type = find_tag
				# delete from string
			# find class, id, name
		  classes = find_classes

		  id = find_id

		  name = find_name

		  @current_node = Tag.new( type, classes, id, name )

		  @list.add_node( @current_node )


		  @html_string = @html_string.sub( ENTIRE_OPEN_TAG, '' )

		  i = 0
		  content = []

		  while @html_string[ i ] != '<'
binding.pry
		  	content << @html_string[ i ] unless @html_string[ i ].nil?

		  	i += 1

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

