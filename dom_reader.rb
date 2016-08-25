# 1. start from root node document
# 2. ignore href and name
# 3. assume tags are closed properly
# 4. remove or ignore < !doctype html >
# 5. should handle cases where text occurs in multiple places such as 		<p> text text <span> hello </span> text text </p>


# set up RSpec
# parser handle simple tags?
# parser handle tags with attributes?
# parser handle nested tags?
# parser handle text before and after nested tags?
# tree have correct number of total nodes?

# then create a Node Renderer
# outputs
	# total nodes