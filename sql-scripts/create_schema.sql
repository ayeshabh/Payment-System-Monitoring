-- Create the transactions table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    status VARCHAR(10) CHECK (status IN ('success', 'failure', 'pending')),
    failure_reason VARCHAR(255)
);
