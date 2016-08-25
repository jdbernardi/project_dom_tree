require 'pry'

require_relative 'tree.rb'

		OPEN_TAG_REGEX = /^<([^\s|>]+)/

		#ALL_OPEN_TAGS_REGEX = /<([^\/].*?)>/

		#ALL_CLOSING_TAGS_REGEX = /<\/(.*?)>/

		CLOSING_TAG_REGEX = /^<\/(.*?)>/

		CLASS_REGEX = /class[ = ]*[",'](.*?)[",']/

		ID_REGEX = /id[ = ]*[",'](.*?)[",']/

		NAME_REGEX = /name[ = ]*[",'](.*?)[",']/

		ENTIRE_OPEN_TAG = /^<.*?>/


Node = Struct.new( :tag, :class, :id, :name, :content, :parent, :children )


class ParseHTML


	def initialize( file )

		@html = File.open( file, "r" )
		@html_string = nil

		@current_node = nil

	end

	def process_html

		arr = []

		@html.readlines.each do | w |

			arr << w.strip

		end

		@html_string = arr.join


	end


	def generate_root

	  @current_node = Node.new( find_tag, find_classes, find_id, find_name, tag_content, nil, [] )

	  @tree = Tree.new( @current_node )

	  parse

  end


	def parse

		return if @html_string == ''

		if closing_tag

			remove_closing_tag
			@tree.create_leaf( @current_node )

		else

			new_node = create_node
			@tree.add_node( new_node )

	  end

	  parse

  end


  def remove_closing_tag

  	@html_string = @html_string.sub( ENTIRE_OPEN_TAG, '' )

  end


  def create_node

  	return Node.new( find_tag, find_classes, find_id, find_name, tag_content, nil, [] )

  end



	def find_tag

		return @html_string.match( OPEN_TAG_REGEX ).captures.join unless @html_string.match( OPEN_TAG_REGEX ).nil?

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


	def print

		binding.pry

	end

end



parse = ParseHTML.new( '/Users/JoeBernardi/VCS/Ruby/project_dom_tree/test.html' )
parse.process_html
parse.generate_root
parse.print

