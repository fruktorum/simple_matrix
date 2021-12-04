require "spec"
require "../src/simple_matrix"

def kernel3x3 : SimpleMatrix
  window = SimpleMatrix(Int8).new 3, 3

  window.buffer[0][0] = -1
  window.buffer[0][1] = 1
  window.buffer[0][2] = -1

  window.buffer[1][0] = -1
  window.buffer[1][1] = 1
  window.buffer[1][2] = 0

  window.buffer[2][0] = 1
  window.buffer[2][1] = -1
  window.buffer[2][2] = -1

  window
end

def matrix2x3_1 : SimpleMatrix
  data = SimpleMatrix(UInt8).new 2, 3

  data.buffer[0][0] = 1
  data.buffer[0][1] = 0
  data.buffer[0][2] = 2

  data.buffer[1][0] = 5
  data.buffer[1][1] = 4
  data.buffer[1][2] = 3

  data
end

def matrix2x3_2 : SimpleMatrix
  data = SimpleMatrix(UInt8).new 2, 3

  data.buffer[0][0] = 2
  data.buffer[0][1] = 1
  data.buffer[0][2] = 2

  data.buffer[1][0] = 0
  data.buffer[1][1] = 2
  data.buffer[1][2] = 3

  data
end

def matrix3x3 : SimpleMatrix
  data = SimpleMatrix(UInt8).new 3, 3

  data.buffer[0][0] = 1
  data.buffer[0][1] = 3
  data.buffer[0][2] = 2

  data.buffer[1][0] = 5
  data.buffer[1][1] = 1
  data.buffer[1][2] = 4

  data.buffer[2][0] = 7
  data.buffer[2][1] = 2
  data.buffer[2][2] = 9

  data
end

def matrix4x4 : SimpleMatrix
  data = SimpleMatrix(Int8).new 4, 4

  data.buffer[0][0] = 0
  data.buffer[0][1] = 1
  data.buffer[0][2] = 2
  data.buffer[0][3] = 1

  data.buffer[1][0] = 1
  data.buffer[1][1] = 0
  data.buffer[1][2] = 1
  data.buffer[1][3] = 1

  data.buffer[2][0] = 2
  data.buffer[2][1] = 1
  data.buffer[2][2] = 1
  data.buffer[2][3] = 0

  data.buffer[3][0] = 1
  data.buffer[3][1] = 2
  data.buffer[3][2] = 2
  data.buffer[3][3] = 1

  data
end

def matrix5x5 : SimpleMatrix
  data = SimpleMatrix(Int8).new 5, 5

  data.buffer[0][0] = 0
  data.buffer[0][1] = 0
  data.buffer[0][2] = 1
  data.buffer[0][3] = 1
  data.buffer[0][4] = 1

  data.buffer[1][0] = 1
  data.buffer[1][1] = 1
  data.buffer[1][2] = 1
  data.buffer[1][3] = 2
  data.buffer[1][4] = 2

  data.buffer[2][0] = 1
  data.buffer[2][1] = 1
  data.buffer[2][2] = 1
  data.buffer[2][3] = 0
  data.buffer[2][4] = 0

  data.buffer[3][0] = 1
  data.buffer[3][1] = 2
  data.buffer[3][2] = 0
  data.buffer[3][3] = 2
  data.buffer[3][4] = 2

  data.buffer[4][0] = 0
  data.buffer[4][1] = 2
  data.buffer[4][2] = 1
  data.buffer[4][3] = 1
  data.buffer[4][4] = 0

  data
end
