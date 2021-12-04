class SimpleMatrix(T)
  private macro apply_function(result_buffer)
		@buffer.each_with_index{|row, y|
			result_row = {{ result_buffer }}[ y ]
			row.each_with_index{ |value, x| result_row[ x ] = yield value, y, x }
		}
	end

  def apply(result_matrix : SimpleMatrix(T), &block : T, Int32, Int32 -> T) : Void
    apply_function result_matrix.buffer
  end

  def apply(result_buffer : Array(Array(T)), &block : T, Int32, Int32 -> T) : Void
    apply_function result_buffer
  end
end
