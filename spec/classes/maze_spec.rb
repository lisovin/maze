require 'spec_helper'

describe 'DepthFirstMazeFactory' do
  let(:random_maze) { (Maze::Builder::BacktrackingMazeFactory.new).build_maze(6, 3) }  
  
  it 'all cells in the maze should be connected i.e. no walls between them' do
    grid = random_maze.grid
    visited = Array.new(grid.length) { Array.new(grid[0].length, 0) }
    for i in 0..grid.length - 1 do
      for j in 0..grid[i].length - 1 do
        directions = grid[i][j].to_s(2).scan(/./).reverse.map.with_index{|a,k| a.to_i*2**k}.reject{|a| a==0}
        directions.each do |d|
          nx, ny = j + Maze::Builder::BacktrackingMazeFactory::DX[d], i + Maze::Builder::BacktrackingMazeFactory::DY[d]
          if ny.between?(0, grid.length-1) && nx.between?(0, grid[ny].length-1)
            if (grid[i][j] & d) && (grid[ny][nx] & Maze::Builder::BacktrackingMazeFactory::OPPOSITE[d])
              visited[i][j] = true
            end
          end
        end
      end
    end
    expect(visited).to eq Array.new(grid.length) { Array.new(grid[0].length, true) }
  end
  
end


