class SimpleMatrix(T)
  getter buffer, width, height

  @width : UInt32
  @height : UInt32

  @buffer : Array(Array(T))

  def self.identity(diagonal_length : Int) : SimpleMatrix(T)
    new(diagonal_length, diagonal_length) { |y, x| T.new y == x ? 1 : 0 }
  end

  def initialize(pull : JSON::PullParser)
    @buffer = Array(Array(T)).new pull
    @height = @buffer.size.to_u32
    @width = @buffer.first.size.to_u32
  end

  def initialize(height : Int, width : Int, value : T = T.new(0))
    @height = height.to_u32
    @width = width.to_u32
    @buffer = Array(Array(T)).new(@height) { Array(T).new(@width) { value } }
  end

  def initialize(height : Int, width : Int, &block : Int32, Int32 -> T)
    @height = height.to_u32
    @width = width.to_u32
    @buffer = Array(Array(T)).new(@height) { |y| Array(T).new(@width) { |x| yield y, x } }
  end

  def initialize(@buffer)
    @height = buffer.size.to_u32
    @width = buffer.first.size.to_u32
  end

  def size : UInt32
    @width * @height
  end

  def to_s(io : IO) : Void
    if @height == 1
      io << "[ "
      @buffer[0].each_with_index { |value, x|
        io << value
        io << ' ' if x != @width - 1
      }
      io << " ]"
    else
      max_size = @buffer.max_of &.max_of(&.inspect.size)
      io << "┌ "

      @height.times do |y|
        io << "│ " if y > 0 && y < @height - 1
        io << "└ " if y == @height - 1

        @buffer[y].each_with_index do |value, x|
          inspected = value.inspect
          (max_size - inspected.size).times { io << ' ' }
          io << inspected

          if x != @width - 1
            io << ' '
          elsif y > 0 && y < @height - 1
            io << " │"
          end
        end

        io << " ┐" if y == 0
        io << (y == @height - 1 ? " ┘" : '\n')
      end
    end
  end

  def to_json(json : JSON::Builder) : Void
    @buffer.to_json json
  end
end
