class HTML

	attr_reader :string

	def initialize( html )

		@html = html


	end


	def html_to_string

		string = ''

		File.readlines( @html ).each do | line |

			string += line.strip

		end

		return string

	end



end