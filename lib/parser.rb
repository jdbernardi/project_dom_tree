
require 'pry'
require_relative 'node'
require_relative 'tree.rb'
require_relative 'render.rb'
require_relative 'regex'
require_relative 'searcher'



class Parser

	attr_reader :html_string, :current_node, :html_tags, :html_content, :search

	def initialize( html_string )

		@tree = Tree.new

		@html_string = html_string

		@current_node = nil

	end


	def parse

		return @tree.root if @html_string == ""

		if open_tag?


			attributes = find_attributes
			node = create_node( attributes )
			@tree.add_node( node )


		else

			check_string

		end

		parse

  end


  def search



  end



  def check_string

  	if closing_tag?

  		remove_tag
  		@tree.create_leaf

  	else

  		add_text_to_parent

  	end

  end


  def add_text_to_parent

  	@tree.add_content_to_parent( @html_string.scan( TEXT ).join)

  	remove_text

  end


  def remove_text

		@html_string = @html_string.sub( TEXT, '' )

  end


	def new_node?

		!!open_tag?

	end


  def create_node( attrs )

  	node = Node.new( attrs[ :tag ], attrs[ :cls ],
										 attrs[ :id ], attrs[ :name ], tag_content  )

  end


  def open_tag?

  	!!@html_string.match( OPEN_TAG_REGEX )

  end


  def closing_tag?

  	!!@html_string.match( CLOSING_TAG_REGEX )

  end




  def remove_tag

		@html_string = @html_string.sub( ENTIRE_OPEN_TAG, '' )

  end


  def tag?

  	!!@html_string.match( ENTIRE_OPEN_TAG )

  end



  def render

  	@render.render( @tree.root )

  end



	def find_attributes

		attributes = {}

		open_tag = @html_string.match( ENTIRE_OPEN_TAG )[ 0 ]

		attributes = check_attributes( attributes, open_tag )

		return attributes

	end


	def check_attributes( attributes, open_tag )

		attributes[ :tag ] = open_tag.match( OPEN_TAG_REGEX ).captures.join.strip

		attributes[ :cls ] = open_tag.match( CLASS_REGEX ).captures.join(' ') unless open_tag.match( CLASS_REGEX ).nil?

		attributes[ :name ] = open_tag.match( NAME_REGEX ).captures.join unless open_tag.match( NAME_REGEX ).nil?

		attributes[ :id ] = open_tag.match( ID_REGEX ).captures.join unless open_tag.match( ID_REGEX ).nil?



		return attributes

	end





	def tag_content

		remove_tag

	  content = []

	  while @html_string[ 0 ] != '<' && !@html_string[ 0 ].nil?


	  	content << @html_string[ 0 ]

	  	@html_string = @html_string[1..-1]

	  end

	  return content.join unless content.empty?

	end



end

