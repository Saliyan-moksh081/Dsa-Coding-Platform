-- V2__Sample_Problems.sql
-- Insert sample DSA problems

-- Two Sum (Easy)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'Two Sum',
    'two-sum',
    'EASY',
    '## Problem Statement

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

## Examples

**Example 1:**
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
```

**Example 2:**
```
Input: nums = [3,2,4], target = 6
Output: [1,2]
```',
    '* 2 <= nums.length <= 10^4
* -10^9 <= nums[i] <= 10^9
* -10^9 <= target <= 10^9
* Only one valid answer exists.',
    'First line contains space-separated integers representing the array.
Second line contains the target integer.',
    'Print two space-separated indices.',
    10,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
);

-- Reverse String (Easy)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'Reverse String',
    'reverse-string',
    'EASY',
    '## Problem Statement

Write a function that reverses a string. The input string is given as an array of characters.

You must do this by modifying the input array in-place.

## Examples

**Example 1:**
```
Input: s = "hello"
Output: "olleh"
```

**Example 2:**
```
Input: s = "Hannah"
Output: "hannaH"
```',
    '* 1 <= s.length <= 10^5
* s[i] is a printable ascii character.',
    'A single line containing the string to reverse.',
    'Print the reversed string.',
    10,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
);

-- Longest Substring Without Repeating Characters (Medium)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'Longest Substring Without Repeating Characters',
    'longest-substring-without-repeating-characters',
    'MEDIUM',
    '## Problem Statement

Given a string `s`, find the length of the longest substring without repeating characters.

## Examples

**Example 1:**
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

**Example 2:**
```
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

**Example 3:**
```
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
```',
    '* 0 <= s.length <= 5 * 10^4
* s consists of English letters, digits, symbols and spaces.',
    'A single line containing the string.',
    'Print the length of the longest substring without repeating characters.',
    25,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
);

-- Binary Search (Easy)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'Binary Search',
    'binary-search',
    'EASY',
    '## Problem Statement

Given an array of integers `nums` which is sorted in ascending order, and an integer `target`, write a function to search `target` in `nums`. If `target` exists, then return its index. Otherwise, return `-1`.

You must write an algorithm with O(log n) runtime complexity.

## Examples

**Example 1:**
```
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4
```

**Example 2:**
```
Input: nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1
```',
    '* 1 <= nums.length <= 10^4
* -10^4 < nums[i], target < 10^4
* All the integers in nums are unique.
* nums is sorted in ascending order.',
    'First line contains space-separated integers representing the sorted array.
Second line contains the target integer.',
    'Print the index of target if found, otherwise print -1.',
    10,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
);

-- Merge Two Sorted Lists (Medium)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'Merge Two Sorted Arrays',
    'merge-two-sorted-arrays',
    'MEDIUM',
    '## Problem Statement

You are given two integer arrays `nums1` and `nums2`, sorted in non-decreasing order. Merge them into a single sorted array and return it.

## Examples

**Example 1:**
```
Input: nums1 = [1,2,4], nums2 = [1,3,4]
Output: [1,1,2,3,4,4]
```

**Example 2:**
```
Input: nums1 = [1], nums2 = []
Output: [1]
```',
    '* nums1.length + nums2.length <= 10^4
* -10^6 <= nums1[i], nums2[i] <= 10^6',
    'First line contains space-separated integers for first array.
Second line contains space-separated integers for second array.',
    'Print the merged sorted array as space-separated integers.',
    25,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
);

-- Maximum Subarray (Hard)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    'Maximum Subarray',
    'maximum-subarray',
    'HARD',
    '## Problem Statement

Given an integer array `nums`, find the subarray with the largest sum, and return its sum.

## Examples

**Example 1:**
```
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
```

**Example 2:**
```
Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
```

**Example 3:**
```
Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.
```',
    '* 1 <= nums.length <= 10^5
* -10^4 <= nums[i] <= 10^4',
    'A single line containing space-separated integers.',
    'Print the maximum subarray sum.',
    50,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
);
