-- DP, Greedy, Backtracking (25 problems)

-- 84: Climbing Stairs
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Climbing Stairs', 'climbing-stairs', 'EASY',
'## Problem Statement
You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

## Example
Input: n = 2
Output: 2',
'* 1 <= n <= 45',
'First line: n',
'Print number of ways', 10, NOW());

-- 85: Min Cost Climbing Stairs
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Min Cost Climbing Stairs', 'min-cost-climbing-stairs', 'EASY',
'## Problem Statement
You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

## Example
Input: cost = [10,15,20]
Output: 15',
'* 2 <= cost.length <= 1000
* 0 <= cost[i] <= 999',
'First line: n
Second line: costs',
'Print minimum cost', 10, NOW());

-- 86: House Robber
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'House Robber', 'house-robber', 'MEDIUM',
'## Problem Statement
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

## Example
Input: nums = [1,2,3,1]
Output: 4',
'* 1 <= nums.length <= 100
* 0 <= nums[i] <= 400',
'First line: n
Second line: nums',
'Print max amount', 25, NOW());

-- 87: House Robber II
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'House Robber II', 'house-robber-ii', 'MEDIUM',
'## Problem Statement
You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle.

Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

## Example
Input: nums = [2,3,2]
Output: 3',
'* 1 <= nums.length <= 100
* 0 <= nums[i] <= 1000',
'First line: n
Second line: nums',
'Print max amount', 25, NOW());

-- 88: Longest Palindromic Substring
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Longest Palindromic Substring', 'longest-palindromic-substring', 'MEDIUM',
'## Problem Statement
Given a string s, return the longest palindromic substring in s.

## Example
Input: s = "babad"
Output: "bab"',
'* 1 <= s.length <= 1000',
'One line: s',
'Print the palindrome', 25, NOW());

-- 89: Palindromic Substrings
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Palindromic Substrings', 'palindromic-substrings', 'MEDIUM',
'## Problem Statement
Given a string s, return the number of palindromic substrings in it.

A string is a palindrome when it reads the same backward as forward.

## Example
Input: s = "abc"
Output: 3',
'* 1 <= s.length <= 1000',
'One line: s',
'Print number of palindromic substrings', 25, NOW());

-- 90: Decode Ways
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Decode Ways', 'decode-ways', 'MEDIUM',
'## Problem Statement
A message containing letters from A-Z can be encoded into numbers using the following mapping:
''A'' -> "1", ''B'' -> "2", ... ''Z'' -> "26"

Given a string s containing only digits, return the number of ways to decode it.

## Example
Input: s = "12"
Output: 2',
'* 1 <= s.length <= 100',
'One line: s',
'Print number of ways', 25, NOW());

-- 91: Coin Change
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Coin Change', 'coin-change', 'MEDIUM',
'## Problem Statement
You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

## Example
Input: coins = [1,2,5], amount = 11
Output: 3',
'* 1 <= coins.length <= 12
* 1 <= amount <= 10^4',
'First line: amount
Second line: n
Third line: coins',
'Print minimum coins', 25, NOW());

-- 92: Jump Game
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Jump Game', 'jump-game', 'MEDIUM',
'## Problem Statement
You are given an integer array nums. You are initially positioned at the array''s first index, and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.

## Example
Input: nums = [2,3,1,1,4]
Output: true',
'* 1 <= nums.length <= 10^4
* 0 <= nums[i] <= 10^5',
'First line: n
Second line: nums',
'Print true or false', 25, NOW());

-- 93: Jump Game II
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Jump Game II', 'jump-game-ii', 'MEDIUM',
'## Problem Statement
You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].

Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].

## Example
Input: nums = [2,3,1,1,4]
Output: 2',
'* 1 <= nums.length <= 10^4
* 0 <= nums[i] <= 1000',
'First line: n
Second line: nums',
'Print minimum jumps', 25, NOW());

-- 94: Partition Equal Subset Sum
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Partition Equal Subset Sum', 'partition-equal-subset-sum', 'MEDIUM',
'## Problem Statement
Given an integer array nums, return true if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or false otherwise.

## Example
Input: nums = [1,5,11,5]
Output: true',
'* 1 <= nums.length <= 200
* 1 <= nums[i] <= 100',
'First line: n
Second line: nums',
'Print true or false', 25, NOW());

-- 95: Unique Paths
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Unique Paths', 'unique-paths', 'MEDIUM',
'## Problem Statement
There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

## Example
Input: m = 3, n = 7
Output: 28',
'* 1 <= m, n <= 100',
'First line: n m',
'Print number of paths', 25, NOW());

-- 96: Longest Common Subsequence
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Longest Common Subsequence', 'longest-common-subsequence', 'MEDIUM',
'## Problem Statement
Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

## Example
Input: text1 = "abcde", text2 = "ace"
Output: 3',
'* 1 <= text1.length, text2.length <= 1000',
'First line: text1
Second line: text2',
'Print length', 25, NOW());

-- 97: Best Time to Buy and Sell Stock
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Best Time to Buy and Sell Stock', 'buy-sell-stock', 'EASY',
'## Problem Statement
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

## Example
Input: prices = [7,1,5,3,6,4]
Output: 5',
'* 1 <= prices.length <= 10^5
* 0 <= prices[i] <= 10^4',
'First line: n
Second line: prices',
'Print max profit', 10, NOW());

-- 98: Merge Intervals
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Merge Intervals', 'merge-intervals', 'MEDIUM',
'## Problem Statement
Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

## Example
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]',
'* 1 <= intervals.length <= 10^4',
'First line: n
Second line: intervals',
'Print merged intervals', 25, NOW());

-- 99: Insert Interval
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Insert Interval', 'insert-interval', 'MEDIUM',
'## Problem Statement
You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

## Example
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]',
'* 0 <= intervals.length <= 10^4',
'First line: n
Second line: intervals
Third line: newInterval',
'Print intervals', 25, NOW());

-- 100: Non-overlapping Intervals
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Non-overlapping Intervals', 'non-overlapping-intervals', 'MEDIUM',
'## Problem Statement
Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

## Example
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1',
'* 1 <= intervals.length <= 10^5',
'First line: n
Second line: intervals',
'Print count', 25, NOW());

-- 101: Permutations
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Permutations', 'permutations', 'MEDIUM',
'## Problem Statement
Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

## Example
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]',
'* 1 <= nums.length <= 6',
'First line: n
Second line: nums',
'Print all permutations', 25, NOW());

-- 102: Subsets
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Subsets', 'subsets', 'MEDIUM',
'## Problem Statement
Given an integer array nums of unique elements, return all possible subsets (the power set).

The solution set must not contain duplicate subsets. Return the solution in any order.

## Example
Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]',
'* 1 <= nums.length <= 10',
'First line: n
Second line: nums',
'Print all subsets', 25, NOW());

-- 103: Combination Sum
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Combination Sum', 'combination-sum', 'MEDIUM',
'## Problem Statement
Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

The same number may be chosen from candidates an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

## Example
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]',
'* 1 <= candidates.length <= 30
* 1 <= target <= 500',
'First line: target
Second line: n
Third line: candidates',
'Print combinations', 25, NOW());

-- 104: Letter Combinations of a Phone Number
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Letter Combinations of a Phone Number', 'letter-combinations', 'MEDIUM',
'## Problem Statement
Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

## Example
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]',
'* 0 <= digits.length <= 4
* digits[i] is a digit in the range [''2'', ''9''].',
'One line: digits',
'Print combinations', 25, NOW());
