require "./spec_helper"

describe SimpleMatrix do
	context ".identity" do
		it "creates identity matrix 5x5" do
			SimpleMatrix( UInt8 ).identity( 5 ).buffer.should eq([
				[ 1, 0, 0, 0, 0 ],
				[ 0, 1, 0, 0, 0 ],
				[ 0, 0, 1, 0, 0 ],
				[ 0, 0, 0, 1, 0 ],
				[ 0, 0, 0, 0, 1 ]
			])
		end
	end
end
