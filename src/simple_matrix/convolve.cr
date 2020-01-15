class SimpleMatrix( T )
	private macro convolve_matrix( window_buffer, window_width, window_height, result_buffer, padding )
		padding_x = {{ padding }}[ :x ]
		padding_y = {{ padding }}[ :y ]

		output_width = @width - {{ window_width }} + padding_x * 2 + 1
		output_height = @height - {{ window_height }} + padding_y * 2 + 1

		output_height.times{|output_y|
			result_row = {{ result_buffer }}[ output_y ]

			output_width.times{|output_x|
				result_row[ output_x ] = T.new 0

				{{ window_buffer }}.each_with_index{|window_row, y|
					target_y = output_y + y

					window_row.each_with_index{|value, x|
						target_x = output_x + x
						out_of_height = target_y < padding_y || target_y > @height + padding_y - 1
						out_of_width = target_x < padding_x || target_x > @width + padding_x - 1

						result = value * ( out_of_height || out_of_width ? 0 : @buffer[ target_y - padding_y ][ target_x - padding_x ] )
						result_row[ output_x ] += result
					}
				}
			}
		}
	end

	def convolve( window : SimpleMatrix( T ), result_matrix : SimpleMatrix( T ), padding : NamedTuple( x: UInt8, y: UInt8 ) = { x: 0_u8, y: 0_u8 } ) : Void
		convolve_matrix window.buffer, window.width, window.height, result_matrix.buffer, padding
	end

	def convolve( window_buffer : Array( Array( T ) ), result_buffer : Array( Array( T ) ), padding : NamedTuple( x: UInt8, y: UInt8 ) = { x: 0_u8, y: 0_u8 } ) : Void
		convolve_matrix window_buffer, window_buffer.size, window_buffer.first.size, result_buffer, padding
	end
end
