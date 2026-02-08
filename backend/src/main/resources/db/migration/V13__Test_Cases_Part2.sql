-- Test Cases for Trees, Graphs, DP, Greedy & Backtracking

-- Trees
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 9 20 null null 15 7', '3', true, 1 FROM problems p WHERE p.slug = 'max-depth-binary-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '1 2 3
1 2 3', 'true', true, 1 FROM problems p WHERE p.slug = 'same-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 2 7 1 3 6 9', '4 7 2 9 6 3 1', true, 1 FROM problems p WHERE p.slug = 'invert-binary-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '1 2 3', '6', true, 1 FROM problems p WHERE p.slug = 'binary-tree-max-path-sum';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 9 20 null null 15 7', '[[3],[9,20],[15,7]]', true, 1 FROM problems p WHERE p.slug = 'binary-tree-level-order';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '1 2 3 null null 4 5', '1 2 3 null null 4 5', true, 1 FROM problems p WHERE p.slug = 'serialize-deserialize-binary-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 4 5 1 2
4 1 2', 'true', true, 1 FROM problems p WHERE p.slug = 'subtree-of-another-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 9 20 15 7
9 3 15 20 7', '3 9 20 null null 15 7', true, 1 FROM problems p WHERE p.slug = 'construct-binary-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2 1 3', 'true', true, 1 FROM problems p WHERE p.slug = 'validate-bst';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 1 4 null 2
1', '1', true, 1 FROM problems p WHERE p.slug = 'kth-smallest-bst';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6 2 8 0 4 7 9 null null 3 5
2
8', '6', true, 1 FROM problems p WHERE p.slug = 'lca-bst';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
insert apple
search apple
search app', 'true
false', true, 1 FROM problems p WHERE p.slug = 'implement-trie';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
addWord bad
search bad
search .ad', 'true
true', true, 1 FROM problems p WHERE p.slug = 'design-add-search-words';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 4
o a a n
e t a e
i h k r
i f l v
4
oath pea eat rain', 'eat oath', true, 1 FROM problems p WHERE p.slug = 'word-search-ii';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '1 2 3 4 5', '3', true, 1 FROM problems p WHERE p.slug = 'diameter-binary-tree';


-- Graphs
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 5
1 1 1 1 0
1 1 0 1 0
1 1 0 0 0
0 0 0 0 0', '1', true, 1 FROM problems p WHERE p.slug = 'number-of-islands';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '[[2,4],[1,3],[2,4],[1,3]]', '[[2,4],[1,3],[2,4],[1,3]]', true, 1 FROM problems p WHERE p.slug = 'clone-graph';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '8 13
0 0 1 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 1 1 1 0 0 0
0 1 1 0 1 0 0 0 0 0 0 0 0
0 1 0 0 1 1 0 0 1 0 1 0 0
0 1 0 0 1 1 0 0 1 1 1 0 0
0 0 0 0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 1 1 1 0 0 0
0 0 0 0 0 0 0 1 1 0 0 0 0', '6', true, 1 FROM problems p WHERE p.slug = 'max-area-of-island';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5 5
1 2 2 3 5
3 2 3 4 4
2 4 5 3 1
6 7 1 4 5
5 1 1 2 4', '[[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]', true, 1 FROM problems p WHERE p.slug = 'pacific-atlantic-water-flow';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 4
X X X X
X O O X
X X O X
X O X X', 'X X X X
X X X X
X X X X
X O X X', true, 1 FROM problems p WHERE p.slug = 'surrounded-regions';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 3
2 1 1
1 1 0
0 1 1', '4', true, 1 FROM problems p WHERE p.slug = 'rotting-oranges';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2
1
1 0', 'true', true, 1 FROM problems p WHERE p.slug = 'course-schedule';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
4
1 0
2 0
3 1
3 2', '0 1 2 3', true, 1 FROM problems p WHERE p.slug = 'course-schedule-ii';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
4
0 1
0 2
0 3
1 4', 'true', true, 1 FROM problems p WHERE p.slug = 'graph-valid-tree';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
3
0 1
1 2
3 4', '2', true, 1 FROM problems p WHERE p.slug = 'number-connected-components';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
wrt
wrf
er
ett
rftt', 'wertf', true, 1 FROM problems p WHERE p.slug = 'alien-dictionary';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'hit
cog
6
hot
dot
dog
lot
log
cog', '5', true, 1 FROM problems p WHERE p.slug = 'word-ladder';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4 2
3
2 1 1
2 3 1
3 4 1', '2', true, 1 FROM problems p WHERE p.slug = 'network-delay-time';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
5
0 1 100
1 2 100
2 0 100
1 3 600
2 3 200
0 3 1', '700', true, 1 FROM problems p WHERE p.slug = 'cheapest-flights';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
MUC LHR
JFK MUC
SFO SJC
LHR SFO', 'JFK MUC LHR SFO SJC', true, 1 FROM problems p WHERE p.slug = 'reconstruct-itinerary';


-- DP, Greedy, Backtracking
INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2', '2', true, 1 FROM problems p WHERE p.slug = 'climbing-stairs';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
10 15 20', '15', true, 1 FROM problems p WHERE p.slug = 'min-cost-climbing-stairs';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 2 3 1', '4', true, 1 FROM problems p WHERE p.slug = 'house-robber';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
2 3 2', '3', true, 1 FROM problems p WHERE p.slug = 'house-robber-ii';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'babad', 'bab', true, 1 FROM problems p WHERE p.slug = 'longest-palindromic-substring';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'abc', '3', true, 1 FROM problems p WHERE p.slug = 'palindromic-substrings';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '12', '2', true, 1 FROM problems p WHERE p.slug = 'decode-ways';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '11
3
1 2 5', '3', true, 1 FROM problems p WHERE p.slug = 'coin-change';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
2 3 1 1 4', 'true', true, 1 FROM problems p WHERE p.slug = 'jump-game';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '5
2 3 1 1 4', '2', true, 1 FROM problems p WHERE p.slug = 'jump-game-ii';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 5 11 5', 'true', true, 1 FROM problems p WHERE p.slug = 'partition-equal-subset-sum';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3 7', '28', true, 1 FROM problems p WHERE p.slug = 'unique-paths';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, 'abcde
ace', '3', true, 1 FROM problems p WHERE p.slug = 'longest-common-subsequence';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '6
7 1 5 3 6 4', '5', true, 1 FROM problems p WHERE p.slug = 'buy-sell-stock';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 3
2 6
8 10
15 18', '1 6
8 10
15 18', true, 1 FROM problems p WHERE p.slug = 'merge-intervals';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '2
1 3
6 9
2 5', '1 5
6 9', true, 1 FROM problems p WHERE p.slug = 'insert-interval';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '4
1 2
2 3
3 4
1 3', '1', true, 1 FROM problems p WHERE p.slug = 'non-overlapping-intervals';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
1 2 3', '1 2 3
1 3 2
2 1 3
2 3 1
3 1 2
3 2 1', true, 1 FROM problems p WHERE p.slug = 'permutations';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '3
1 2 3', '
1
2
1 2
3
1 3
2 3
1 2 3', true, 1 FROM problems p WHERE p.slug = 'subsets';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '7
4
2 3 6 7', '2 2 3
7', true, 1 FROM problems p WHERE p.slug = 'combination-sum';

INSERT INTO test_cases (id, problem_id, input, expected_output, is_sample, order_number)
SELECT gen_random_uuid(), p.id, '23', 'ad ae af bd be bf cd ce cf', true, 1 FROM problems p WHERE p.slug = 'letter-combinations';
