CREATE TABLE data_sci.api_responses (
    id INTEGER PRIMARY KEY,
    response JSON
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


SELECT id, response
FROM data_sci.api_responses
WHERE id = 1;


