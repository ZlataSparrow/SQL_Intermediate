DROP TABLE data_sci.api_responses;

CREATE TABLE data_sci.api_responses (
    id INTEGER PRIMARY KEY,
    response JSONB
);


INSERT INTO data_sci.api_responses (id, response)
VALUES (
    1,
    '{
        "status": "success",
        "code": 200,
        "data": {
            "user": {
                "id": 123,
                "name": "Jane Doe",
                "email": "jd@example.com"
            },
            "metadata": {
                "timestamp": "2025-01-30T10:30:00Z",
                "source": "user_api"
            }
        }
    }'
);

CREATE INDEX idx_username ON data_sci.api_responses 
((response->'data'->'user'->>'name'));
