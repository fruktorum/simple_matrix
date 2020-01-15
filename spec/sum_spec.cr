require "./spec_helper"

describe SimpleMatrix do
	context "#sum" do
		it "makes summation between 2x3 matrix" do
			a = matrix2x3_1
			b = matrix2x3_2
			result = SimpleMatrix( UInt8 ).new 2, 3, 0

			a.sum b, result

			result.buffer.should eq([
				[ 3, 1, 4 ],
				[ 5, 6, 6 ]
			])
		end

		context "with arrays" do
			it "multiplicates 2x3 matrix" do
				a = matrix2x3_1
				b_buffer = matrix2x3_2.buffer
				result_buffer = SimpleMatrix( UInt8 ).new( 2, 3, 0 ).buffer

				a.sum b_buffer, result_buffer

				result_buffer.should eq([
					[ 3, 1, 4 ],
					[ 5, 6, 6 ]
				])
			end
		end
	end
end
