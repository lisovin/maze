class Maze
  N, S, E, W = 1, 2, 4, 8 # freedom bits around cell
  DX  = { E => 1, W => -1, N =>  0, S => 0 } # shift by x axis
  DY  = { E => 0, W =>  0, N => -1, S => 1 } # shift by y axis
  OPPOSITE  = { E => W, W =>  E, N =>  S, S => N } 

  def initialize(width, height)
    @width  = width
    @height = height
    @entry = [0,0]
    @exit = [height - 1, width - 1]
    @grid = Array.new(height) { Array.new(width, 0) }
    step_from(0, 0, @grid)
  end
  
  def print
    puts @width.times.inject("+") {|str, x| str << "---+"}
    @height.times do |y|
      line = @width.times.inject("|") do |str, x|
        str << (y == @entry[0] && x == @entry[1] ? " A " : (y == @exit[0] && x == @exit[1] ? " B " : "   "))  << (@grid[y][x] & E == 0 ? "|" : " ")
      end
      puts line
      puts @width.times.inject("+") {|str, x| str << (@grid[y][x] & S == 0 ? "---+" : "   +")}
    end
  end
  
  private
  
  def step_from(cx, cy, grid)
    directions = [N, S, E, W].shuffle
    directions.each do |direction|
      nx, ny = cx + DX[direction], cy + DY[direction]
      if ny.between?(0, grid.length-1) && nx.between?(0, grid[ny].length-1) && grid[ny][nx] == 0
        grid[cy][cx] |= direction
        grid[ny][nx] |= OPPOSITE[direction]
        step_from(nx, ny, grid)
      end
    end
  end
end