require 'spec_helper'

describe 'BacktrackingMazeFactory' do
  let(:maze_builder) { Maze::Builder::BacktrackingMazeFactory.new }  
  let(:simple_maze_builder) { Maze::Builder::SimpleMazeFactory.new }  
  
  context "A simple maze" do
    it 'should correctly create a maze grid' do
      maze = maze_builder.build_maze 1, 1
      expect(maze.grid).to eq([[0]])
    end
    
    it 'should correctly create maze grid sizes' do
      maze = maze_builder.build_maze 5, 4
      expect(maze.grid.length).to eq(4)
      expect(maze.grid[0].length).to eq(5)
    end
    
    it 'should not have any blocked cells' do
      maze = maze_builder.build_maze 3, 3
      expect(maze.grid.flatten.length).to eq(maze.grid.flatten.reject{|a| a == 0}.length)
    end
    
  end
end