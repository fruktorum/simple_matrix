class SimpleMatrix( T )
	def each( &block : T -> Void ) : Void
		@buffer.each{ |row| row.each{ |value| yield value } }
	end

	def each_with_index( &block : T, Int32, Int32 -> Void ) : Void
		@buffer.each_with_index{ |row, y| row.each_with_index{ |value, x| yield value, y, x } }
	end

	def map!( &block : T, Int32, Int32 -> Void ) : Void
		apply @buffer, &block
	end
end
