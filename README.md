# project_dom_tree
Like leaves on the wind

[A data structures, algorithms, file I/O, ruby and regular expression (regex) project from the Viking Code School](http://www.vikingcodeschool.com)


Joe Bernardi

In the dom_reader.rb file set up the code as below:

# create the dom_reader
dom = DomReader.new
# add the file file
dom.build_tree( '/.file' )

# render the HTML file in the terminal
dom.render

# to search for an attribute and it's value use the below
dom.search("name", "joe")

# to search for the children of a particular node
# pass in the element ('h1') the attribute ('class') and the value "funky"
dom.search_children( "html", "id", "shoes")

# to search the parent of a particular node, pass in the node, attribute and value -- similar to child search
dom.search_ancestors( "h2", "class", "super-header")