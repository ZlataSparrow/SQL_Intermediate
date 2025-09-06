SELECT
   id,
   response -> 'data' -> 'metadata' ->> 'source' as source
FROM data_sci.api_responses
