class SimpleMatrix( T )
	private macro transpose_matrix( result_buffer )
		target_y, target_x = 0, 0

		@buffer.each_with_index{|row, y|
			row.each_with_index{|value, x|
				{{ result_buffer }}[ target_y ][ target_x ] = value

				target_y += 1
				target_y, target_x = 0, target_x + 1 if target_y == @width
			}
		}
	end

	def transpose( result_matrix : SimpleMatrix( T ) ) : Void
		transpose_matrix result_matrix.buffer
	end

	def transpose( result_buffer : Array( Array( T ) ) ) : Void
		transpose_matrix result_buffer
	end
end
