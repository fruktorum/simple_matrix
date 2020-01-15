require "./spec_helper"

describe SimpleMatrix do
	context "#convolve" do
		context "with padding" do
			it "calculates convolution" do
				data_size = 4
				window_size = 3

				padding = { x: 1_u8, y: 1_u8 }

				output_width = data_size - window_size + padding[ :x ] * 2 + 1
				output_height = data_size - window_size + padding[ :y ] * 2 + 1

				output_width.should eq( 4 )
				output_height.should eq( 4 )

				data = matrix4x4
				window = kernel3x3
				result = SimpleMatrix( Int8 ).new output_width, output_height, 0

				data.convolve window, result, padding

				result.buffer.should eq([
					[ -1,  1, -1, -1 ],
					[ -3, -2,  1,  0 ],
					[  0, -6, -1,  0 ],
					[  2, -1,  0, -2 ]
				])
			end
		end

		context "without padding" do
			it "calculates convolution" do
				data_size = 5
				window_size = 3

				output_width = data_size - window_size + 1
				output_height = data_size - window_size + 1

				output_width.should eq( 3 )
				output_height.should eq( 3 )

				data = matrix5x5
				window = kernel3x3
				result = SimpleMatrix( Int8 ).new output_width, output_height, 0

				data.convolve window, result

				result.buffer.should eq([
					[ -2,  0,  1 ],
					[ -2, -2, -6 ],
					[ -3, -2,  1 ]
				])
			end
		end

		context "with arrays" do
			it "calculates convolution" do
				data_size = 4
				window_size = 3

				padding = { x: 1_u8, y: 1_u8 }

				output_width = data_size - window_size + padding[ :x ] * 2 + 1
				output_height = data_size - window_size + padding[ :y ] * 2 + 1

				output_width.should eq( 4 )
				output_height.should eq( 4 )

				data = matrix4x4
				window_buffer = kernel3x3.buffer
				result_buffer = SimpleMatrix( Int8 ).new( output_width, output_height, 0 ).buffer

				data.convolve window_buffer, result_buffer, padding

				result_buffer.should eq([
					[ -1,  1, -1, -1 ],
					[ -3, -2,  1,  0 ],
					[  0, -6, -1,  0 ],
					[  2, -1,  0, -2 ]
				])
			end
		end
	end
end
