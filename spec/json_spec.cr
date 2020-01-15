require "json"

describe SimpleMatrix do
	context "#to_json" do
		it "generates json string" do
			matrix2x3_1.to_json.should eq( "[[1,0,2],[5,4,3]]" )
		end
	end

	context "#from_json" do
		it "restores UInt8 matrix" do
			SimpleMatrix( UInt8 ).from_json( "[[1,0,2],[5,4,3]]" ).buffer.should eq( matrix2x3_1.buffer )
		end

		it "restores Int32 matrix" do
			SimpleMatrix( Int32 ).from_json( "[[1,0,2],[5,4,3]]" ).buffer.should eq( matrix2x3_1.buffer )
		end

		it "restores width" do
			SimpleMatrix( UInt8 ).from_json( "[[1,0,2],[5,4,3]]" ).width.should eq( 3 )
		end

		it "restores height" do
			SimpleMatrix( UInt8 ).from_json( "[[1,0,2],[5,4,3]]" ).height.should eq( 2 )
		end
	end
end
