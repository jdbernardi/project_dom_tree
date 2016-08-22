require 'pry'

def parse_tag( html_string )

	tag_hash = {}

	type = /^<([a-z]*\d?)/

	classy = /class[ = ]*'(.*?)'/

	id = /id[ = ]*'(.*?)'/

	name = /name[ = ]*'(.*?)'/


	tag_hash[ "type" ] = html_string.match( type ).captures.join

	tag_hash[ "classes" ] = html_string.match( classy ).captures.join.split(' ')

	tag_hash[ "id" ] = html_string.match( id ).captures.join

	tag_hash[ "name" ] = html_string.match( id ).captures.join



end


parse_tag("<p class='foo bar' id='baz' name='fozzie'>")

