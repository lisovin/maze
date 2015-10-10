class Maze::GridMaze
  
  N, S, E, W = 1, 2, 4, 8 # freedom bits around cell
  DX  = { E => 1, W => -1, N =>  0, S => 0 } # shift by x axis
  DY  = { E => 0, W =>  0, N => -1, S => 1 } # shift by y axis
  OPPOSITE  = { E => W, W =>  E, N =>  S, S => N }
  
  def initialize(grid, entry, exit)
    @grid = grid
    @width  = grid[0].size
    @height = grid.size
    @entry = entry
    @exit = exit
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
  
  def grid
    @grid
  end 
end