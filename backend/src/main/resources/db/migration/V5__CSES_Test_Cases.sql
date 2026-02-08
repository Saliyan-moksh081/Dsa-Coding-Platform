-- Test cases for CSES-style problems

-- Test cases for Weird Algorithm
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3', '3 10 5 16 8 4 2 1', true, 1
FROM problems p WHERE p.slug = 'weird-algorithm';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '1', '1', true, 2
FROM problems p WHERE p.slug = 'weird-algorithm';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '7', '7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1', false, 3
FROM problems p WHERE p.slug = 'weird-algorithm';

-- Test cases for Missing Number
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
2 3 1 5', '4', true, 1
FROM problems p WHERE p.slug = 'missing-number';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
1 3', '2', true, 2
FROM problems p WHERE p.slug = 'missing-number';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '10
1 2 3 4 5 6 7 8 10', '9', false, 3
FROM problems p WHERE p.slug = 'missing-number';

-- Test cases for Repetitions
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'ATTCGGGA', '3', true, 1
FROM problems p WHERE p.slug = 'repetitions';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'AAAA', '4', true, 2
FROM problems p WHERE p.slug = 'repetitions';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'ACGT', '1', false, 3
FROM problems p WHERE p.slug = 'repetitions';

-- Test cases for Increasing Array
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
3 2 5 1 7', '5', true, 1
FROM problems p WHERE p.slug = 'increasing-array';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 2 3 4', '0', true, 2
FROM problems p WHERE p.slug = 'increasing-array';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
5 3 1', '6', false, 3
FROM problems p WHERE p.slug = 'increasing-array';

-- Test cases for Beautiful Permutation
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5', '4 2 5 3 1', true, 1
FROM problems p WHERE p.slug = 'beautiful-permutation';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3', 'NO SOLUTION', true, 2
FROM problems p WHERE p.slug = 'beautiful-permutation';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4', '2 4 1 3', false, 3
FROM problems p WHERE p.slug = 'beautiful-permutation';

-- Test cases for Number Spiral
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
2 3
1 1
4 2', '8
1
15', true, 1
FROM problems p WHERE p.slug = 'number-spiral';

-- Test cases for Dice Combinations
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3', '4', true, 1
FROM problems p WHERE p.slug = 'dice-combinations';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4', '8', true, 2
FROM problems p WHERE p.slug = 'dice-combinations';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '10', '492', false, 3
FROM problems p WHERE p.slug = 'dice-combinations';

-- Test cases for Coin Combinations
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 9
2 3 5', '8', true, 1
FROM problems p WHERE p.slug = 'coin-combinations';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2 5
1 2', '8', false, 2
FROM problems p WHERE p.slug = 'coin-combinations';

-- Test cases for Grid Paths
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
...
.*.
...', '2', true, 1
FROM problems p WHERE p.slug = 'grid-paths';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2
..
..', '2', true, 2
FROM problems p WHERE p.slug = 'grid-paths';

-- Test cases for Edit Distance
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'LOVE
MOVIE', '2', true, 1
FROM problems p WHERE p.slug = 'edit-distance';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'CAT
CUT', '1', true, 2
FROM problems p WHERE p.slug = 'edit-distance';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'ABC
ABC', '0', false, 3
FROM problems p WHERE p.slug = 'edit-distance';

-- Test cases for Longest Increasing Subsequence
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '8
7 3 5 3 6 2 9 8', '4', true, 1
FROM problems p WHERE p.slug = 'longest-increasing-subsequence';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
1 2 3 4 5', '5', true, 2
FROM problems p WHERE p.slug = 'longest-increasing-subsequence';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
5 4 3 2 1', '1', false, 3
FROM problems p WHERE p.slug = 'longest-increasing-subsequence';

-- Test cases for Shortest Routes
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 4
1 2 5
1 3 10
2 3 2
3 1 7', '0 5 7', true, 1
FROM problems p WHERE p.slug = 'shortest-routes';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 2
1 2 5
1 3 3', '0 5 3 -1', false, 2
FROM problems p WHERE p.slug = 'shortest-routes';
