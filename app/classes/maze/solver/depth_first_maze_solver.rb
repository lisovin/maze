class Maze::Solver::DepthFirstMazeSolver < Maze::Solver::AbstractMazeSolver
  
  N, S, E, W = 1, 2, 4, 8
  DX  = { E => 1, W => -1, N =>  0, S => 0 } 
  DY  = { E => 0, W =>  0, N => -1, S => 1 }
  
  def solve(maze)
    @grid = maze.grid
    @width  = @grid[0].length
    @height = @grid.length
    @entry = [0,0]
    @exit = [@height - 1, @width - 1]
    visited = Array.new(@height) { Array.new(@width, 0) }
    path = []
    visit_cell(@entry[1], @entry[0], @grid, visited, path)
    path
  end
  
  def directions(x, y)
    @grid[y][x].to_s(2).scan(/./).reverse.map.with_index{|a,i| a.to_i*2**i}.reject{|a| a==0}
  end

  def visit_cell(sx, sy, grid, visited, path)
    if visited[@exit[0]][@exit[1]] != 0
      return
    end
    path << [sx, sy]
    directions(sx, sy).each do |direction|
      if (@grid[sy][sx] & direction == direction) && 
        sy.between?(0, grid.length-1) && sx.between?(0, grid[sy].length-1)
        visited[sy][sx] |= direction
        nx = sx + DX[direction]
        ny = sy + DY[direction]
        visit_cell(nx, ny, grid, visited, path) if visited[ny][nx] == 0
      end
    end
    if visited[@exit[0]][@exit[1]] == 0
      path.pop
    end
  end
  
end