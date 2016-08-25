class HTML

	attr_reader :string

	def initialize( file )

		@html = File.open( file, "r" )
		@string = nil

		html_to_string

	end


	def html_to_string

		arr = []

		@html.readlines.each do | w |

			arr << w.strip

		end

		@string = arr.join

	end



end