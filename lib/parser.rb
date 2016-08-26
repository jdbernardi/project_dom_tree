
require 'pry'
require_relative 'node'

require_relative 'tree.rb'

		OPEN_TAG_REGEX = /^<([^\s|>]+)/

		#ALL_OPEN_TAGS_REGEX = /<([^\/].*?)>/

		#ALL_CLOSING_TAGS_REGEX = /<\/(.*?)>/

		CLOSING_TAG_REGEX = /^<\/(.*?)>/

		CLASS_REGEX = /class[ = ]*[",'](.*?)[",']/

		ID_REGEX = /id[ = ]*[",'](.*?)[",']/

		NAME_REGEX = /name[ = ]*[",'](.*?)[",']/

		ENTIRE_OPEN_TAG = /^<.*?>/


class Parser

	attr_reader :html_string, :current_node

	def initialize( html_string )

		@tree = Tree.new

		@html_string = html_string

		@current_node = nil

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
			@current_node = new_node

	  end

	  parse

  end


  def remove_closing_tag

  	@html_string = @html_string.sub( ENTIRE_OPEN_TAG, '' )

  end


  def create_node

  	return Node.new( find_tag, find_classes, find_id, find_name, tag_content, [], [] )

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

		@current_node = @tree.root

		while @current_node != nil

			puts @current_node.tag

			@current_node = @current_node.children[0]

		end

	end

end

