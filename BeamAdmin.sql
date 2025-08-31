-- ==========================================
-- Clean up (drop old tables if they exist)
-- ==========================================
DROP TABLE IF EXISTS subscription_history;
DROP TABLE IF EXISTS subscription_payment;
DROP TABLE IF EXISTS payment_history;
DROP TABLE IF EXISTS role_heirachy;
DROP TABLE IF EXISTS _users;
DROP TABLE IF EXISTS company;

-- ==========================================
-- Company
-- ==========================================
CREATE TABLE IF NOT EXISTS company (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(255) DEFAULT NULL,
    industry VARCHAR(255) DEFAULT NULL,
    address VARCHAR(255) DEFAULT NULL,
    contact_number VARCHAR(255) DEFAULT NULL,
    contact_email VARCHAR(255),
    tenant_id VARCHAR(50),
    website_url VARCHAR(255) DEFAULT NULL,
    established_on DATE DEFAULT NULL,
    logo_url VARCHAR(255) DEFAULT NULL,
    database_name VARCHAR(255) DEFAULT NULL,
    id_generation BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id),
    UNIQUE (name),
    UNIQUE (email),
    UNIQUE (tenant_id),
    INDEX name_idx (name)
);


-- ==========================================
-- Users
-- ==========================================
CREATE TABLE IF NOT EXISTS beam_user (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    email VARCHAR(255),
    password VARCHAR(255),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    is_first_login BOOLEAN DEFAULT TRUE,
    jwt_version VARCHAR(20) DEFAULT 'V1',
    last_logged_in TIMESTAMP,
    company_id VARCHAR(50),
    role VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(tenant_id),
    INDEX email_idx (email),
    INDEX first_name_idx (first_name),
    INDEX last_name_idx (last_name)
);


-- ==========================================
-- Role Hierarchy
-- ==========================================
CREATE TABLE IF NOT EXISTS role_heirachy (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    role_name VARCHAR(100),
    parent_role VARCHAR(100),
    PRIMARY KEY (id)
);

-- Seed roles
INSERT INTO role_heirachy (id, role_name, parent_role) VALUES
(1,'SUPER_ADMIN_3',NULL),
(2,'SUPER_ADMIN_2','SUPER_ADMIN_3'),
(3,'SUPER_ADMIN_1','SUPER_ADMIN_2'),
(4,'MANAGING_DIRECTOR','SUPER_ADMIN_1'),
(5,'OPERATIONS_MANAGER','MANAGING_DIRECTOR'),
(6,'PROJECT_MANAGER','OPERATIONS_MANAGER'),
(7,'PROCUREMENT_MANAGER','MANAGING_DIRECTOR'),
(8,'ENGINEER_1','PROJECT_MANAGER'),
(9,'ACCOUNTANT_1','MANAGING_DIRECTOR'),
(10,'HR_MANAGER','MANAGING_DIRECTOR'),
(11,'PROCUREMENT_OFFICER_2','PROCUREMENT_OFFICER_1'),
(12,'PROCUREMENT_OFFICER_1','PROCUREMENT_MANAGER'),
(13,'MAINTENANCE_MANAGER','MANAGING_DIRECTOR'),
(14,'MAINTENANCE_OFFICER','MAINTENANCE_MANAGER'),
(15,'HSE_MANAGER','OPERATIONS_MANAGER'),
(16,'HSE_OFFICER_1','HSE_MANAGER');


-- ==========================================
-- Comany Subscription Info Details
-- ==========================================
CREATE TABLE IF NOT EXISTS company_subscription_info (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    company_id VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    plan_type VARCHAR(50),
    status VARCHAR(50),
    PRIMARY KEY (id)
);


-- ==========================================
-- Subscription Payment
-- ==========================================
CREATE TABLE IF NOT EXISTS subscription_payment (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    company_name VARCHAR(100),
    company_email VARCHAR(100),
    admin_name VARCHAR(100),
    admin_email VARCHAR(100),
    admin_phone_number VARCHAR(100),
    is_active BOOLEAN,
    PRIMARY KEY (id)
);

-- ==========================================
-- Subscription History
-- ==========================================
CREATE TABLE IF NOT EXISTS subscription_history (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    amount DECIMAL(15,2),
    subscription_type VARCHAR(100),
    payment_reference VARCHAR(100),
    subscription_status VARCHAR(100),
    subscription_payment VARCHAR(100),
    proposed_start_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (subscription_payment) REFERENCES subscription_payment(id)
);

-- ==========================================
-- Payment History
-- ==========================================
CREATE TABLE IF NOT EXISTS payment_history (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    auth_url VARCHAR(255),
    reference VARCHAR(255),
    transaction_status VARCHAR(255),
    paid_at TIMESTAMP,
    currency VARCHAR(50),
    channel VARCHAR(50),
    admin_email VARCHAR(255),
    company_name VARCHAR(255),
    amount VARCHAR(255),
    PRIMARY KEY (id),
    UNIQUE (reference)
);

-- ==========================================
-- Compnay Subscription History
-- ==========================================
CREATE TABLE company_subscription_history (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    company_id VARCHAR(100) NOT NULL,
    company_name VARCHAR(255),
    reference VARCHAR(100) NOT NULL,
    gateway_reference VARCHAR(100),
    status VARCHAR(50),
    email VARCHAR(150),
    amount DECIMAL(19, 2) NOT NULL,
    subscription_type VARCHAR(50) NOT NULL,
    payment_gateway VARCHAR(50) NOT NULL
);
