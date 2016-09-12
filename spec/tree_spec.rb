require 'spec_helper'
require 'parser'
require 'tree'
require 'render'
require 'regex'
require 'node'

describe '.tree' do

	let( :tree ) { Tree.new }
	let( :render ) { Render.new }
	let( :node ) { Node.new( tag = "html", cls = [], id = nil, name = nil, content = [], children = [], parent = [] )}

	let( :search ) { Searcher.new }

	let( :open_tag ) { "<head>"}



	describe '#initialize' do


		it 'should initialize @root' do

			expect( tree.root.tag ).to eq('document')

		end

		it 'tree should be a tree' do

			expect( tree ).to be_a( Tree )

		end

		it 'render should be a Render' do

			expect( render ).to be_a( Render )

		end



	end #./init

=begin
	describe '#add_node' do


		it 'should add child to parent' do


			expect( node.parent.tag ).to eq('document')

			tree.add_node( node )

		end

	end #./add_node

=end


end #./tree