require 'spec_helper'
require 'parser'
require 'tree'
require 'render'
require 'regex'

describe '.Parser' do


	let( :tree ) { Tree.new }
	let( :render ) { Render.new }
	let( :parser ) { Parser.new( "<head>") }

	let( :open_tag ) { "<head>"}

	describe '#initialize' do


		it 'should initialize html_string' do

			expect( parser.html_string ).to eq("<head>")

		end

		it 'tree should be a tree' do

			expect( tree ).to be_a( Tree )

		end

		it 'render should be a Render' do

			expect( render ).to be_a( Render )

		end


	end


	describe '#open_tag' do


		it 'should return true if opening tag' do

			expect( parser.open_tag? ).to eq( true )

		end



		it 'should return false if closing tag' do

			parser = Parser.new( '</head>')

			expect( parser.open_tag? ).to eq( false )

		end

		it 'should return false if space' do

			parser = Parser.new( ' head>')

			expect( parser.open_tag? ).to eq( false )

		end


		it 'should return false if space' do

			parser = Parser.new( 'head>')

			expect( parser.open_tag? ).to eq( false )

		end

	end #./open_tag

end #/.initialize
