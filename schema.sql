-- ======================================
-- SCHEMA: Projekt edukacyjny SQL
-- Temat: Analiza transakcji i subskrypcji
-- Baza: MySQL
-- ======================================

-- Stworzenie bazy danych
CREATE DATABASE IF NOT EXISTS transactions_db;

-- Uzycie bazy danych
USE transactions_db; 

-- Tworzenie tabeli z klientami
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(50),
    signup_date DATE,
    customer_type VARCHAR(20) -- np. 'individual' albo 'business'
);

-- Tworzenie tabeli z subskrypcjami
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    plan VARCHAR(20), -- np. 'Basic', 'Premium'
    status VARCHAR(20), -- 'active' albo 'cancelled'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Tworzenie tabeli z transakcjami
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    date DATE,
    amount DECIMAL(10,2),
    payment_type VARCHAR(20), -- 'card', 'online', 'subscription'
    status VARCHAR(20), -- 'success' albo 'declined'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ======================================
-- PRZYKŁADOWE DANE
-- ======================================

-- Wstawianie klientów
INSERT INTO customers (country, signup_date, customer_type) VALUES
('Poland', '2022-01-15', 'individual'),
('Germany', '2022-03-10', 'business'),
('Spain', '2022-05-22', 'individual'),
('UK', '2023-01-10', 'business');

-- Wstawianie subskrypcji
INSERT INTO subscriptions (customer_id, plan, status) VALUES
(1, 'Basic', 'active'),
(2, 'Premium', 'active'),
(3, 'Basic', 'cancelled'),
(4, 'Premium', 'active');

-- Wstawianie transakcji
INSERT INTO transactions (customer_id, date, amount, payment_type, status) VALUES
(1, '2023-06-01', 120.50, 'card', 'success'),
(2, '2023-06-05', 89.99, 'online', 'success'),
(3, '2023-06-07', 200.00, 'subscription', 'declined'),
(4, '2023-07-01', 49.99, 'card', 'success'),
(1, '2023-07-10', 300.00, 'subscription', 'success');
