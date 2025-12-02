
SELECT 
    id,
    response->'data'->'user'->'name' as user_name
FROM data_sci.api_responses
WHERE id = 1;
