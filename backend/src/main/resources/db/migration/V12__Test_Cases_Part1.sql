-- Test Cases for Arrays, Linked List, Stack & Queue Problems

-- Arrays & Strings
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 2 3 1', 'true', true, 1 FROM problems p WHERE p.slug = 'contains-duplicate';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'anagram
nagaram', 'true', true, 1 FROM problems p WHERE p.slug = 'valid-anagram';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 2 3 4', '24 12 8 6', true, 1 FROM problems p WHERE p.slug = 'product-except-self';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
2 3 -2 4', '6', true, 1 FROM problems p WHERE p.slug = 'max-product-subarray';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
3 4 5 1 2', '1', true, 1 FROM problems p WHERE p.slug = 'min-rotated-array';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '7 0
4 5 6 7 0 1 2', '4', true, 1 FROM problems p WHERE p.slug = 'search-rotated-array';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6
-1 0 1 2 -1 -4', '[-1,-1,2]
[-1,0,1]', true, 1 FROM problems p WHERE p.slug = 'three-sum';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '9
1 8 6 2 5 4 8 3 7', '49', true, 1 FROM problems p WHERE p.slug = 'container-water';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '12
0 1 0 2 1 0 1 3 2 1 2 1', '6', true, 1 FROM problems p WHERE p.slug = 'trapping-rain-water';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
3 4 -1 1', '2', true, 1 FROM problems p WHERE p.slug = 'first-missing-positive';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6
100 4 200 1 3 2', '4', true, 1 FROM problems p WHERE p.slug = 'longest-consecutive';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6
eat
tea
tan
ate
nat
bat', 'bat
nat tan
ate eat tea', true, 1 FROM problems p WHERE p.slug = 'group-anagrams';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '   -42', '-42', true, 1 FROM problems p WHERE p.slug = 'string-to-integer';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'PAYPALISHIRING
3', 'PAHNAPLSIIGYIR', true, 1 FROM problems p WHERE p.slug = 'zigzag-conversion';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'aab', 'a a b
aa b', true, 1 FROM problems p WHERE p.slug = 'palindrome-partitioning';

-- Linked Lists
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
1 2 3 4 5', '5 4 3 2 1', true, 1 FROM problems p WHERE p.slug = 'reverse-linked-list';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 3
1 2 4
1 3 4', '1 1 2 3 4 4', true, 1 FROM problems p WHERE p.slug = 'merge-sorted-lists';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 1
3 2 0 -4', '1', true, 1 FROM problems p WHERE p.slug = 'linked-list-cycle';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5 2
1 2 3 4 5', '1 2 3 5', true, 1 FROM problems p WHERE p.slug = 'remove-nth-from-end';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
1 2 3 4 5', '1 5 2 4 3', true, 1 FROM problems p WHERE p.slug = 'reorder-list';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
3 1 4 5
3 1 3 4
2 2 6', '1 1 2 3 4 4 5 6', true, 1 FROM problems p WHERE p.slug = 'merge-k-sorted-lists';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5 2
1 2 3 4 5', '2 1 4 3 5', true, 1 FROM problems p WHERE p.slug = 'reverse-k-group';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
7 null
13 0
11 4
10 2
1 0', '7 null
13 0
11 4
10 2
1 0', true, 1 FROM problems p WHERE p.slug = 'copy-random-list';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2 5
put 1 1
put 2 2
get 1
put 3 3
get 2', '1
-1', true, 1 FROM problems p WHERE p.slug = 'lru-cache';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 3
2 4 3
5 6 4', '7 0 8', true, 1 FROM problems p WHERE p.slug = 'add-two-numbers';

-- Stack & Queue
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '()[]{}', 'true', true, 1 FROM problems p WHERE p.slug = 'valid-parentheses';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6
push -2
push 0
push -3
getMin
pop
top
getMin', '-3
0
-2', true, 1 FROM problems p WHERE p.slug = 'min-stack';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
2
1
+
3
*', '9', true, 1 FROM problems p WHERE p.slug = 'eval-rpn';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '8
73 74 75 71 69 72 76 73', '1 1 4 2 1 1 0 0', true, 1 FROM problems p WHERE p.slug = 'daily-temperatures';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5 12
10 8 0 5 3
2 4 1 1 3', '3', true, 1 FROM problems p WHERE p.slug = 'car-fleet';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6
2 1 5 6 2 3', '10', true, 1 FROM problems p WHERE p.slug = 'largest-rectangle';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
push 1
push 2
peek
pop
empty', '1
1
false', true, 1 FROM problems p WHERE p.slug = 'queue-using-stacks';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
push 1
push 2
top
pop
empty', '2
2
false', true, 1 FROM problems p WHERE p.slug = 'stack-using-queues';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '8 3
1 3 -1 -3 5 3 6 7', '3 3 5 5 6 7', true, 1 FROM problems p WHERE p.slug = 'sliding-window-max';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
1 2 1', '2 -1 2', true, 1 FROM problems p WHERE p.slug = 'next-greater-element';
