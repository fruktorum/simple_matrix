# Simple Matrix

Simple Matrix is a lightweight matrix operations shard.

* It provides matrix calculations:
   * Sum
   * Dot Product
   * Element-wise Multiplication
   * Apply functions
   * Convolution
   * Transpose
* It uses methods `sum`, `dot`, etc. with three (instead of two) arguments: source, target matrices and a result matrix like a buffer
* With previous, `SimpleMatrix` is mostly looks like part of a functional language in `Crystal` syntax
* The engine does not have any matrix dimensions checking - this is on the developer's conscience
* It does not have internal mallocs because of the specific logic:
   1. Take one matrix
   2. Make an operation with this and other matrix
   3. Put result into third matrix

The module is specifically designed to have increased performance reserves. It can be used when designing the interaction of layers within neural network engines.

Please read the notes on operations below.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     simple_matrix:
       github: fruktorum/simple_matrix
   ```

2. Run `shards install`

## Usage

```crystal
require "simple_matrix"
```

For all calculations described below please pay attention for the:

* Matrices types must match
* Almost all operations can be produced with 2D arrays instead of matrices:

   ```crystal
   matrix1.dot matrix2, result_matrix

   # same as
   matrix1.dot matrix2.buffer, result_matrix.buffer

   # same as
   dot_array = Array.new( matrix1.width ){ Array.new( 5 ){ rand } }
   result_array = Array.new( matrix1.height ){ Array.new( dot_array.first.size ){ 0 } }
   matrix1.dot dot_array, result_array
   ```

* With buffers operations (arrays instead of matrices) they types must match

### Initialization

```crystal
# height = 4, width = 3 (filled by 0)
matrix = SimpleMatrix( UInt32 ).new 4, 3

# type = UInt8, height = 4, width = 3, values = 99
matrix = SimpleMatrix( UInt8 ).new 4, 3, 99

# Custom values:
# 0  1  2
# 3  4  5
# 6  7  8
# 9 10 11
width, height = 3, 4
matrix = SimpleMatrix( UInt16 ).new( height, width ){ |y, x| ( y * width + x ).to_u16 }

# Matrix has public method to access internal buffer:
matrix.buffer # => Array( Array( UInt16 ) )
```

To initialize identity (in example: 5x5) matrix (zero-filled matrix which main diagonal filled by 1):

```crystal
matrix = SimpleMatrix( UInt8 ).identity 5
```

```
┌ 1 0 0 0 0 ┐
│ 0 1 0 0 0 │
│ 0 0 1 0 0 │
│ 0 0 0 1 0 │
└ 0 0 0 0 1 ┘
```

### Output

```
puts matrix # prints to stdout in pretty form
```

### Operations

For the below assume that matrices are declared as `m1`, `m2`, etc. Result matrix is declared as `r`.

#### Multiplication. ![r = m1 · m2](https://latex.codecogs.com/gif.latex?r%20%3D%20m_%7B1%7D%20%5Ccdot%20m_%7B2%7D "r = m1 · m2")

```crystal
m1.dot m2, r
m1.dot m2.buffer, r.buffer
```

Notes:

* **Width** of the **first** matrix must match the **height** of the **second** matrix. Without internal checks which are mentioned before, program will fail with `Index out of bounds (IndexError)`.
* **Width** of the **result** (`r`) matrix must match the **width** of the **second** matrix.
* **Height** of the **result** (`r`) matrix must match the **height** of the **first** matrix.

#### Elementwise multiplication. ![r = m1 * m2](https://latex.codecogs.com/gif.latex?r%20%3D%20m_%7B1%7D%20%5Cast%20m_%7B2%7D "r = m1 * m2")

```crystal
m1.mul m2, r
m1.mul m2.buffer, r.buffer
```

Notes:

* Dimenstions of the matrices must match
* If dimensions of `m1` matrix are less than `m2` matrix, only these dimensions will be used
* If dimensions of `r` matrix are greater than `m1` matrix, the "tail" will not be used
* Otherwise program will fail with `Index out of bounds (IndexError)`

#### Summation. ![r = m1 + m2](https://latex.codecogs.com/gif.latex?r%20%3D%20m_%7B1%7D%20&plus;%20m_%7B2%7D "r = m1 + m2")

```crystal
m1.sum m2, r
m1.sum m2.buffer, r.buffer
```

Notes:

* Dimenstions of the matrices must match
* If dimensions of `m1` matrix are less than `m2` matrix, only these dimensions will be used
* If dimensions of `r` matrix are greater than `m1` matrix, the "tail" will not be used
* Otherwise program will fail with `Index out of bounds (IndexError)`

#### Transpose. ![r = m1 ^T](https://latex.codecogs.com/gif.latex?r%20%3D%20m%5ET "r = m1 ^T")

```crystal
m.transpose r
m.transpose r.buffer
```

Notes:

* Width of the `m` (source) matrix must match the height of the `r` (result) matrix
* Height of the `m` (source) matrix must match the height of the `r` (result) matrix

#### Convolution. ![r = m _convolved through_ k](https://latex.codecogs.com/gif.latex?r%20%3D%20m%20%5Ccircledast%20k "r = m _convolved through_ k") (window, or _kernel_)

```crystal
m.convolve k, r, padding
m.convolve k.buffer, r.buffer, padding
```

Notes:

* Kernel dimensions must be less than or equal to matrix dimensions
* Padding must be greater than or equal to zero
* Dimensions of a result matrix `r` should be calculated taking into account matrix `m` dimensions and kernel `k` dimensions. Convolution example can be found in [convolution specs](spec/convolve_spec.cr).

#### Apply function elementwise. ![r = f(m)](https://latex.codecogs.com/gif.latex?r%20%3D%20f%28m%29 "r = f(m)")

This is similar to applying the activation function to each neurons.

```crystal
m.apply r do |m_matrix_value, m_y, m_x|
  # do something...
end

m.apply r.buffer do |m_matrix_value, m_y, m_x|
  # do something...
end
```

Notes:

* Result must have the same type as matrices
* Matrices width and height must match

## Development

Please feel free to make an PR!

Please be sure that engine is still have the desired performance stats: no mallocs + best benchmark ips.

## Contributing

1. Fork it (<https://github.com/fruktorum/simple_matrix/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [SlayerShadow](https://github.com/SlayerShadow) - creator and maintainer
