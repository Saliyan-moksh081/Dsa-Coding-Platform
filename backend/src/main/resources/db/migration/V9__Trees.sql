-- Tree Problems (15 problems)

-- 54: Maximum Depth of Binary Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Maximum Depth of Binary Tree', 'max-depth-binary-tree', 'EASY',
'## Problem Statement
Given the root of a binary tree, return its maximum depth.

A binary tree''s maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

## Example
Input: root = [3,9,20,null,null,15,7]
Output: 3',
'* The number of nodes in the tree is in the range [0, 10^4].
* -100 <= Node.val <= 100',
'First line: Space separated values representing the tree in level order (null for empty nodes)',
'Print the maximum depth', 10, NOW());

-- 55: Same Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Same Tree', 'same-tree', 'EASY',
'## Problem Statement
Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

## Example
Input: p = [1,2,3], q = [1,2,3]
Output: true',
'* The number of nodes in both trees is in the range [0, 100].
* -10^4 <= Node.val <= 10^4',
'First line: Tree p in level order
Second line: Tree q in level order',
'Print true or false', 10, NOW());

-- 56: Invert Binary Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Invert Binary Tree', 'invert-binary-tree', 'EASY',
'## Problem Statement
Given the root of a binary tree, invert the tree, and return its root.

## Example
Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]',
'* The number of nodes in the tree is in the range [0, 100].
* -100 <= Node.val <= 100',
'First line: Tree in level order',
'Print the inverted tree in level order', 10, NOW());

-- 57: Binary Tree Maximum Path Sum
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Binary Tree Maximum Path Sum', 'binary-tree-max-path-sum', 'HARD',
'## Problem Statement
A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

The path sum is the sum of the node''s values in the path.

Given the root of a binary tree, return the maximum path sum of any non-empty path.

## Example
Input: root = [1,2,3]
Output: 6
Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.',
'* The number of nodes in the tree is in the range [1, 3 * 10^4].
* -1000 <= Node.val <= 1000',
'First line: Tree in level order',
'Print the maximum path sum', 50, NOW());

-- 58: Binary Tree Level Order Traversal
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Binary Tree Level Order Traversal', 'binary-tree-level-order', 'MEDIUM',
'## Problem Statement
Given the root of a binary tree, return the level order traversal of its nodes'' values. (i.e., from left to right, level by level).

## Example
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]',
'* The number of nodes in the tree is in the range [0, 2000].
* -1000 <= Node.val <= 1000',
'First line: Tree in level order',
'Print the level order traversal', 25, NOW());

-- 59: Serialize and Deserialize Binary Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Serialize and Deserialize Binary Tree', 'serialize-deserialize-binary-tree', 'HARD',
'## Problem Statement
Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

## Example
Input: root = [1,2,3,null,null,4,5]
Output: [1,2,3,null,null,4,5]',
'* The number of nodes in the tree is in the range [0, 10^4].
* -1000 <= Node.val <= 1000',
'First line: Tree in level order',
'Print the serialized string or tree structure', 50, NOW());

-- 60: Subtree of Another Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Subtree of Another Tree', 'subtree-of-another-tree', 'EASY',
'## Problem Statement
Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node''s descendants. The tree tree could also be considered as a subtree of itself.

## Example
Input: root = [3,4,5,1,2], subRoot = [4,1,2]
Output: true',
'* The number of nodes in the root tree is in the range [1, 2000].
* The number of nodes in the subRoot tree is in the range [1, 1000].
* -10^4 <= root.val, subRoot.val <= 10^4',
'First line: root tree in level order
Second line: subRoot tree in level order',
'Print true or false', 10, NOW());

-- 61: Construct Binary Tree from Preorder and Inorder Traversal
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Construct Binary Tree', 'construct-binary-tree', 'MEDIUM',
'## Problem Statement
Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

## Example
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]',
'* 1 <= preorder.length <= 3000
* inorder.length == preorder.length
* -3000 <= preorder[i], inorder[i] <= 3000',
'First line: preorder array
Second line: inorder array',
'Print the constructed tree in level order', 25, NOW());

