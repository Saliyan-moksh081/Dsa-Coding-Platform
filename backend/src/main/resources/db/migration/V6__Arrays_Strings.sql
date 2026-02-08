-- Arrays & Strings Problems (15 problems)

-- 19: Contains Duplicate
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Contains Duplicate', 'contains-duplicate', 'EASY',
'## Problem Statement
Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

## Example
Input: [1,2,3,1]
Output: true

Input: [1,2,3,4]
Output: false',
'* 1 ≤ nums.length ≤ 10^5
* -10^9 ≤ nums[i] ≤ 10^9',
'First line: n (array size)
Second line: n space-separated integers',
'Print "true" or "false"', 10, NOW());

-- 20: Valid Anagram
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Valid Anagram', 'valid-anagram', 'EASY',
'## Problem Statement
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

An anagram is a word formed by rearranging the letters of another word.

## Example
Input: s = "anagram", t = "nagaram"
Output: true',
'* 1 ≤ s.length, t.length ≤ 5×10^4
* s and t consist of lowercase English letters',
'Two lines containing strings s and t',
'Print "true" or "false"', 10, NOW());

-- 21: Product of Array Except Self
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Product of Array Except Self', 'product-except-self', 'MEDIUM',
'## Problem Statement
Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

You must solve it without using division and in O(n) time.

## Example
Input: [1,2,3,4]
Output: [24,12,8,6]',
'* 2 ≤ nums.length ≤ 10^5
* -30 ≤ nums[i] ≤ 30
* The product of any prefix or suffix of nums fits in a 32-bit integer',
'First line: n
Second line: n integers',
'Print space-separated products', 25, NOW());

-- 22: Maximum Product Subarray
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Maximum Product Subarray', 'max-product-subarray', 'MEDIUM',
'## Problem Statement
Given an integer array nums, find a subarray that has the largest product, and return the product.

## Example
Input: [2,3,-2,4]
Output: 6 (subarray [2,3])

Input: [-2,0,-1]
Output: 0',
'* 1 ≤ nums.length ≤ 2×10^4
* -10 ≤ nums[i] ≤ 10',
'First line: n
Second line: n integers',
'Print the maximum product', 25, NOW());

-- 23: Find Minimum in Rotated Sorted Array
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Minimum in Rotated Array', 'min-rotated-array', 'MEDIUM',
'## Problem Statement
Given a sorted rotated array of unique elements, return the minimum element. You must solve it in O(log n) time.

A sorted array is rotated when it is moved to the left by some positions.
[1,2,3,4,5] rotated by 2 becomes [3,4,5,1,2]

## Example
Input: [3,4,5,1,2]
Output: 1',
'* n = nums.length
* 1 ≤ n ≤ 5000
* All integers are unique',
'First line: n
Second line: n integers',
'Print the minimum element', 25, NOW());

-- 24: Search in Rotated Sorted Array
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Search in Rotated Array', 'search-rotated-array', 'MEDIUM',
'## Problem Statement
Given a sorted rotated array of distinct integers and a target value, return the index of target or -1 if not found. Solve in O(log n) time.

## Example
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4',
'* 1 ≤ nums.length ≤ 5000
* All values are unique',
'First line: n and target
Second line: n integers',
'Print the index or -1', 25, NOW());

-- 25: 3Sum
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Three Sum', 'three-sum', 'MEDIUM',
'## Problem Statement
Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, j != k, and nums[i] + nums[j] + nums[k] == 0.

The solution set must not contain duplicate triplets.

## Example
Input: [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]',
'* 3 ≤ nums.length ≤ 3000
* -10^5 ≤ nums[i] ≤ 10^5',
'First line: n
Second line: n integers',
'Print each triplet on a new line', 25, NOW());

-- 26: Container With Most Water
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Container With Most Water', 'container-water', 'MEDIUM',
'## Problem Statement
Given n non-negative integers representing heights of vertical lines, find two lines that together with the x-axis form a container that holds the most water.

## Example
Input: [1,8,6,2,5,4,8,3,7]
Output: 49 (between indices 1 and 8)',
'* n = height.length
* 2 ≤ n ≤ 10^5
* 0 ≤ height[i] ≤ 10^4',
'First line: n
Second line: n heights',
'Print the maximum area', 25, NOW());

-- 27: Trapping Rain Water
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Trapping Rain Water', 'trapping-rain-water', 'HARD',
'## Problem Statement
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

## Example
Input: [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6',
'* n = height.length
* 1 ≤ n ≤ 2×10^4
* 0 ≤ height[i] ≤ 10^5',
'First line: n
Second line: n heights',
'Print total water trapped', 50, NOW());

-- 28: First Missing Positive
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'First Missing Positive', 'first-missing-positive', 'HARD',
'## Problem Statement
Given an unsorted integer array nums, return the smallest positive integer that is not present in nums.

You must implement an O(n) time and O(1) auxiliary space algorithm.

## Example
Input: [3,4,-1,1]
Output: 2

Input: [1,2,0]
Output: 3',
'* 1 ≤ nums.length ≤ 10^5
* -2^31 ≤ nums[i] ≤ 2^31 - 1',
'First line: n
Second line: n integers',
'Print the first missing positive', 50, NOW());

-- 29: Longest Consecutive Sequence
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Longest Consecutive Sequence', 'longest-consecutive', 'MEDIUM',
'## Problem Statement
Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

You must write an O(n) algorithm.

## Example
Input: [100,4,200,1,3,2]
Output: 4 (sequence: 1,2,3,4)',
'* 0 ≤ nums.length ≤ 10^5
* -10^9 ≤ nums[i] ≤ 10^9',
'First line: n
Second line: n integers',
'Print the length of longest consecutive sequence', 25, NOW());

-- 30: Group Anagrams
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Group Anagrams', 'group-anagrams', 'MEDIUM',
'## Problem Statement
Given an array of strings strs, group the anagrams together. You can return the answer in any order.

## Example
Input: ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]',
'* 1 ≤ strs.length ≤ 10^4
* 0 ≤ strs[i].length ≤ 100
* strs[i] consists of lowercase English letters',
'First line: n
Next n lines: one string each',
'Print each group on a new line', 25, NOW());

-- 31: String to Integer (atoi)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'String to Integer', 'string-to-integer', 'MEDIUM',
'## Problem Statement
Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer.

1. Read and ignore leading whitespace
2. Check for sign (+ or -)
3. Read digits until non-digit or end
4. Clamp to 32-bit integer range

## Example
Input: "   -42"
Output: -42',
'* 0 ≤ s.length ≤ 200
* s consists of English letters, digits, space, +, -',
'One line containing the string',
'Print the integer value', 25, NOW());

-- 32: Zigzag Conversion
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Zigzag Conversion', 'zigzag-conversion', 'MEDIUM',
'## Problem Statement
Write the string "PAYPALISHIRING" in a zigzag pattern on numRows rows, then read line by line.

P   A   H   N
A P L S I I G
Y   I   R

For numRows=3, result is "PAHNAPLSIIGYIR"

## Example
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"',
'* 1 ≤ s.length ≤ 1000
* 1 ≤ numRows ≤ 1000',
'First line: string s
Second line: numRows',
'Print the converted string', 25, NOW());

-- 33: Palindrome Partitioning
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Palindrome Partitioning', 'palindrome-partitioning', 'MEDIUM',
'## Problem Statement
Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

## Example
Input: "aab"
Output: [["a","a","b"],["aa","b"]]',
'* 1 ≤ s.length ≤ 16
* s contains only lowercase English letters',
'One line containing string s',
'Print each partition on a new line', 25, NOW());
