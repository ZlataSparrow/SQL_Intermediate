
SELECT 
    id,
    response->'data'->'user'->>'name' as user_name
FROM api_responses
WHERE id = 1;
