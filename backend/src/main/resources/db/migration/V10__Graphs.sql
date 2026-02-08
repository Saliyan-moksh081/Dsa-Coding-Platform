-- Graph Problems (15 problems)

-- 69: Number of Islands
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Number of Islands', 'number-of-islands', 'MEDIUM',
'## Problem Statement
Given an m x n 2D binary grid grid which represents a map of ''1''s (land) and ''0''s (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

## Example
Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1',
'* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 300',
'First line: m n
Next m lines: grid rows',
'Print the number of islands', 25, NOW());

-- 70: Clone Graph
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Clone Graph', 'clone-graph', 'MEDIUM',
'## Problem Statement
Given a reference of a node in a connected undirected graph.

Return a deep copy (clone) of the graph.

Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

## Example
Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]',
'* The number of nodes in the graph is in the range [0, 100].
* 1 <= Node.val <= 100
* Node.val is unique for each node.',
'First line: Adjacency list representation',
'Print the adjacency list of the cloned graph', 25, NOW());

-- 71: Max Area of Island
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Max Area of Island', 'max-area-of-island', 'MEDIUM',
'## Problem Statement
You are given an m x n binary matrix grid. An island is a group of 1s (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

The area of an island is the number of cells with a value 1 in the island.

Return the maximum area of an island in grid. If there is no island, return 0.

## Example
Input: grid = [
 [0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]
]
Output: 6',
'* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 50',
'First line: m n
Next m lines: grid rows',
'Print the maximum area', 25, NOW());

-- 72: Pacific Atlantic Water Flow
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Pacific Atlantic Water Flow', 'pacific-atlantic-water-flow', 'MEDIUM',
'## Problem Statement
There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the left and top edges of the island, and the Atlantic Ocean touches the right and bottom edges of the island.

The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).

Rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell''s height is less than or equal to the current cell''s height. Water can flow from any cell adjacent to an ocean into the ocean.

Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.

## Example
Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]',
'* m == heights.length
* n == heights[r].length
* 1 <= m, n <= 200',
'First line: m n
Next m lines: heights rows',
'Print the coordinates', 25, NOW());

-- 73: Surrounded Regions
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Surrounded Regions', 'surrounded-regions', 'MEDIUM',
'## Problem Statement
Given an m x n matrix board containing ''X'' and ''O'', capture all regions that are 4-directionally surrounded by ''X''.

A region is captured by flipping all ''O''s into ''X''s in that surrounded region.

## Example
Input: board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
Output: [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]',
'* m == board.length
* n == board[i].length
* 1 <= m, n <= 200',
'First line: m n
Next m lines: board rows',
'Print the modified board', 25, NOW());

-- 74: Rotting Oranges
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Rotting Oranges', 'rotting-oranges', 'MEDIUM',
'## Problem Statement
You are given an m x n grid where each cell can have one of three values:
- 0 representing an empty cell,
- 1 representing a fresh orange, or
- 2 representing a rotten orange.

Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.

Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.

## Example
Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
Output: 4',
'* m == grid.length
* n == grid[i].length
* 1 <= m, n <= 10',
'First line: m n
Next m lines: grid rows',
'Print the minimum minutes', 25, NOW());

-- 75: Course Schedule
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Course Schedule', 'course-schedule', 'MEDIUM',
'## Problem Statement
There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

Return true if you can finish all courses. Otherwise, return false.

## Example
Input: numCourses = 2, prerequisites = [[1,0]]
Output: true

Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: false',
'* 1 <= numCourses <= 2000
* 0 <= prerequisites.length <= 5000',
'First line: numCourses
Second line: number of prerequisites
Next k lines: prerequisites pair',
'Print true or false', 25, NOW());

-- 76: Course Schedule II
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Course Schedule II', 'course-schedule-ii', 'MEDIUM',
'## Problem Statement
There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

## Example
Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
Output: [0,2,1,3]',
'* 1 <= numCourses <= 2000
* 0 <= prerequisites.length <= numCourses * (numCourses - 1)',
'First line: numCourses
Second line: number of prerequisites
Next k lines: prerequisites pair',
'Print the ordering', 25, NOW());

