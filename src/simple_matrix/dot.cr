class SimpleMatrix( T )
	private macro dot_matrices( other_width, other_buffer, result_buffer )
		@buffer.each_with_index{|row, current_y|
			{{ other_width }}.times{|other_x|
				{{ result_buffer }}[ current_y ][ other_x ] = ( 0 .. @width - 1 ).reduce( T.new 0 ){|result, target_index|
					result + row[ target_index ] * {{ other_buffer }}[ target_index ][ other_x ]
				}
			}
		}
	end

	def dot( other_matrix : SimpleMatrix( T ), result_matrix : SimpleMatrix( T ) ) : Void
		dot_matrices other_matrix.width, other_matrix.buffer, result_matrix.buffer
	end

	def dot( other_buffer : Array( Array( T ) ), result_buffer : Array( Array( T ) ) ) : Void
		dot_matrices other_buffer.first.size, other_buffer, result_buffer
	end
end
