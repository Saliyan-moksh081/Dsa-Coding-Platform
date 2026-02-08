-- V3__Sample_Test_Cases.sql
-- Insert test cases for sample problems

-- Get problem IDs and insert test cases
-- Two Sum test cases
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '2 7 11 15
9', '0 1', true, 0, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'two-sum';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '3 2 4
6', '1 2', true, 1, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'two-sum';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '3 3
6', '0 1', false, 2, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'two-sum';

-- Reverse String test cases
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, 'hello', 'olleh', true, 0, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'reverse-string';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, 'Hannah', 'hannaH', true, 1, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'reverse-string';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, 'A', 'A', false, 2, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'reverse-string';

-- Longest Substring test cases
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, 'abcabcbb', '3', true, 0, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'longest-substring-without-repeating-characters';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, 'bbbbb', '1', true, 1, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'longest-substring-without-repeating-characters';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, 'pwwkew', '3', false, 2, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'longest-substring-without-repeating-characters';

-- Binary Search test cases
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '-1 0 3 5 9 12
9', '4', true, 0, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'binary-search';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '-1 0 3 5 9 12
2', '-1', true, 1, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'binary-search';

-- Merge Two Sorted Arrays test cases
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '1 2 4
1 3 4', '1 1 2 3 4 4', true, 0, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'merge-two-sorted-arrays';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '1
', '1', true, 1, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'merge-two-sorted-arrays';

-- Maximum Subarray test cases
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '-2 1 -3 4 -1 2 1 -5 4', '6', true, 0, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'maximum-subarray';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '1', '1', true, 1, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'maximum-subarray';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number, created_at)
SELECT gen_random_uuid(), p.id, '5 4 -1 7 8', '23', false, 2, CURRENT_TIMESTAMP
FROM problems p WHERE p.slug = 'maximum-subarray';
