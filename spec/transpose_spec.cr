require "./spec_helper"

describe SimpleMatrix do
	context "#transpose" do
		it "transposes to matrix" do
			a = matrix2x3_1
			result = SimpleMatrix( UInt8 ).new 3, 2, 0

			a.transpose result

			result.buffer.should eq([
				[ 1, 5 ],
				[ 0, 4 ],
				[ 2, 3 ]
			])
		end
		it "transposes to buffer" do
			a = matrix2x3_1
			result_buffer = SimpleMatrix( UInt8 ).new( 3, 2, 0 ).buffer

			a.transpose result_buffer

			result_buffer.should eq([
				[ 1, 5 ],
				[ 0, 4 ],
				[ 2, 3 ]
			])
		end
	end
end
