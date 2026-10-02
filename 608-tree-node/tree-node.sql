SELECT
    t.id,
    CASE
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN child.id IS NULL THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree t
LEFT JOIN Tree child
    ON t.id = child.p_id
GROUP BY t.id, t.p_id
ORDER BY t.id;