-- 62: Validate Binary Search Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Validate Binary Search Tree', 'validate-bst', 'MEDIUM',
'## Problem Statement
Given the root of a binary tree, determine if it is a valid binary search tree (BST).

A valid BST is defined as follows:
- The left subtree of a node contains only nodes with keys less than the node''s key.
- The right subtree of a node contains only nodes with keys greater than the node''s key.
- Both the left and right subtrees must also be binary search trees.

## Example
Input: root = [2,1,3]
Output: true',
'* The number of nodes in the tree is in the range [1, 10^4].
* -2^31 <= Node.val <= 2^31 - 1',
'First line: Tree in level order',
'Print true or false', 25, NOW());

-- 63: Kth Smallest Element in a BST
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Kth Smallest Element in a BST', 'kth-smallest-bst', 'MEDIUM',
'## Problem Statement
Given the root of a binary search tree and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.

## Example
Input: root = [3,1,4,null,2], k = 1
Output: 1',
'* The number of nodes in the tree is n.
* 1 <= k <= n <= 10^4
* 0 <= Node.val <= 10^4',
'First line: Tree in level order
Second line: k',
'Print the kth smallest value', 25, NOW());

-- 64: Lowest Common Ancestor of a BST
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Lowest Common Ancestor of a BST', 'lca-bst', 'MEDIUM',
'## Problem Statement
Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

## Example
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6',
'* The number of nodes in the tree is in the range [2, 10^5].
* -10^9 <= Node.val <= 10^9
* All Node.val are unique.',
'First line: Tree in level order
Second line: p
Third line: q',
'Print the value of the LCA node', 25, NOW());

-- 65: Implement Trie (Prefix Tree)
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Implement Trie (Prefix Tree)', 'implement-trie', 'MEDIUM',
'## Problem Statement
A Trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the Trie class:
- Trie() Initializes the trie object.
- void insert(String word) Inserts the string word into the trie.
- boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
- boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.

## Example
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False',
'* 1 <= word.length, prefix.length <= 2000
* word and prefix consist only of lowercase English letters.
* At most 3 * 10^4 calls in total will be made to insert, search, and startsWith.',
'First line: Number of operations
Following lines: Operation type and arguments',
'Print results of boolean valid operations', 25, NOW());

-- 66: Design Add and Search Words Data Structure
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Design Add and Search Words', 'design-add-search-words', 'MEDIUM',
'## Problem Statement
Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the WordDictionary class:
- WordDictionary() Initializes the object.
- void addWord(word) Adds word to the data structure, it can be matched later.
- bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots ''.'' where dots can be matched with any letter.

## Example
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True',
'* 1 <= word.length <= 25
* word in addWord consists of lowercase English letters.
* word in search consist of ''.'' or lowercase English letters.
* At most 10^4 calls will be made to addWord and search.',
'First line: Number of operations
Following lines: Operation type and arguments',
'Print boolean results', 25, NOW());

-- 67: Word Search II
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Word Search II', 'word-search-ii', 'HARD',
'## Problem Statement
Given an m x n board of characters and a list of strings words, return all words on the board.

Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

## Example
Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
Output: ["eat","oath"]',
'* m == board.length
* n == board[i].length
* 1 <= m, n <= 12
* 1 <= words.length <= 3 * 10^4',
'First line: m n (dimensions)
Next m lines: board rows
Next line: number of words
Next line: words space separated',
'Print found words', 50, NOW());

-- 68: Diameter of Binary Tree
INSERT INTO problems (id, title, slug, difficulty, description, constraints, input_format, output_format, points, created_at)
VALUES (gen_random_uuid(), 'Diameter of Binary Tree', 'diameter-binary-tree', 'EASY',
'## Problem Statement
Given the root of a binary tree, return the length of the diameter of the tree.

The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

The length of a path between two nodes is represented by the number of edges between them.

## Example
Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].',
'* The number of nodes in the tree is in the range [1, 10^4].
* -100 <= Node.val <= 100',
'First line: Tree in level order',
'Print the diameter', 10, NOW());
