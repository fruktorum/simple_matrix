require "./spec_helper"

describe SimpleMatrix do
	context "#==" do
		context "when succeeds" do
			context "with matrices" do
				it "compares identities" do
					a = SimpleMatrix( UInt8 ).identity 5
					b = SimpleMatrix( UInt8 ).identity 5

					a.should eq( b )
					( a == b ).should eq( true )
				end

				it "compares zero matrices" do
					a = SimpleMatrix( UInt8 ).new 3, 4
					b = SimpleMatrix( UInt8 ).new 3, 4

					a.should eq( b )
					( a == b ).should eq( true )
				end

				it "compares same matrices" do
					json = "[[1,0,2],[5,4,3]]"

					a = SimpleMatrix( UInt8 ).from_json json
					b = SimpleMatrix( UInt8 ).from_json json

					a.should eq( b )
					( a == b ).should eq( true )
				end
			end

			context "with buffers" do
				it "compares identities" do
					a = SimpleMatrix( UInt8 ).identity 5
					b = SimpleMatrix( UInt8 ).identity( 5 ).buffer

					a.should eq( b )
					( a == b ).should eq( true )
				end

				it "compares zero matrices" do
					a = SimpleMatrix( UInt8 ).new 3, 4
					b = SimpleMatrix( UInt8 ).new( 3, 4 ).buffer

					a.should eq( b )
					( a == b ).should eq( true )
				end

				it "compares same matrices" do
					json = "[[1,0,2],[5,4,3]]"

					a = SimpleMatrix( UInt8 ).from_json json
					b = SimpleMatrix( UInt8 ).from_json( json ).buffer

					a.should eq( b )
					( a == b ).should eq( true )
				end
			end
		end

		context "when does not succeed" do
			context "with matrices" do
				it "compares identities" do
					a = SimpleMatrix( UInt8 ).identity 5
					b = SimpleMatrix( UInt8 ).identity 4

					a.should_not eq( b )
					( a == b ).should eq( false )
				end

				it "compares zero matrices" do
					a = SimpleMatrix( UInt8 ).new 3, 4
					b = SimpleMatrix( UInt8 ).new 4, 3

					a.should_not eq( b )
					( a == b ).should eq( false )
				end

				it "compares same matrices" do
					a = SimpleMatrix( UInt8 ).from_json "[[1,0,2],[5,4,3]]"
					b = SimpleMatrix( UInt8 ).from_json "[[1,0,2],[5,3,3]]"

					a.should_not eq( b )
					( a == b ).should eq( false )
				end
			end

			context "with buffers" do
				it "compares identities" do
					a = SimpleMatrix( UInt8 ).identity 5
					b = SimpleMatrix( UInt8 ).identity( 4 ).buffer

					a.should_not eq( b )
					( a == b ).should eq( false )
				end

				it "compares zero matrices" do
					a = SimpleMatrix( UInt8 ).new 3, 4
					b = SimpleMatrix( UInt8 ).new( 4, 3 ).buffer

					a.should_not eq( b )
					( a == b ).should eq( false )
				end

				it "compares same matrices" do
					a = SimpleMatrix( UInt8 ).from_json "[[1,0,2],[5,4,3]]"
					b = SimpleMatrix( UInt8 ).from_json( "[[1,0,2],[5,3,3]]" ).buffer

					a.should_not eq( b )
					( a == b ).should eq( false )
				end
			end

			context "without index expression" do
				matrix = SimpleMatrix( UInt8 ).new 4, 3, 1

				buffer = [
					[ 1_u8, 1_u8, 1_u8 ],
					[ 1_u8, 1_u8, 1_u8, 1_u8 ],
					[ 1_u8, 1_u8 ],
					[ 1_u8, 1_u8, 1_u8 ]
				]

				( matrix == buffer ).should eq( false )
				matrix.should_not eq( buffer )
			end
		end
	end
end
