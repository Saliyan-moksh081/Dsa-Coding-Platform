"""
Generate SQL migration to import ALL problems from DsaPatterns2026.csv.
Uses ON CONFLICT to upsert - adds missing problems and updates existing ones with topic from CSV.
"""
import csv
import re
import os

def get_slug(url):
    if not url: return None
    url = url.strip()
    match = re.search(r'/problems/([^/]+)/?', url)
    if match:
        return match.group(1)
    if 'leetcode.com' not in url and url:
        return url.lower().replace(' ', '-')
    return None

def get_difficulty(title):
    """Map common patterns to difficulty - default MEDIUM for most LeetCode problems."""
    easy_keywords = ['two sum', 'contains duplicate', 'valid parentheses', 'valid anagram', 
                     'single number', 'binary search', 'reverse linked list', 'linked list cycle',
                     'merge two sorted lists', 'invert binary tree', 'maximum depth', 'same tree',
                     'symmetric tree', 'path sum', 'climbing stairs']
    hard_keywords = ['median of two sorted arrays', 'minimum window substring', 'sliding window maximum',
                     'edit distance', 'word ladder', 'merge k sorted lists', 'word search ii']
    title_lower = title.lower()
    for kw in easy_keywords:
        if kw in title_lower: return 'EASY'
    for kw in hard_keywords:
        if kw in title_lower: return 'HARD'
    return 'MEDIUM'

def get_points(difficulty):
    return {'EASY': 10, 'MEDIUM': 25, 'HARD': 50}.get(difficulty, 25)

csv_path = os.path.join(os.path.dirname(__file__), 'DsaPatterns2026.csv')
sql_path = os.path.join(os.path.dirname(__file__), 'backend/src/main/resources/db/migration/V18__Import_All_CSV_Problems.sql')

with open(csv_path, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    rows = list(reader)

with open(sql_path, 'w', encoding='utf-8') as out:
    out.write("-- Import ALL problems from DsaPatterns2026.csv\n")
    out.write("-- Uses ON CONFLICT to add missing problems and update existing with topic\n\n")
    
    for row in rows:
        topic = row.get('Topic', '').strip()
        cues = row.get('Pattern Cues', '').strip()
        title = row.get('Problem Title', '').strip()
        url = row.get('LeetCode Link', '').strip()
        
        if not title:
            continue
            
        slug = get_slug(url)
        if not slug:
            slug = title.lower().replace(' ', '-').replace("'", "")
            slug = re.sub(r'[^a-zA-Z0-9-]', '', slug)
        
        difficulty = get_difficulty(title)
        points = get_points(difficulty)
        
        title_esc = title.replace("'", "''")
        cues_esc = cues.replace("'", "''") or "Practice this problem on LeetCode"
        topic_esc = topic.replace("'", "''") or "General"
        
        # Use MERGE for H2 compatibility - preserve existing ID when updating to avoid FK violations
        # COALESCE keeps existing ID if slug matches, generates new UUID only for inserts
        sql = f"""MERGE INTO problems (id, title, slug, difficulty, description, points, topic, created_at, updated_at)
KEY(slug)
VALUES (
    COALESCE((SELECT id FROM problems WHERE slug = '{slug}'), gen_random_uuid()),
    '{title_esc}',
    '{slug}',
    '{difficulty}',
    '{cues_esc}',
    {points},
    '{topic_esc}',
    COALESCE((SELECT created_at FROM problems WHERE slug = '{slug}'), CURRENT_TIMESTAMP),
    CURRENT_TIMESTAMP
);

"""
        out.write(sql)

print(f"Generated V18 migration with {len([r for r in rows if r.get('Problem Title', '').strip()])} problems from CSV.")
print(f"Output: {sql_path}")
