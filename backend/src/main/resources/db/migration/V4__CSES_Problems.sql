-- CSES-style and Classic Competitive Programming Problems
-- These are inspired by open-source problem sets

-- Problem 7: Weird Algorithm (CSES Introductory)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Weird Algorithm (Collatz Conjecture)',
    'weird-algorithm',
    'EASY',
    '## Problem Statement

Consider an algorithm that takes as input a positive integer n. If n is even, the algorithm divides it by two, and if n is odd, the algorithm multiplies it by three and adds one. The algorithm repeats this, until n is one.

Your task is to simulate the execution of the algorithm for a given value of n.

## Example

For n = 3:
- 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1

The sequence is: 3 10 5 16 8 4 2 1',
    '* 1 ≤ n ≤ 10^6',
    'The only input line contains an integer n.',
    'Print a line that contains all values of n during the algorithm.',
    10,
    NOW()
);

-- Problem 8: Missing Number (CSES Introductory)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Missing Number',
    'missing-number',
    'EASY',
    '## Problem Statement

You are given all numbers between 1, 2, ..., n except one. Your task is to find the missing number.

## Example

If n = 5 and the given numbers are 2, 3, 1, 5, then the missing number is 4.',
    '* 2 ≤ n ≤ 2×10^5',
    'The first input line contains an integer n.
The second line contains n−1 numbers. Each number is distinct and between 1 and n (inclusive).',
    'Print the missing number.',
    10,
    NOW()
);

-- Problem 9: Repetitions (CSES Introductory)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Repetitions',
    'repetitions',
    'EASY',
    '## Problem Statement

You are given a DNA sequence: a string consisting of characters A, C, G, and T. Your task is to find the longest repetition in the sequence. This is a maximum-length substring containing only one type of character.

## Example

For the sequence "ATTCGGGA":
- Longest repetition is "GGG" with length 3',
    '* 1 ≤ n ≤ 10^6 (length of string)',
    'The only input line contains a string of n characters.',
    'Print one integer: the length of the longest repetition.',
    10,
    NOW()
);

-- Problem 10: Increasing Array (CSES Introductory)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Increasing Array',
    'increasing-array',
    'EASY',
    '## Problem Statement

You are given an array of n integers. You want to modify the array so that it is increasing, i.e., every element is at least as large as the previous element.

On each move, you may increase the value of any element by one. What is the minimum number of moves required?

## Example

For array [3, 2, 5, 1, 7]:
- We need to increase 2 to 3 (1 move)
- We need to increase 1 to 5 (4 moves)
- Total: 5 moves',
    '* 1 ≤ n ≤ 2×10^5
* 1 ≤ each element ≤ 10^9',
    'The first input line contains an integer n: the size of the array.
The second line contains n integers: the contents of the array.',
    'Print the minimum number of moves.',
    10,
    NOW()
);

-- Problem 11: Permutations (CSES Introductory)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Beautiful Permutation',
    'beautiful-permutation',
    'MEDIUM',
    '## Problem Statement

A permutation of integers 1, 2, ..., n is called beautiful if there are no adjacent elements whose difference is 1.

Given n, construct a beautiful permutation if such a permutation exists.

## Example

For n = 5, one valid answer is: 4 2 5 3 1
(No two adjacent numbers differ by 1)

For n = 3, no beautiful permutation exists.',
    '* 1 ≤ n ≤ 10^6',
    'The only input line contains an integer n.',
    'Print a beautiful permutation of integers 1, 2, ..., n. If there are several solutions, you may print any of them. If there is no solution, print "NO SOLUTION".',
    25,
    NOW()
);

-- Problem 12: Number Spiral (CSES Introductory)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Number Spiral',
    'number-spiral',
    'MEDIUM',
    '## Problem Statement

A number spiral is an infinite grid whose upper-left square has number 1. The grid is filled in a spiral pattern:

```
1  2  9  10 25
4  3  8  11 24
5  6  7  12 23
16 15 14 13 22
17 18 19 20 21
```

Your task is to find out the number at row y and column x.

## Example

Row 2, Column 3 → Answer is 8',
    '* 1 ≤ y, x ≤ 10^9',
    'The first input line contains an integer t: the number of tests.
After this, there are t lines, each containing integers y and x.',
    'For each test, print the number at row y and column x.',
    25,
    NOW()
);

-- Problem 13: Dice Combinations (CSES Dynamic Programming)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Dice Combinations',
    'dice-combinations',
    'MEDIUM',
    '## Problem Statement

