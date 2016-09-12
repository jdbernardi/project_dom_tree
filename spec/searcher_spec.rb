require 'spec_helper'
require 'parser'
require 'tree'
require 'render'
require 'regex'
require 'node'


describe '.Searcher' do

	let( :render ) { Render.new }
	let( :searcher ) { Searcher.new }

	let( :node ) { Node.new(tag = 'header', cls = ['top-div'], id = nil, name = nil, content = [], children = [], parent = [] )}


	describe '#initialize' do

		it 'render should be a Render' do

			expect( render ).to be_a( Render )

		end

		it 'results should be an array' do

			expect( searcher.results ).to be_a( Array )

		end

	end #./findbykeyword

	describe '#start_keyword_search' do

		it 'should have attribute passed through' do


			searcher.start_keyword_search('class', 'top-div')

			expect( searcher.attribute ).to eq('class')

		end


		it 'should have name passed through' do


			searcher.start_keyword_search('class', 'top-div')

			expect( searcher.value ).to eq('top-div')

		end

	end #./start_keyword_search


	describe '#search_keyword' do

		it 'should return an array of a match' do

			allow( searcher.search_keyword ).to_receive( node )

			expect( searcher.search_keyword( node )).to be true



		end


	end #./search_keyword

end #./Seacher