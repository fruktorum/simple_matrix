class SimpleMatrix( T )
	private macro compare_buffers( buffer1, buffer2 )
		result = true

		{{ buffer1 }}.each_with_index{|row1, y|
			row2 = {{ buffer2 }}[ y ]
			row1.each_with_index{ |value, x| break result = false if value != row2[ x ] }
			break unless result
		}

		result
	end

	def ==( other : SimpleMatrix ) : Bool
		return false if @width != other.width || @height != other.height
		compare_buffers @buffer, other.buffer
	end

	def ==( other_buffer : Array( Array( T ) ) ) : Bool
		return false if @height != other_buffer.size
		return false unless other_buffer.all? &.size.==( @width )
		compare_buffers @buffer, other_buffer
	end
end
