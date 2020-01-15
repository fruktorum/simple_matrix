class SimpleMatrix( T )
	private macro mul_matrices( other_buffer, result_buffer )
		@buffer.each_with_index{|row, y|
			other_row = {{ other_buffer }}[ y ]
			result_row = {{ result_buffer }}[ y ]

			row.each_with_index{ |value, x| result_row[ x ] = value * other_row[ x ] }
		}
	end

	private macro mul_value( value, result_buffer )
		@buffer.each_with_index{|row, y|
			result_row = {{ result_buffer }}[ y ]
			row.each_with_index{ |matrix_value, x| result_row[ x ] = matrix_value * {{ value }} }
		}
	end

	def mul( other_matrix : SimpleMatrix( T ), result_matrix : SimpleMatrix( T ) ) : Void
		mul_matrices other_matrix.buffer, result_matrix.buffer
	end

	def mul( other_buffer : Array( Array( T ) ), result_buffer : Array( Array( T ) ) ) : Void
		mul_matrices other_buffer, result_buffer
	end

	def mul( value : Number, result_matrix : SimpleMatrix( T ) ) : Void
		mul_value value, result_matrix.buffer
	end

	def mul( value : Number, result_buffer : Array( Array( T ) ) ) : Void
		mul_value value, result_buffer
	end
end
