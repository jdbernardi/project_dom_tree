
#storing tags in a Data Structure

require 'pry'

Tags = Struct.new( :type, :class, :id, :name )

def parse_tag( html_string )

	type_regex = /^<([a-z]*\d?)/

	class_regex = /class[ = ]*'(.*?)'/

	id_regex = /id[ = ]*'(.*?)'/

	name_regex = /name[ = ]*'(.*?)'/



	type = html_string.match( type_regex ).captures.join

	classes = html_string.match( class_regex ).captures.join.split(' ')

	id = html_string.match( id_regex ).captures.join

	name = html_string.match( name_regex ).captures.join



	node = Tags.new( type, classes, id, name )

	puts "Type: #{node.type}"
	puts "Classes: #{node.class}"
	puts "ID: #{node.id}"
	puts "Name: #{node.name}"


end


parse_tag("<p class='foo bar' id='baz' name='fozzie'>")