Your task is to count the number of ways to construct sum n by throwing a dice one or more times. Each throw produces an outcome between 1 and 6.

## Example

For n = 3, there are 4 ways:
- 1+1+1
- 1+2
- 2+1  
- 3',
    '* 1 ≤ n ≤ 10^6',
    'The only input line has an integer n.',
    'Print the number of ways modulo 10^9+7.',
    25,
    NOW()
);

-- Problem 14: Coin Combinations I (CSES Dynamic Programming)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Coin Combinations',
    'coin-combinations',
    'MEDIUM',
    '## Problem Statement

Consider a money system consisting of n coins. Each coin has a positive integer value. Your task is to calculate the number of distinct ways you can produce a money sum x using the available coins.

## Example

If coins are [2, 3, 5] and target sum is 9:
- 2+2+2+3 = 9
- 2+2+5 = 9
- 3+3+3 = 9
- 2+3+2+2 = 9 (same coins, different order counts separately)
- etc.',
    '* 1 ≤ n ≤ 100
* 1 ≤ x ≤ 10^6
* 1 ≤ coin value ≤ 10^6',
    'The first input line has two integers n and x: the number of coins and the desired sum.
The second line has n distinct integers: the value of each coin.',
    'Print one integer: the number of ways modulo 10^9+7.',
    25,
    NOW()
);

-- Problem 15: Grid Paths (CSES Dynamic Programming)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Grid Paths',
    'grid-paths',
    'MEDIUM',
    '## Problem Statement

Consider an n×n grid whose squares may have traps. It is not allowed to move to a square with a trap.

Your task is to calculate the number of paths from the upper-left square to the lower-right square. You can only move right or down.

## Example

For a 3x3 grid:
```
...
.*.
...
```
(where * is a trap)

There are 2 valid paths.',
    '* 1 ≤ n ≤ 1000',
    'The first input line has an integer n: the size of the grid.
After this, there are n lines that describe the grid. Each line has n characters: . (floor) or * (trap).',
    'Print the number of paths modulo 10^9+7.',
    25,
    NOW()
);

-- Problem 16: Edit Distance (CSES Dynamic Programming)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Edit Distance',
    'edit-distance',
    'HARD',
    '## Problem Statement

The edit distance between two strings is the minimum number of operations required to transform one string into the other.

The allowed operations are:
- Add one character to the string
- Remove one character from the string
- Replace one character in the string

## Example

The edit distance between "LOVE" and "MOVIE" is 2:
- LOVE → MOVE (replace L with M)
- MOVE → MOVIE (add I)',
    '* 1 ≤ length of each string ≤ 5000',
    'The first input line has a string of length n, and the second input line has a string of length m.',
    'Print one integer: the edit distance between the strings.',
    50,
    NOW()
);

-- Problem 17: Longest Increasing Subsequence (LIS)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Longest Increasing Subsequence',
    'longest-increasing-subsequence',
    'HARD',
    '## Problem Statement

You are given an array containing n integers. Your task is to determine the longest increasing subsequence in the array, i.e., the longest subsequence where every element is larger than the previous one.

## Example

For array [7, 3, 5, 3, 6, 2, 9, 8]:
The longest increasing subsequence is [3, 5, 6, 9] with length 4.',
    '* 1 ≤ n ≤ 2×10^5
* 1 ≤ each element ≤ 10^9',
    'The first input line contains an integer n: the array size.
The second input line contains n integers: the array elements.',
    'Print the length of the longest increasing subsequence.',
    50,
    NOW()
);

-- Problem 18: Shortest Routes I (Graph - Dijkstra)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (
    gen_random_uuid(),
    'Shortest Routes',
    'shortest-routes',
    'HARD',
    '## Problem Statement

There are n cities and m flight connections between them. Your task is to determine the length of the shortest route from city 1 to all other cities.

## Example

For 3 cities with flights:
- 1 → 2 (cost 5)
- 1 → 3 (cost 10)  
- 2 → 3 (cost 2)

Shortest distances: city 2 = 5, city 3 = 7 (via city 2)',
    '* 1 ≤ n ≤ 10^5
* 1 ≤ m ≤ 2×10^5
* 1 ≤ edge weight ≤ 10^9',
    'The first input line has two integers n and m: the number of cities and flights.
After that, there are m lines describing the flights. Each line has three integers a, b and c: there is a flight from city a to city b with length c.',
    'Print n integers: the shortest route lengths from city 1. Print -1 if no route exists.',
    50,
    NOW()
);
