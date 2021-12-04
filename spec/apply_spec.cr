require "./spec_helper"

describe SimpleMatrix do
  context "#apply" do
    context "without indices" do
      context "with block" do
        it "applies function" do
          size = 3
          data = matrix3x3
          result = SimpleMatrix(UInt8).new size, size, 0

          data.apply(result) { |value| value * 2 }

          result.buffer.should eq([
            [2, 6, 4],
            [10, 2, 8],
            [14, 4, 18],
          ])
        end
      end

      context "with proc" do
        it "applies function" do
          size = 3
          data = matrix3x3
          result = SimpleMatrix(UInt8).new size, size, 0

          function = ->(value : UInt8) { value * 2 }

          data.apply result, &function

          result.buffer.should eq([
            [2, 6, 4],
            [10, 2, 8],
            [14, 4, 18],
          ])
        end
      end
    end

    context "with indices" do
      context "with block" do
        it "applies function" do
          size = 3
          data = matrix3x3
          result = SimpleMatrix(UInt8).new size, size, 0

          data.apply(result) { |value, y, x| value * 2 - y - x }

          result.buffer.should eq([
            [2, 5, 2],
            [9, 0, 5],
            [12, 1, 14],
          ])
        end
      end

      context "with proc" do
        it "applies function" do
          size = 3
          data = matrix3x3
          result = SimpleMatrix(UInt8).new size, size, 0

          function = ->(value : UInt8, y : Int32, x : Int32) { value * 2 - y - x }

          data.apply result, &function

          result.buffer.should eq([
            [2, 5, 2],
            [9, 0, 5],
            [12, 1, 14],
          ])
        end
      end
    end
  end
end
