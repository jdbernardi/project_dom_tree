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


		it 'should return false if leading text' do

			parser = Parser.new( 'head>')

			expect( parser.open_tag? ).to eq( false )

		end


	end #./open_tag



	describe '#closing_tag?' do

		it 'should return true if closing tag' do

			parser = Parser.new( "</head><h1 class='me'> hi</h1>")

			expect( parser.closing_tag? ).to be true

		end


		it 'should return false if NO closing tag' do

			parser = Parser.new( "<head ><h1 class='me'> hi</h1>")

			expect( parser.closing_tag? ).to be false

		end


		it 'should return false if text' do

			parser = Parser.new( "h1 class='me'> hi</h1>")

			expect( parser.closing_tag? ).to be false

		end


		it 'should return false if leading spaces' do

			parser = Parser.new( "  h1 class='me'> hi</h1>")

			expect( parser.closing_tag? ).to be false

		end


	end #/.closing_tag?



	describe "#remove_tag" do

		it 'should remove the first tag in the string' do

			parser = Parser.new( "<header class='hello'>Hello text</header>")

			expect( parser.remove_tag ).to eq("Hello text</header>")


		end


	end #/.remove_tag




	describe '#new_node' do

		it 'should return true if new open tag and not special tag' do

			expect( parser.new_node? ).to be true

		end

		it 'should return false if closing tag' do

			parser = Parser.new( "</head>")

			expect( parser.new_node? ).to be false

		end


		it 'should return false if spaces' do

			parser = Parser.new( " text text")

			expect( parser.new_node? ).to be false

		end

		it 'should return false if text' do

			parser = Parser.new( "text text")

			expect( parser.new_node? ).to be false

		end

	end

end #/.initialize