-- 77: Graph Valid Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Graph Valid Tree', 'graph-valid-tree', 'MEDIUM',
'## Problem Statement
You have a graph of n nodes labeled from 0 to n - 1. You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that there is an undirected edge between nodes ai and bi in the graph.

Return true if the edges of the given graph make up a valid tree, and false otherwise.

## Example
Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
Output: true',
'* 1 <= n <= 2000
* 0 <= edges.length <= 5000',
'First line: n
Second line: number of edges
Next k lines: edge pair',
'Print true or false', 25, NOW());

-- 78: Number of Connected Components
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Number of Connected Components', 'number-connected-components', 'MEDIUM',
'## Problem Statement
You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.

Return the number of connected components in the graph.

## Example
Input: n = 5, edges = [[0,1],[1,2],[3,4]]
Output: 2',
'* 1 <= n <= 2000
* 1 <= edges.length <= 5000',
'First line: n
Second line: number of edges
Next k lines: edge pair',
'Print number of connected components', 25, NOW());

-- 79: Alien Dictionary
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Alien Dictionary', 'alien-dictionary', 'HARD',
'## Problem Statement
There is a new alien language that uses the English alphabet. However, the order among the letters is unknown to you.

You are given a list of strings words from the alien language''s dictionary, where the strings in words are sorted lexicographically by the rules of this new language.

Return a string of the unique letters in the new alien language sorted in lexicographically increasing order by the new language''s rules. If there is no solution, return "". If there are multiple solutions, return any of them.

## Example
Input: words = ["wrt","wrf","er","ett","rftt"]
Output: "wertf"',
'* 1 <= words.length <= 100
* 1 <= words[i].length <= 100',
'First line: number of words
Next k lines: words',
'Print the sorted string', 50, NOW());

-- 80: Word Ladder
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Word Ladder', 'word-ladder', 'HARD',
'## Problem Statement
A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
- Every adjacent pair of words differs by a single letter.
- Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
- sk == endWord

Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.

## Example
Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5',
'* 1 <= beginWord.length <= 10
* endWord.length == beginWord.length
* 1 <= wordList.length <= 5000',
'First line: beginWord
Second line: endWord
Third line: number of words in list
Next k lines: dictionary words',
'Print the number of words in shortest sequence', 50, NOW());

-- 81: Network Delay Time
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Network Delay Time', 'network-delay-time', 'MEDIUM',
'## Problem Statement
You are given a network of n nodes, labeled from 1 to n. You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target.

We will send a signal from a given node k. Return the minimum time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.

## Example
Input: times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2
Output: 2',
'* 1 <= k <= n <= 100
* 1 <= times.length <= 6000',
'First line: n and k
Second line: number of edges
Next k lines: u v w',
'Print minimum time', 25, NOW());

-- 82: Cheapest Flights Within K Stops
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Cheapest Flights Within K Stops', 'cheapest-flights', 'MEDIUM',
'## Problem Statement
There are n cities connected by some number of flights. You are given an array flights where flights[i] = [from_i, to_i, price_i] indicates that there is a flight from city from_i to city to_i with cost price_i.

You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.

## Example
Input: n = 4, flights = [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], src = 0, dst = 3, k = 1
Output: 700',
'* 1 <= n <= 100
* 0 <= flights.length <= (n * (n - 1) / 2)',
'First line: n
Second line: number of flights
Next lines: flights
Last line: src dst k',
'Print cheapest price', 25, NOW());

-- 83: Reconstruct Itinerary
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Reconstruct Itinerary', 'reconstruct-itinerary', 'HARD',
'## Problem Statement
You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight. Reconstruct the itinerary in order and return it.

All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK". If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.

## Example
Input: tickets = [["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]
Output: ["JFK","MUC","LHR","SFO","SJC"]',
'* 1 <= tickets.length <= 300
* tickets[i].length == 2',
'First line: number of tickets
Next k lines: tickets',
'Print reconstructed itinerary', 50, NOW());
