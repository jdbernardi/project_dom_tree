Tag = Struct.new( :type, :class, :id, :name, :content )

class LinkedList

	attr_accessor :head, :last

	def initialize( first_node = nil )

		@head = first_node
		@last = first_node

	end

	def add_first_node( type, cls, id, name, content )

		@head = Tag.new( type, cls, id, name, content )
		@last = @head

	end



	def add_node( type, cls = nil, id = nil, name = nil, content = nil )

		if @head.nil?

			add_first_node( type, cls, id, name, content )

		else

			new_node = Tag.new( type, cls, id, name, content )

			@last.next = new_node

			@last = new_node

		end

		puts "Added node with type: #{type}"

	end




	def find_node( index )


		count = 0
		current_node = @head
		last_node = nil

		while count < index


		raise "No node at index" if current_node.next.nil?

			print_node( current_node, count )

			last_node = current_node
			current_node = current_node.next
			count += 1

		end

		puts "At index #{count}: #{current_node.type}"

		return last_node, count

	end




	def find_word( type )

		puts ""
		puts "FIND TYPE"
		puts ""

		count = 0
		current_node = @head

		loop do

			print_node( current_node, count )

			if current_node.type == word

				return current_node.definition

			elsif current_node.next.nil?

				return false

			end

			count += 1
			current_node = current_node.next

		end


	end





	def print_node( node, index )

		puts "Currently at index #{index}: #{node.type}"

	end





	def print_list

		count = 0
		current_node = @head

		loop do

			print_node( current_node, count )

			return if current_node.next.nil?

			count += 1
			current_node = current_node.next

		end

	end



	def insert_node( type, cls = nil, id = nil, name = nil, content = nil )

		count = 0
		current_node = @head
		last_node = nil


		last_node, count = find_node( index )
		current_node = last_node.next

		if last_node.next.nil?

			add_node( type, cls, id, name, content )

		else

			new_node = Tag.new( type, cls, id, name, content )
			new_node.next = current_node
			last_node.next = new_node

			puts "Inserted #{new_node.type} at index: #{count}"

		end

	end


	def remove_node

		return nil if @head.nil?

		node = @head

		@head = @head.next

		return node

	end






end


