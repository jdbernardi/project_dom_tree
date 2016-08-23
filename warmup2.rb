
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

		OPEN_TAG_REGEX = /^<([a-z]*\d?)/
	# for establishing #tags...find all groups of tags
	# this captures all opening tags
		# <([^\/].*?)>
		ALL_TAGS_REGEX = /<([^\/].*?)>/

		CLASS_REGEX = /class[ = ]*'(.*?)'/

		ID_REGEX = /id[ = ]*'(.*?)'/

		NAME_REGEX = /name[ = ]*'(.*?)'/


class ParseHTML


	def initialize( file )

		@html = File.open( file, "r" )
		@html_string = nil

		@list = nil

	end

	def process_html

		arr = []

		@html.readlines.each do | w |

			arr << w.strip

		end

		@html_string = arr.join



	end


	def run_regex




		# find opening tag
			# store in var for first node
			# delete from string
		# find class, id, name
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


	type = @html_string.match( OPEN_TAG_REGEX ).captures.join


	classes = @html_string.match( CLASS_REGEX).captures.join.split(' ') unless @html_string.match( CLASS_REGEX ).nil?

	id = @html_string.match( ID_REGEX ).captures.join unless @html_string.match( ID_REGEX ).nil?

	name = @html_string.match( NAME_REGEX ).captures.join unless @html_string.match( NAME_REGEX ).nil?

end



end


#finds just content of first tag
# /^<[a-z]*\d?>(.*?)</

# finds anything between > ... <
# >(.*?)<

parse = ParseHTML.new( '/Users/JoeBernardi/VCS/Ruby/project_dom_tree/file.txt' )
parse.process_html
parse.run_regex

