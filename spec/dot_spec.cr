require "./spec_helper"

describe SimpleMatrix do
	context "#dot" do
		it "multiplicates 2x3 with 3x4" do
			a = matrix2x3_1
			b = SimpleMatrix( UInt8 ).new 3, 4
			result = SimpleMatrix( UInt8 ).new 2, 4, 0

			b.buffer[ 0 ][ 0 ] = 2
			b.buffer[ 0 ][ 1 ] = 1
			b.buffer[ 0 ][ 2 ] = 2
			b.buffer[ 0 ][ 3 ] = 0
			b.buffer[ 1 ][ 0 ] = 0
			b.buffer[ 1 ][ 1 ] = 2
			b.buffer[ 1 ][ 2 ] = 1
			b.buffer[ 1 ][ 3 ] = 3
			b.buffer[ 2 ][ 0 ] = 1
			b.buffer[ 2 ][ 1 ] = 2
			b.buffer[ 2 ][ 2 ] = 1
			b.buffer[ 2 ][ 3 ] = 1

			a.dot b, result

			result.buffer.should eq([
				[  4,  5,  4,  2 ],
				[ 13, 19, 17, 15 ]
			])
		end

		it "multiplicates 3x4 with 4x2" do
			a = SimpleMatrix( Int8 ).new 3, 4
			b = SimpleMatrix( Int8 ).new 4, 2
			result = SimpleMatrix( Int8 ).new 3, 2, 0

			a.buffer[ 0 ][ 0 ] = 2
			a.buffer[ 0 ][ 1 ] = 1
			a.buffer[ 0 ][ 2 ] = 2
			a.buffer[ 0 ][ 3 ] = 0
			a.buffer[ 1 ][ 0 ] = 0
			a.buffer[ 1 ][ 1 ] = 2
			a.buffer[ 1 ][ 2 ] = 1
			a.buffer[ 1 ][ 3 ] = 3
			a.buffer[ 2 ][ 0 ] = 1
			a.buffer[ 2 ][ 1 ] = 2
			a.buffer[ 2 ][ 2 ] = 1
			a.buffer[ 2 ][ 3 ] = 1

			b.buffer[ 0 ][ 0 ] = 1
			b.buffer[ 0 ][ 1 ] = 3
			b.buffer[ 1 ][ 0 ] = 2
			b.buffer[ 1 ][ 1 ] = 1
			b.buffer[ 2 ][ 0 ] = 1
			b.buffer[ 2 ][ 1 ] = 1
			b.buffer[ 3 ][ 0 ] = 0
			b.buffer[ 3 ][ 1 ] = 2

			a.dot b, result

			result.buffer.should eq([
				[ 6, 9 ],
				[ 5, 9 ],
				[ 6, 8 ]
			])
		end

		context "with arrays" do
		it "multiplicates 2x3 with 3x4" do
			a = matrix2x3_1
			b_buffer = SimpleMatrix( UInt8 ).new( 3, 4 ).buffer
			result_buffer = SimpleMatrix( UInt8 ).new( 2, 4, 0 ).buffer

			b_buffer[ 0 ][ 0 ] = 2
			b_buffer[ 0 ][ 1 ] = 1
			b_buffer[ 0 ][ 2 ] = 2
			b_buffer[ 0 ][ 3 ] = 0
			b_buffer[ 1 ][ 0 ] = 0
			b_buffer[ 1 ][ 1 ] = 2
			b_buffer[ 1 ][ 2 ] = 1
			b_buffer[ 1 ][ 3 ] = 3
			b_buffer[ 2 ][ 0 ] = 1
			b_buffer[ 2 ][ 1 ] = 2
			b_buffer[ 2 ][ 2 ] = 1
			b_buffer[ 2 ][ 3 ] = 1

			a.dot b_buffer, result_buffer

			result_buffer.should eq([
				[  4,  5,  4,  2 ],
				[ 13, 19, 17, 15 ]
			])
		end
		end
	end
end
