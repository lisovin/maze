# Maze Builder and Solver

Build and solve maze

[![Build Status](https://travis-ci.org/fokcep/maze.svg)](https://travis-ci.org/fokcep/maze) [![Coverage Status](https://img.shields.io/coveralls/fokcep/maze.svg)](https://coveralls.io/r/fokcep/maze?branch=master) [![Code Climate](https://codeclimate.com/repos/56196250e30ba03c71006026/badges/89f3b3d774dc1b286e68/gpa.svg)](https://codeclimate.com/repos/56196250e30ba03c71006026/feed)

## Instructions 

```ruby
	m = Maze.new 5, 5
	m.print
	m.solve
```
#Implementation

Used backtracking algorithm to build and depth first search to find path

#Assumptions 

Entry point 'A' and exit point 'B' are always top left and bottom right.
