-- Stack & Queue Problems (10 problems)

-- 44: Valid Parentheses
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Valid Parentheses', 'valid-parentheses', 'EASY',
'## Problem Statement
Given a string s containing just the characters ''('', '')'', ''{'', ''}'', ''['' and '']'', determine if the input string is valid.

Valid if brackets close in correct order.

## Example
Input: "()[]{}"
Output: true

Input: "([)]"
Output: false',
'* 1 ≤ s.length ≤ 10^4',
'One line containing the string',
'Print "true" or "false"', 10, NOW());

-- 45: Min Stack
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Min Stack', 'min-stack', 'MEDIUM',
'## Problem Statement
Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

- push(val): Push element
- pop(): Remove top element
- top(): Get top element
- getMin(): Retrieve minimum element

## Example
MinStack(), push(-2), push(0), push(-3), getMin()→-3, pop(), top()→0, getMin()→-2',
'* -2^31 ≤ val ≤ 2^31 - 1
* At most 3×10^4 calls',
'First line: number of operations
Following lines: operation and parameter',
'Print results of top and getMin operations', 25, NOW());

-- 46: Evaluate Reverse Polish Notation
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Evaluate Reverse Polish Notation', 'eval-rpn', 'MEDIUM',
'## Problem Statement
Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators: +, -, *, /. Division truncates toward zero.

## Example
Input: ["2","1","+","3","*"]
Output: 9
Explanation: ((2+1)*3) = 9',
'* 1 ≤ tokens.length ≤ 10^4',
'First line: n
Following n lines: tokens',
'Print the result', 25, NOW());

-- 47: Daily Temperatures
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Daily Temperatures', 'daily-temperatures', 'MEDIUM',
'## Problem Statement
Given an array of temperatures, return an array where answer[i] is the number of days you have to wait until a warmer temperature. If no future day is warmer, answer[i] = 0.

## Example
Input: [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]',
'* 1 ≤ temperatures.length ≤ 10^5
* 30 ≤ temperatures[i] ≤ 100',
'First line: n
Second line: n temperatures',
'Print the answer array', 25, NOW());

-- 48: Car Fleet
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Car Fleet', 'car-fleet', 'MEDIUM',
'## Problem Statement
n cars driving to a target. Each starts at position[i] with speed[i] mph. A faster car behind a slower car forms a fleet and travels at the slower speed.

How many fleets arrive at target?

## Example
target = 12, position = [10,8,0,5,3], speed = [2,4,1,1,3]
Output: 3',
'* n = position.length = speed.length
* 0 < target ≤ 10^6
* 1 ≤ n ≤ 10^5',
'First line: n and target
Second line: n positions
Third line: n speeds',
'Print number of fleets', 25, NOW());

-- 49: Largest Rectangle in Histogram
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Largest Rectangle in Histogram', 'largest-rectangle', 'HARD',
'## Problem Statement
Given an array of integers heights representing the histogram''s bar height where width is 1, return the area of the largest rectangle in the histogram.

## Example
Input: [2,1,5,6,2,3]
Output: 10',
'* 1 ≤ heights.length ≤ 10^5
* 0 ≤ heights[i] ≤ 10^4',
'First line: n
Second line: n heights',
'Print the maximum area', 50, NOW());

-- 50: Implement Queue using Stacks
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Implement Queue using Stacks', 'queue-using-stacks', 'EASY',
'## Problem Statement
Implement a FIFO queue using only two stacks. Support push, pop, peek, and empty operations.

## Example
MyQueue(), push(1), push(2), peek()→1, pop()→1, empty()→false',
'* 1 ≤ x ≤ 9
* At most 100 calls
* All operations are valid',
'First line: number of operations
Following lines: operations',
'Print results of peek, pop, empty operations', 10, NOW());

-- 51: Implement Stack using Queues
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Implement Stack using Queues', 'stack-using-queues', 'EASY',
'## Problem Statement
Implement a LIFO stack using only two queues. Support push, pop, top, and empty operations.

## Example
MyStack(), push(1), push(2), top()→2, pop()→2, empty()→false',
'* 1 ≤ x ≤ 9
* At most 100 calls',
'First line: number of operations
Following lines: operations',
'Print results of top, pop, empty operations', 10, NOW());

-- 52: Sliding Window Maximum
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Sliding Window Maximum', 'sliding-window-max', 'HARD',
'## Problem Statement
Given an array nums and a sliding window of size k moving from left to right, return the max in each window.

## Example
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]',
'* 1 ≤ nums.length ≤ 10^5
* -10^4 ≤ nums[i] ≤ 10^4
* 1 ≤ k ≤ nums.length',
'First line: n and k
Second line: n numbers',
'Print the max values', 50, NOW());

-- 53: Next Greater Element
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Next Greater Element', 'next-greater-element', 'EASY',
'## Problem Statement
Given a circular array nums, return the next greater number for every element. The next greater is the first greater number in the next traversal order.

## Example
Input: [1,2,1]
Output: [2,-1,2]',
'* 1 ≤ nums.length ≤ 10^4
* -10^9 ≤ nums[i] ≤ 10^9',
'First line: n
Second line: n numbers',
'Print next greater elements', 10, NOW());
