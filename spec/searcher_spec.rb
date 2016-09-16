require 'spec_helper'
require 'parser'
require 'tree'
require 'render'
require 'regex'
require 'node'
require 'html'
require 'DOMReader'


describe '.Searcher' do

	let( :render ) { Render.new }
	let( :search ) { Searcher.new }
	let( :dom ) { DOMReader.new }

	let( :node ) { Node.new(tag = 'header', cls = ['top-div'], id = nil, name = nil, content = [], children = [], parent = [] )}


	describe '#initialize' do

		it 'render should be a Render' do

			expect( render ).to be_a( Render )

		end

		it 'results should be an array' do

			expect( search.results ).to be_a( Array )

		end

	end #./findbykeyword

	describe '#start_keyword_search' do

		it 'should have attribute passed through' do


			search.start_keyword_search('class', 'top-div')

			expect( search.attribute ).to eq('class')

		end


		it 'should have name passed through' do


			search.start_keyword_search('class', 'top-div')

			expect( search.value ).to eq('top-div')

		end

	end #./start_keyword_search


	describe '#search_keyword' do

		it 'should return an array of a match' do

			allow( search.search_keyword ).to_receive( node )

			expect( search.search_keyword( node )).to be true



		end


	end #./search_keyword

# how to get the tree in the test suite?
	describe '#get_node' do

		it 'should return the node to start searching with' do
				#dom = DOMReader.new
				#dom.build_tree( '/Users/JoeBernardi/VCS/Ruby/project_dom_tree/test.html' )
				#dom.search_children( "body", "class", "top-div")
				#search.instance_variable_set( :@tag, "body")

				expect( search.get_node( search.tree )).to eq( true )


		end


	end #./get_node

end #./Seacher