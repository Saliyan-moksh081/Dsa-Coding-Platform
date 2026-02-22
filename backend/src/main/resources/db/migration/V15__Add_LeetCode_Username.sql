-- Migration to add LeetCode username and sync timestamp to users table
ALTER TABLE users ADD COLUMN leetcode_username VARCHAR(255);
ALTER TABLE users ADD COLUMN last_sync_at TIMESTAMP;
