-- Import ALL problems from DsaPatterns2026.csv
-- Uses MERGE (H2-compatible) to add missing problems and update existing with topic
-- Preserves existing ID when updating to avoid foreign key constraint violations

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'two-sum'), gen_random_uuid()),
    'Two Sum',
    'two-sum',
    'EASY',
    'sorted array, target sum, reverse, remove duplicates',
    10,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'two-sum'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'best-time-to-buy-and-sell-stock'), gen_random_uuid()),
    'Best Time to Buy and Sell Stock',
    'best-time-to-buy-and-sell-stock',
    'MEDIUM',
    'track prices, find max profit',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'best-time-to-buy-and-sell-stock'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'contains-duplicate'), gen_random_uuid()),
    'Contains Duplicate',
    'contains-duplicate',
    'EASY',
    'check for repeated elements',
    10,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'contains-duplicate'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'product-of-array-except-self'), gen_random_uuid()),
    'Product of Array Except Self',
    'product-of-array-except-self',
    'MEDIUM',
    'no division, calculate left/right products',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'product-of-array-except-self'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'maximum-subarray'), gen_random_uuid()),
    'Maximum Subarray',
    'maximum-subarray',
    'MEDIUM',
    'Kadane''s algorithm, max sum subarray',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'maximum-subarray'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'maximum-product-subarray'), gen_random_uuid()),
    'Maximum Product Subarray',
    'maximum-product-subarray',
    'MEDIUM',
    'track min and max product',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'maximum-product-subarray'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'merge-intervals'), gen_random_uuid()),
    'Merge Intervals',
    'merge-intervals',
    'MEDIUM',
    'merge overlapping intervals',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'merge-intervals'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'insert-interval'), gen_random_uuid()),
    'Insert Interval',
    'insert-interval',
    'MEDIUM',
    'find position to insert new interval',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'insert-interval'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'merge-sorted-array'), gen_random_uuid()),
    'Merge Sorted Array',
    'merge-sorted-array',
    'MEDIUM',
    'merge sorted arrays in-place',
    25,
    'Arrays + Two Pointers',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'merge-sorted-array'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'sliding-window-maximum'), gen_random_uuid()),
    'Sliding Window Maximum',
    'sliding-window-maximum',
    'HARD',
    'contiguous window, max in each window',
    50,
    'Sliding Window',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'sliding-window-maximum'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'minimum-window-substring'), gen_random_uuid()),
    'Minimum Window Substring',
    'minimum-window-substring',
    'HARD',
    'minimum window covering all characters',
    50,
    'Sliding Window',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'minimum-window-substring'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'longest-substring-without-repeating-characters'), gen_random_uuid()),
    'Longest Substring Without Repeating Characters',
    'longest-substring-without-repeating-characters',
    'MEDIUM',
    'track chars without repeat',
    25,
    'Sliding Window',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'longest-substring-without-repeating-characters'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'binary-search'), gen_random_uuid()),
    'Binary Search',
    'binary-search',
    'EASY',
    'classic binary search on sorted array',
    10,
    'Binary Search',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'binary-search'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'search-in-rotated-sorted-array'), gen_random_uuid()),
    'Search in Rotated Sorted Array',
    'search-in-rotated-sorted-array',
    'MEDIUM',
    'search in rotated sorted array',
    25,
    'Binary Search',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'search-in-rotated-sorted-array'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'find-minimum-in-rotated-sorted-array'), gen_random_uuid()),
    'Find Minimum in Rotated Sorted Array',
    'find-minimum-in-rotated-sorted-array',
    'MEDIUM',
    'find minimum in rotated array',
    25,
    'Binary Search',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'find-minimum-in-rotated-sorted-array'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'search-a-2d-matrix'), gen_random_uuid()),
    'Search a 2D Matrix',
    'search-a-2d-matrix',
    'MEDIUM',
    'matrix behaves like sorted array',
    25,
    'Binary Search',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'search-a-2d-matrix'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'median-of-two-sorted-arrays'), gen_random_uuid()),
    'Median of Two Sorted Arrays',
    'median-of-two-sorted-arrays',
    'HARD',
    'binary search on answer space',
    50,
    'Binary Search',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'median-of-two-sorted-arrays'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'valid-parentheses'), gen_random_uuid()),
    'Valid Parentheses',
    'valid-parentheses',
    'EASY',
    'match brackets',
    10,
    'Stack / Monotonic Stack',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'valid-parentheses'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'min-stack'), gen_random_uuid()),
    'Min Stack',
    'min-stack',
    'MEDIUM',
    'track min value with stack',
    25,
    'Stack / Monotonic Stack',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'min-stack'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'evaluate-reverse-polish-notation'), gen_random_uuid()),
    'Evaluate Reverse Polish Notation',
    'evaluate-reverse-polish-notation',
    'MEDIUM',
    'evaluate expressions in postfix',
    25,
    'Stack / Monotonic Stack',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'evaluate-reverse-polish-notation'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'daily-temperatures'), gen_random_uuid()),
    'Daily Temperatures',
    'daily-temperatures',
    'MEDIUM',
    'track next warmer day using stack',
    25,
    'Stack / Monotonic Stack',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'daily-temperatures'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'generate-parentheses'), gen_random_uuid()),
    'Generate Parentheses',
    'generate-parentheses',
    'MEDIUM',
    'generate valid parentheses',
    25,
    'Stack / Monotonic Stack',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'generate-parentheses'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'subsets'), gen_random_uuid()),
    'Subsets',
    'subsets',
    'MEDIUM',
    'find all combinations/subsets',
    25,
    'Recursion / Backtracking',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'subsets'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'permutations'), gen_random_uuid()),
    'Permutations',
    'permutations',
    'MEDIUM',
    'generate all permutations',
    25,
    'Recursion / Backtracking',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'permutations'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'combination-sum'), gen_random_uuid()),
    'Combination Sum',
    'combination-sum',
    'MEDIUM',
    'sum to target with combination',
    25,
    'Recursion / Backtracking',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'combination-sum'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'word-search'), gen_random_uuid()),
    'Word Search',
    'word-search',
    'MEDIUM',
    'search word path in 2D grid',
    25,
    'Recursion / Backtracking',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'word-search'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'letter-combinations-of-a-phone-number'), gen_random_uuid()),
    'Letter Combinations of a Phone Number',
    'letter-combinations-of-a-phone-number',
    'MEDIUM',
    'map digits to letters',
    25,
    'Recursion / Backtracking',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'letter-combinations-of-a-phone-number'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'climbing-stairs'), gen_random_uuid()),
    'Climbing Stairs',
    'climbing-stairs',
    'EASY',
    'ways to climb stairs',
    10,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'climbing-stairs'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'house-robber'), gen_random_uuid()),
    'House Robber',
    'house-robber',
    'MEDIUM',
    'rob non-adjacent houses',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'house-robber'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'house-robber-ii'), gen_random_uuid()),
    'House Robber II',
    'house-robber-ii',
    'MEDIUM',
    'circular house rob',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'house-robber-ii'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'longest-increasing-subsequence'), gen_random_uuid()),
    'Longest Increasing Subsequence',
    'longest-increasing-subsequence',
    'MEDIUM',
    'longest increasing subsequence',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'longest-increasing-subsequence'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'coin-change'), gen_random_uuid()),
    'Coin Change',
    'coin-change',
    'MEDIUM',
    'fewest coins to reach amount',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'coin-change'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'word-break'), gen_random_uuid()),
    'Word Break',
    'word-break',
    'MEDIUM',
    'can segment string with dictionary',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'word-break'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'palindrome-partitioning'), gen_random_uuid()),
    'Palindrome Partitioning',
    'palindrome-partitioning',
    'MEDIUM',
    'partition string into palindromes',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'palindrome-partitioning'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'longest-palindromic-substring'), gen_random_uuid()),
    'Longest Palindromic Substring',
    'longest-palindromic-substring',
    'MEDIUM',
    'longest palindrome substring',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'longest-palindromic-substring'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'palindromic-substrings'), gen_random_uuid()),
    'Palindromic Substrings',
    'palindromic-substrings',
    'MEDIUM',
    'count all palindrome substrings',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'palindromic-substrings'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'decode-ways'), gen_random_uuid()),
    'Decode Ways',
    'decode-ways',
    'MEDIUM',
    'decode numeric string',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'decode-ways'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'unique-paths'), gen_random_uuid()),
    'Unique Paths',
    'unique-paths',
    'MEDIUM',
    'count unique paths in grid',
    25,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'unique-paths'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'edit-distance'), gen_random_uuid()),
    'Edit Distance',
    'edit-distance',
    'HARD',
    'minimum edits to match strings',
    50,
    'Dynamic Programming',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'edit-distance'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'number-of-islands'), gen_random_uuid()),
    'Number of Islands',
    'number-of-islands',
    'MEDIUM',
    'count connected islands',
    25,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'number-of-islands'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'clone-graph'), gen_random_uuid()),
    'Clone Graph',
    'clone-graph',
    'MEDIUM',
    'clone graph using BFS or DFS',
    25,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'clone-graph'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'course-schedule'), gen_random_uuid()),
    'Course Schedule',
    'course-schedule',
    'MEDIUM',
    'can complete all courses (cycle detection)',
    25,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'course-schedule'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'pacific-atlantic-water-flow'), gen_random_uuid()),
    'Pacific Atlantic Water Flow',
    'pacific-atlantic-water-flow',
    'MEDIUM',
    'flow from Pacific and Atlantic',
    25,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'pacific-atlantic-water-flow'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'word-ladder'), gen_random_uuid()),
    'Word Ladder',
    'word-ladder',
    'HARD',
    'shortest transformation sequence',
    50,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'word-ladder'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'graph-valid-tree'), gen_random_uuid()),
    'Graph Valid Tree',
    'graph-valid-tree',
    'MEDIUM',
    'validate tree structure',
    25,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'graph-valid-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'jump-game'), gen_random_uuid()),
    'Jump Game',
    'jump-game',
    'MEDIUM',
    'can jump to end',
    25,
    'Greedy / Intervals',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'jump-game'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'gas-station'), gen_random_uuid()),
    'Gas Station',
    'gas-station',
    'MEDIUM',
    'complete circuit with gas and cost',
    25,
    'Greedy / Intervals',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'gas-station'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'task-scheduler'), gen_random_uuid()),
    'Task Scheduler',
    'task-scheduler',
    'MEDIUM',
    'schedule tasks with cooldown',
    25,
    'Greedy / Intervals',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'task-scheduler'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'top-k-frequent-elements'), gen_random_uuid()),
    'Top K Frequent Elements',
    'top-k-frequent-elements',
    'MEDIUM',
    'top K frequent elements',
    25,
    'Heap / Priority Queue',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'top-k-frequent-elements'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'kth-largest-element-in-an-array'), gen_random_uuid()),
    'Kth Largest Element in an Array',
    'kth-largest-element-in-an-array',
    'MEDIUM',
    'find kth largest element',
    25,
    'Heap / Priority Queue',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'kth-largest-element-in-an-array'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'merge-k-sorted-lists'), gen_random_uuid()),
    'Merge K Sorted Lists',
    'merge-k-sorted-lists',
    'HARD',
    'merge multiple sorted lists',
    50,
    'Heap / Priority Queue',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'merge-k-sorted-lists'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'implement-trie-prefix-tree'), gen_random_uuid()),
    'Implement Trie (Prefix Tree)',
    'implement-trie-prefix-tree',
    'MEDIUM',
    'implement prefix tree',
    25,
    'Trie',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'implement-trie-prefix-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'word-search-ii'), gen_random_uuid()),
    'Word Search II',
    'word-search-ii',
    'HARD',
    'search words from dictionary in board',
    50,
    'Trie',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'word-search-ii'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'valid-anagram'), gen_random_uuid()),
    'Valid Anagram',
    'valid-anagram',
    'EASY',
    'check if anagrams',
    10,
    'Hashing',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'valid-anagram'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'single-number'), gen_random_uuid()),
    'Single Number',
    'single-number',
    'EASY',
    'find unique element with XOR',
    10,
    'Hashing',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'single-number'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'group-anagrams'), gen_random_uuid()),
    'Group Anagrams',
    'group-anagrams',
    'MEDIUM',
    'group words with same chars',
    25,
    'Hashing',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'group-anagrams'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'longest-consecutive-sequence'), gen_random_uuid()),
    'Longest Consecutive Sequence',
    'longest-consecutive-sequence',
    'MEDIUM',
    'longest consecutive sequence',
    25,
    'Hashing',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'longest-consecutive-sequence'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'reverse-linked-list'), gen_random_uuid()),
    'Reverse Linked List',
    'reverse-linked-list',
    'EASY',
    'reverse pointers',
    10,
    'Linked List',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'reverse-linked-list'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'linked-list-cycle'), gen_random_uuid()),
    'Linked List Cycle',
    'linked-list-cycle',
    'EASY',
    'detect cycle in linked list',
    10,
    'Linked List',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'linked-list-cycle'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'merge-two-sorted-lists'), gen_random_uuid()),
    'Merge Two Sorted Lists',
    'merge-two-sorted-lists',
    'EASY',
    'merge two sorted lists',
    10,
    'Linked List',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'merge-two-sorted-lists'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'remove-nth-node-from-end-of-list'), gen_random_uuid()),
    'Remove Nth Node From End of List',
    'remove-nth-node-from-end-of-list',
    'MEDIUM',
    'remove nth node from end',
    25,
    'Linked List',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'remove-nth-node-from-end-of-list'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'add-two-numbers'), gen_random_uuid()),
    'Add Two Numbers',
    'add-two-numbers',
    'MEDIUM',
    'add numbers represented by linked lists',
    25,
    'Linked List',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'add-two-numbers'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'binary-tree-inorder-traversal'), gen_random_uuid()),
    'Binary Tree Inorder Traversal',
    'binary-tree-inorder-traversal',
    'MEDIUM',
    'inorder traversal without recursion',
    25,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'binary-tree-inorder-traversal'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'invert-binary-tree'), gen_random_uuid()),
    'Invert Binary Tree',
    'invert-binary-tree',
    'EASY',
    'invert binary tree',
    10,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'invert-binary-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'maximum-depth-of-binary-tree'), gen_random_uuid()),
    'Maximum Depth of Binary Tree',
    'maximum-depth-of-binary-tree',
    'EASY',
    'maximum depth of binary tree',
    10,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'maximum-depth-of-binary-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'same-tree'), gen_random_uuid()),
    'Same Tree',
    'same-tree',
    'EASY',
    'check if two trees are the same',
    10,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'same-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'symmetric-tree'), gen_random_uuid()),
    'Symmetric Tree',
    'symmetric-tree',
    'EASY',
    'check if tree is symmetric',
    10,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'symmetric-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'binary-tree-level-order-traversal'), gen_random_uuid()),
    'Binary Tree Level Order Traversal',
    'binary-tree-level-order-traversal',
    'MEDIUM',
    'level order traversal',
    25,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'binary-tree-level-order-traversal'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'construct-binary-tree-from-preorder-and-inorder-traversal'), gen_random_uuid()),
    'Construct Binary Tree from Preorder and Inorder Traversal',
    'construct-binary-tree-from-preorder-and-inorder-traversal',
    'MEDIUM',
    'build tree from inorder and preorder',
    25,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'construct-binary-tree-from-preorder-and-inorder-traversal'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'path-sum'), gen_random_uuid()),
    'Path Sum',
    'path-sum',
    'EASY',
    'check tree path sum',
    10,
    'Trees',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'path-sum'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'validate-binary-search-tree'), gen_random_uuid()),
    'Validate Binary Search Tree',
    'validate-binary-search-tree',
    'EASY',
    'validate BST',
    10,
    'Binary Search Tree',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'validate-binary-search-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'lowest-common-ancestor-of-a-bst'), gen_random_uuid()),
    'Lowest Common Ancestor of a BST',
    'lowest-common-ancestor-of-a-bst',
    'MEDIUM',
    'lowest common ancestor in BST',
    25,
    'Binary Search Tree',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'lowest-common-ancestor-of-a-bst'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'insert-into-a-binary-search-tree'), gen_random_uuid()),
    'Insert into a Binary Search Tree',
    'insert-into-a-binary-search-tree',
    'EASY',
    'insert node into BST',
    10,
    'Binary Search Tree',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'insert-into-a-binary-search-tree'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = 'redundant-connection'), gen_random_uuid()),
    'Redundant Connection',
    'redundant-connection',
    'MEDIUM',
    'build graph and detect cycle',
    25,
    'Graphs (BFS/DFS)',
    COALESCE((SELECT created_at FROM problems WHERE slug = 'redundant-connection'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

