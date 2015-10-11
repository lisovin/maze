class Maze::GridMaze
  
  attr_reader :width, :height, :begin_x, :begin_y, :end_x, :end_y
  
  def initialize(grid, begin_xy, end_xy)
    @grid = grid
    @width  = grid[0].size # width
    @height = grid.size # height
    @begin_x = begin_xy[0]
    @begin_y = begin_xy[1]
    @end_x = end_xy[0]
    @end_y = end_xy[1]
    @visited = Array.new(@height) { Array.new(@width, false) }
  end
  
  def directions(x, y)
    @grid[y][x].to_s(2).scan(/./).reverse.map.with_index{|a,i| a.to_i*2**i}.reject{|a| a==0}
  end
  
  def neighbours(x, y)
    neighbours = []
    neighbours << @grid[y][x-1] if x > 0
    neighbours << @grid[y][x+1] if x < @width-1
    neighbours << @grid[y-1][x] if y > 0
    neighbours << @grid[y+1][x] if y < @height-1
  end
  
  def mark_as_visited(x, y)
    @visited[y][x] = true
  end
  
  def is_visited?(x, y)
    @visited[y][x]
  end
  
  def solved?
    @visited[end_y][end_x]
  end
  
  # method to delete or move to another helper class
  def print
    puts @width.times.inject("+") {|str, x| str << "---+"}
    @height.times do |y|
      line = @width.times.inject("|") do |str, x|
        str << (y == @begin_x && x == @begin_y ? " A " : (y == @end_x && x == @end_y ? " B " : "   "))  << (@grid[y][x] & Maze::Builder::BacktrackingMazeFactory::E == 0 ? "|" : " ")
      end
      puts line
      puts @width.times.inject("+") {|str, x| str << (@grid[y][x] & Maze::Builder::BacktrackingMazeFactory::S == 0 ? "---+" : "   +")}
    end
  end
  
end