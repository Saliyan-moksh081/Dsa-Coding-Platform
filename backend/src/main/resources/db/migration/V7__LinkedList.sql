-- Linked List Problems (10 problems)

-- 34: Reverse Linked List
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Reverse Linked List', 'reverse-linked-list', 'EASY',
'## Problem Statement
Given the head of a singly linked list, reverse the list and return the reversed list.

## Example
Input: [1,2,3,4,5]
Output: [5,4,3,2,1]',
'* Number of nodes: [0, 5000]
* -5000 ≤ Node.val ≤ 5000',
'First line: n (number of nodes)
Second line: n integers representing node values',
'Print the reversed list values space-separated', 10, NOW());

-- 35: Merge Two Sorted Lists
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Merge Two Sorted Lists', 'merge-sorted-lists', 'EASY',
'## Problem Statement
Merge two sorted linked lists into one sorted list by splicing together the nodes.

## Example
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]',
'* Number of nodes in both lists: [0, 50]
* -100 ≤ Node.val ≤ 100',
'First line: n m (sizes of two lists)
Second line: n integers (list1)
Third line: m integers (list2)',
'Print merged list values', 10, NOW());

-- 36: Linked List Cycle
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Linked List Cycle', 'linked-list-cycle', 'EASY',
'## Problem Statement
Given head, determine if the linked list has a cycle. Return the starting position of the cycle or -1.

A cycle exists if some node can be reached again by following the next pointer.

## Example
Input: [3,2,0,-4], cycle at position 1
Output: 1',
'* Number of nodes: [0, 10^4]
* -10^5 ≤ Node.val ≤ 10^5',
'First line: n and pos (where pos is cycle start, -1 if no cycle)
Second line: n node values',
'Print the cycle start position or -1', 10, NOW());

-- 37: Remove Nth Node From End
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Remove Nth Node From End', 'remove-nth-from-end', 'MEDIUM',
'## Problem Statement
Given the head of a linked list, remove the nth node from the end and return the head.

## Example
Input: [1,2,3,4,5], n = 2
Output: [1,2,3,5]',
'* Number of nodes: [1, 30]
* 1 ≤ n ≤ size of list',
'First line: size and n
Second line: node values',
'Print the result list', 25, NOW());

-- 38: Reorder List
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Reorder List', 'reorder-list', 'MEDIUM',
'## Problem Statement
Given head of a linked list L0→L1→...→Ln-1→Ln, reorder it to:
L0→Ln→L1→Ln-1→L2→Ln-2→...

You may not modify values, only nodes themselves.

## Example
Input: [1,2,3,4,5]
Output: [1,5,2,4,3]',
'* Number of nodes: [1, 5×10^4]',
'First line: n
Second line: n node values',
'Print reordered list', 25, NOW());

-- 39: Merge K Sorted Lists
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Merge K Sorted Lists', 'merge-k-sorted-lists', 'HARD',
'## Problem Statement
You are given an array of k linked-lists, each sorted in ascending order. Merge all linked-lists into one sorted linked-list.

## Example
Input: [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]',
'* k = lists.length
* 0 ≤ k ≤ 10^4
* Total nodes ≤ 10^4',
'First line: k
Next k lines: each list (size followed by values)',
'Print merged list', 50, NOW());

-- 40: Reverse Nodes in k-Group
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Reverse Nodes in k-Group', 'reverse-k-group', 'HARD',
'## Problem Statement
Given a linked list, reverse the nodes of the list k at a time and return the modified list. Nodes that are left out should remain in order.

## Example
Input: [1,2,3,4,5], k = 2
Output: [2,1,4,3,5]',
'* Number of nodes <= 5000
* 1 ≤ k ≤ n',
'First line: n and k
Second line: n node values',
'Print reversed list', 50, NOW());

-- 41: Copy List with Random Pointer
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Copy List with Random Pointer', 'copy-random-list', 'MEDIUM',
'## Problem Statement
A linked list has nodes with next and random pointers. Create a deep copy of the list.

## Example
Input: [[7,null],[13,0],[11,4],[10,2],[1,0]]
Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]',
'* 0 ≤ n ≤ 1000
* -10^4 ≤ Node.val ≤ 10^4',
'First line: n
Next n lines: value and random_index',
'Print the copied list structure', 25, NOW());

-- 42: LRU Cache
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'LRU Cache', 'lru-cache', 'MEDIUM',
'## Problem Statement
Design a Least Recently Used (LRU) cache with:
- get(key): Return value if key exists, else -1
- put(key, value): Insert or update. Evict LRU if at capacity.

Both operations must be O(1).

## Example
LRUCache(2)
put(1,1), put(2,2), get(1)→1, put(3,3), get(2)→-1',
'* 1 ≤ capacity ≤ 3000
* 0 ≤ key, value ≤ 10^4',
'First line: capacity and number of operations
Following lines: operation type and parameters',
'Print results of get operations', 25, NOW());

-- 43: Add Two Numbers
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Add Two Numbers', 'add-two-numbers', 'MEDIUM',
'## Problem Statement
You are given two non-empty linked lists representing two non-negative integers stored in reverse order. Add them and return the sum as a linked list.

## Example
Input: [2,4,3] + [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807',
'* Number of nodes: [1, 100]
* 0 ≤ Node.val ≤ 9',
'First line: n1 n2
Second line: n1 digits
Third line: n2 digits',
'Print sum as linked list', 25, NOW());
