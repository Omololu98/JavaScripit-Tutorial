-- ==========================================
-- Employee Management
-- ==========================================
CREATE TABLE IF NOT EXISTS employee (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    staff_id VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    role VARCHAR(50),
    staff_status VARCHAR(50),
    passport VARCHAR(255),
    line_manager_id VARCHAR(50),
    sex VARCHAR(50),
    marital_status VARCHAR(50),
    nationality VARCHAR(50),
    religion VARCHAR(50),
    employment_date DATE,
    current_department VARCHAR(100),
    current_grade VARCHAR(100),
    current_salary DECIMAL(15,2),
    residential_address VARCHAR(150),
    telephone_number VARCHAR(50),
    state_of_origin VARCHAR(50),
    local_government_area VARCHAR(50),
    ethnic_group VARCHAR(50),
    date_of_birth DATE,
    hobby_1 VARCHAR(100),
    hobby_2 VARCHAR(100),
    hobby_3 VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (email),
    UNIQUE (staff_id),
    INDEX first_name_idx (first_name),
    INDEX last_name_idx (last_name)
);

CREATE TABLE IF NOT EXISTS company_leave_profile (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(255),
    gender VARCHAR(255),
    role_details JSON,
    UNIQUE (name),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS employee_certifications (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    certificate_id VARCHAR(100),
    certificate_name VARCHAR(255),
    issued_date DATE,
    expiry_date DATE,
    staff_id VARCHAR(100),
    certificate_number VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS employee_dependants (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    dependent_id VARCHAR(100),
    surname VARCHAR(255),
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(255),
    relationship VARCHAR(255),
    gender VARCHAR(255),
    date_of_birth DATE,
    staff_id VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS employee_education (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    education_id VARCHAR(100),
    institution_name VARCHAR(255),
    address VARCHAR(255),
    qualification VARCHAR(255),
    start_date DATE,
    end_date DATE,
    staff_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS employee_leave_profile (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    staff_status VARCHAR(255),
    current_leave_application_id VARCHAR(100),
    leave_data JSON,
    staff_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS employee_referees (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    referee_id VARCHAR(100),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address VARCHAR(255),
    relationship VARCHAR(255),
    job_role VARCHAR(255),
    company_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    staff_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS leave_application (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    leave_application_id VARCHAR(255),
    staff_id VARCHAR(255),
    start_date DATE,
    resumption_date DATE,
    leave_type VARCHAR(255),
    notes VARCHAR(255),
    leave_days BIGINT,
    created_by VARCHAR(255),
    reviewed_by VARCHAR(255),
    reviewed_date VARCHAR(255),
    review_notes VARCHAR(255),
    approved_by VARCHAR(255),
    approved_date VARCHAR(255),
    approved_notes VARCHAR(255),
    status VARCHAR(255),
    run_count INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS next_of_kin (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    next_of_kin_id VARCHAR(100),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    middle_name VARCHAR(255),
    title VARCHAR(255),
    relationship VARCHAR(255),
    address VARCHAR(255),
    staff_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS previous_employment (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    previous_employment_id VARCHAR(100),
    company_name VARCHAR(255),
    position_held VARCHAR(255),
    start_date DATE,
    end_date DATE,
    staff_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS professional_memberships (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    membership_id VARCHAR(100),
    membership_name VARCHAR(255),
    membership_number VARCHAR(255),
    staff_id VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS time_sheets (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    year VARCHAR(50),
    month VARCHAR(50),
    staff_id VARCHAR(50),
    status VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (staff_id) REFERENCES employee(staff_id)
);

CREATE TABLE IF NOT EXISTS time_sheet_details (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    time_sheets VARCHAR(100),
    day INT,
    status VARCHAR(255),
    approved_by VARCHAR(100),
    approved_date DATE,
    reviewed_by VARCHAR(100),
    reviewed_date DATE,
    total_hours DECIMAL(10,1),
    PRIMARY KEY (id),
    FOREIGN KEY (time_sheets) REFERENCES time_sheets(id)
);

CREATE TABLE IF NOT EXISTS time_sheet_activities (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    timesheet_day VARCHAR(100),
    description VARCHAR(100),
    time_in TIME,
    time_out TIME,
    section VARCHAR(100),
    overtime_hours DECIMAL(10,1),
    total_hours DECIMAL(10,1),
    PRIMARY KEY(id),
    FOREIGN KEY (timesheet_day) REFERENCES time_sheet_details(id)
);

CREATE TABLE IF NOT EXISTS time_sheet_comments (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    timesheet_day VARCHAR(255),
    staff_id VARCHAR(100),
    comment VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (timesheet_day) REFERENCES time_sheet_details(id)
);


-- ==========================================
-- Operations Management
-- ==========================================


CREATE TABLE IF NOT EXISTS project (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_serial_number VARCHAR(50),
    name VARCHAR(255),
    description VARCHAR(255),
    created_by VARCHAR(100),
    initiated_on DATE,
    start_date DATE,
    end_date DATE,
    invoice_number VARCHAR(255),
    type VARCHAR(255),
    state VARCHAR(50),
    country VARCHAR(50),
    address VARCHAR(100),
    client VARCHAR(255),
    client_contact VARCHAR(255),
    reviewer_id VARCHAR(100),
    review_date DATE,
    approved_by VARCHAR(100),
    approved_date DATE,
    ratings DECIMAL(15,2),
    comment VARCHAR(255),
    progress_status VARCHAR(100),
    closed_by VARCHAR(100),
    closed_date DATE,
    actual_start_date DATE,
    actual_end_date DATE,
    PRIMARY KEY (id),
    UNIQUE (project_serial_number),
    UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS team (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(project_serial_number)
);

CREATE TABLE IF NOT EXISTS team_members (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    team_id VARCHAR(100),
    staff_id VARCHAR(100),
    staff_full_name VARCHAR(255),
    role VARCHAR(100),
    PRIMARY KEY(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE IF NOT EXISTS expense (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    expense_serial_number VARCHAR(100),
    created_by VARCHAR(100),
    summary_details VARCHAR(255),
    reviewed_by VARCHAR(100),
    reviewed_date DATE,
    approved_by VARCHAR(100),
    approved_date DATE,
    total_amount DECIMAL(15,2),
    status VARCHAR(100),
    project_id VARCHAR(100),
    comments JSON,
    PRIMARY KEY (id),
    UNIQUE (expense_serial_number),
    FOREIGN KEY (project_id) REFERENCES project(project_serial_number)
);

CREATE TABLE IF NOT EXISTS expense_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    expense_id VARCHAR(100),
    quantity INT,
    unit_of_measurement VARCHAR(100),
    date DATE,
    unit_price DECIMAL(15,2),
    net_amount DECIMAL(15,2),
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (expense_id) REFERENCES expense(expense_serial_number)
);

CREATE TABLE IF NOT EXISTS funds_request (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    funds_request_id VARCHAR(100),
    created_by VARCHAR(100),
    reviewed_by VARCHAR(100),
    reviewed_date DATE,
    approved_date DATE,
    approved_by VARCHAR(100),
    purpose VARCHAR(100),
    estimated_cost DECIMAL(15,2),
    approved_amount DECIMAL(15,2),
    reviewed_comment VARCHAR(255),
    approved_comment VARCHAR(255),
    status VARCHAR(100),
    project_id VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE(funds_request_id)
);

CREATE TABLE IF NOT EXISTS ticket (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    ticket_serial_number VARCHAR(100),
    ticket_description VARCHAR(100),
    started_at DATE,
    ended_at DATE,
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    approved_comment VARCHAR(255),
    reviewed_by VARCHAR(100),
    reviewed_date DATE,
    reviewed_comment VARCHAR(255),
    status VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (ticket_serial_number)
);

CREATE TABLE IF NOT EXISTS ticket_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    ticket_id VARCHAR(100),
    item_number INT,
    description VARCHAR(255),
    quantity DECIMAL(15,2),
    unit_of_measurement VARCHAR(100),
    unit_price DECIMAL(15,2),
    discount DECIMAL(5,2),
    net_amount DECIMAL(15,2),
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_serial_number)
);

CREATE TABLE IF NOT EXISTS job_log (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    job_log_id VARCHAR(100),
    title VARCHAR(255),
    invoice_number VARCHAR(255),
    client VARCHAR(255),
    client_contact VARCHAR(255),
    project_type VARCHAR(255),
    country VARCHAR(100),
    started_at DATE,
    ended_at DATE,
    project_id VARCHAR(100),
    created_by VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (job_log_id)
);

CREATE TABLE IF NOT EXISTS activities (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    job_log_id VARCHAR(100),
    serial_number INT,
    date DATE,
    start_time TIME,
    end_time TIME,
    accumulated_minutes DECIMAL(10,2),
    status VARCHAR(100),
    description VARCHAR(255),
    approved_by VARCHAR(100),
    approved_date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (job_log_id) REFERENCES job_log(job_log_id)
);

CREATE TABLE IF NOT EXISTS task (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    task_serial_id VARCHAR(100),
    task_name VARCHAR(255),
    description VARCHAR(255),
    created_by VARCHAR(100),
    deadline_on DATE,
    assigned_to VARCHAR(100),
    affected_employee VARCHAR(100),
    review_description VARCHAR(255),
    review_date DATE,
    rating DECIMAL(5,2),
    status VARCHAR(100),
    project_id VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE(task_serial_id)
);

CREATE TABLE IF NOT EXISTS task_feedback (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    feedback_notes VARCHAR(255),
    staff_id VARCHAR(100),
    task_id VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (task_id) REFERENCES task(task_serial_id)
);

CREATE TABLE IF NOT EXISTS delay_logs (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    delay_id VARCHAR(100),
    project_id VARCHAR(100),
    description VARCHAR(255),
    cause VARCHAR(100),
    responsibility VARCHAR(100),
    impact VARCHAR(100),
    start_date DATE,
    end_date DATE,
    resolution VARCHAR(255),
    notes VARCHAR(100),
    status VARCHAR(100),
    submitted_by VARCHAR(100),
    open_approvals_name VARCHAR(100),
    open_approvals_date DATE,
    close_approvals_name VARCHAR(100),
    close_approvals_date DATE,
    PRIMARY KEY (id),
    UNIQUE (delay_id)
);

CREATE TABLE IF NOT EXISTS way_bill (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    waybill_id VARCHAR(100),
    drivers_name VARCHAR(100),
    senders_vehicle_number VARCHAR(100),
    waybill_type VARCHAR(100),
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    dispatched_date DATE,
    trucking_company VARCHAR(255),
    drivers_phone_number VARCHAR(100),
    vehicle_type VARCHAR(100),
    status VARCHAR(100),
    written_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    received_by VARCHAR(100),
    received_date DATE,
    approval_notes VARCHAR(255),
    received_notes VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE(waybill_id)
);

CREATE TABLE IF NOT EXISTS way_bill_goods (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    way_bill_goods_id INT,
    equipment_serial_number VARCHAR(100),
    name VARCHAR(255),
    quantity_loaded DECIMAL(10,2),
    quantity_received DECIMAL (10,2),
    material_type VARCHAR(100),
    inventory_type VARCHAR(100),
    waybill_id VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (waybill_id) REFERENCES way_bill(waybill_id)
);

CREATE TABLE IF NOT EXISTS way_bill_discrepancy (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    waybill VARCHAR(50),
    item_name VARCHAR(100),
    quantity_loaded DECIMAL(15,2),
    quantity_received DECIMAL(15,2),
    quantity_difference DECIMAL(15,2),
    is_reported BOOLEAN,
    PRIMARY KEY (id),
    FOREIGN KEY (waybill) REFERENCES way_bill(waybill_id)
);

CREATE TABLE IF NOT EXISTS project_inventory_purchase (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    inventory_purchase_id VARCHAR(100),
    project_id VARCHAR(100),
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    approval_notes VARCHAR(100),
    treated_by VARCHAR(100),
    treated_notes VARCHAR(100),
    treated_date DATE,
    status VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (inventory_purchase_id)
);

CREATE TABLE IF NOT EXISTS project_inventory_purchase_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_inventory_purchase_id VARCHAR(100),
    serial_number INT,
    name VARCHAR(100),
    quantity DECIMAL(10,2),
    unit_of_measurement VARCHAR(100),
    inventory_type VARCHAR(100),
    material_type VARCHAR(50),
    purchased_date DATE,
    price DECIMAL(10,2),
    PRIMARY KEY (id),
    FOREIGN KEY (project_inventory_purchase_id) REFERENCES project_inventory_purchase(inventory_purchase_id)
);

CREATE TABLE IF NOT EXISTS project_machinery_inventory (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    equipment_serial_number VARCHAR(100),
    quantity INT,
    PRIMARY KEY (id),
    INDEX project_id_idx (project_id),
    INDEX equipment_serial_number_idx (equipment_serial_number)
);

CREATE TABLE IF NOT EXISTS project_non_machinery_inventory (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    inventory_name VARCHAR(100),
    last_added_date DATE,
    last_added_quantity DECIMAL(10,2),
    total_quantity DECIMAL(10,2),
    available_quantity DECIMAL(10,2),
    project_alert_level DECIMAL(10,2),
    PRIMARY KEY (id),
    INDEX project_id_idx (project_id),
    INDEX inventory_name_idx (inventory_name)
);

CREATE TABLE IF NOT EXISTS project_inventory_log (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    item_name VARCHAR(255),
    item_type VARCHAR(100),
    change_type VARCHAR(100),
    quantity_change DECIMAL(10,2),
    remaining_quantity DECIMAL(10,2),
    logged_by VARCHAR(255),
    PRIMARY KEY(id),
    INDEX item_name_idx (item_name)
);

CREATE TABLE IF NOT EXISTS project_machinery_usage (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    machine_name VARCHAR(100),
    serial_number VARCHAR(100),
    usage_minutes DECIMAL(10,2),
    logged_by VARCHAR(100),
    used_by VARCHAR(100),
    date DATE,
    start_time TIME,
    end_time TIME,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS project_non_machinery_consumables_usage (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    inventory_name VARCHAR(100),
    date_used DATE,
    used_by VARCHAR(100),
    logged_by VARCHAR(100),
    project_id VARCHAR(100),
    quantity_used DECIMAL(10,2),
    remaining_quantity DECIMAL(10,2),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS project_non_machinery_non_consumables_usage (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    logged_by VARCHAR(100),
    collected_by VARCHAR(100),
    returned_by VARCHAR(100),
    inventory_name VARCHAR(100),
    quantity_collected DECIMAL(10,2),
    quantity_returned DECIMAL(10,2),
    remaining_quantity DECIMAL(10,2),
    date DATE,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS usage_breakdown (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    usage_id VARCHAR(255),
    brand_new DECIMAL(10,2),
    worn DECIMAL(10,2),
    good DECIMAL(10,2),
    damaged DECIMAL(10,2),
    operational DECIMAL(10,2),
    lost DECIMAL(10,2),
    PRIMARY KEY(id),
    FOREIGN KEY (usage_id) REFERENCES project_non_machinery_non_consumables_usage(id)
);

CREATE TABLE IF NOT EXISTS project_status_chart (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    month VARCHAR(100),
    year INT DEFAULT 0,
    project_not_started INT DEFAULT 0,
    project_ongoing INT DEFAULT 0,
    project_completed INT DEFAULT 0,
    project_closed_out INT DEFAULT 0,
    project_suspended INT DEFAULT 0,
    PRIMARY KEY (id)
);

---

## Repository Management Tables

CREATE TABLE IF NOT EXISTS document_store (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(100),
    document_path VARCHAR(200),
    category VARCHAR(100),
    size VARCHAR(100),
    project_id VARCHAR(100),
    document_type VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS document_category (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(100),
    description VARCHAR(100),
    file_numbers INT DEFAULT 0,
    PRIMARY KEY(id),
    UNIQUE(name)
);

-- ==========================================
-- Inventory Management
-- ==========================================

CREATE TABLE IF NOT EXISTS inventory_request (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    inventory_request_serial_number VARCHAR(100),
    requesting_project_id VARCHAR(100),
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATETIME,
    approved_notes VARCHAR(100),
    treated_by VARCHAR(100),
    treated_date DATETIME,
    status VARCHAR(100),
    result_id JSON,
    PRIMARY KEY(id),
    UNIQUE(inventory_request_serial_number)
);

CREATE TABLE IF NOT EXISTS inventory_request_item (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    serial_number INT,
    inventory_type VARCHAR(100),
    inventory_name VARCHAR(100),
    uom VARCHAR(100),
    quantity DECIMAL(10,2),
    priority_level INT,
    quantity_approved DECIMAL(10,2),
    action_performed VARCHAR(20),
    inventory_request_serial_number VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (inventory_request_serial_number) REFERENCES inventory_request (inventory_request_serial_number)
);

CREATE TABLE IF NOT EXISTS machine_inventory_preview (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(100),
    quantity INT,
    alert_level DECIMAL(10,0),
    uom VARCHAR(50),
    created_by VARCHAR(100),
    image_path VARCHAR(255),
    PRIMARY KEY(id),
    UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS machine_inventory_detail (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    alias_name VARCHAR(100),
    equipment_name VARCHAR(100),
    equipment_serial_number VARCHAR(100),
    model VARCHAR(100),
    size VARCHAR(100),
    machine_status VARCHAR(100),
    condition_rating VARCHAR(100),
    manufacturer VARCHAR(100),
    current_location VARCHAR(100),
    location_tracker VARCHAR(100),
    purchased_date DATE,
    usage_hours DECIMAL(10,2),
    max_hours_before_maintenance DECIMAL(10,2),
    maintenance_alert_threshold DECIMAL(10,2),
    hours_before_next_maintenance DECIMAL(10,2),
    last_maintenance_date DATE,
    created_by VARCHAR(100),
    vendor VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE(equipment_serial_number),
    UNIQUE(alias_name)
);

CREATE TABLE IF NOT EXISTS non_machinery (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(100),
    quantity_added DECIMAL(10,2),
    total_quantity DECIMAL(10,2),
    uom VARCHAR(100),
    non_machinery_type VARCHAR(100),
    created_by VARCHAR(100),
    description VARCHAR(100),
    alert_level DECIMAL(10,2),
    image_path VARCHAR(255),
    PRIMARY KEY(id),
    UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS procurement (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    procurement_id VARCHAR(100),
    initiated_total_price DECIMAL(15,2),
    reviewed_total_price DECIMAL(15,2),
    approved_total_price DECIMAL(15,2),
    initiated_by VARCHAR(100),
    reviewed_by VARCHAR(100),
    approved_by VARCHAR(100),
    reviewed_date DATETIME,
    approved_date DATETIME,
    review_notes VARCHAR(100),
    approval_notes VARCHAR(100),
    status VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE(procurement_id)
);

CREATE TABLE IF NOT EXISTS procurement_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    procurement_id VARCHAR(100),
    serial_number INT,
    vendor_name VARCHAR(100),
    item_name VARCHAR(100),
    unit_price DECIMAL(15,2),
    unit_of_measurement VARCHAR(50),
    item_priority INT,
    quantity_requested DECIMAL(15,2),
    quantity_reviewed DECIMAL(15,2),
    quantity_approved DECIMAL(15,2),
    PRIMARY KEY (id),
    FOREIGN KEY (procurement_id) REFERENCES procurement(procurement_id)
);

CREATE TABLE IF NOT EXISTS vendor (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    name VARCHAR(100),
    contact_person VARCHAR(100),
    created_by VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(100),
    address VARCHAR(100),
    notes VARCHAR(100),
    status VARCHAR(100),
    service_description VARCHAR(100),
    reviewed_by VARCHAR(100),
    approved_by VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS inventory_log (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    inventory_type VARCHAR(100),
    inventory_name VARCHAR(100),
    change_type VARCHAR(100),
    quantity DECIMAL(10,2),
    quantity_remaining DECIMAL(10,2),
    employee_id VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS inventory_distribution (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    inventory_type VARCHAR(100),
    inventory_name VARCHAR(100),
    quantity DECIMAL(15,2),
    location_id VARCHAR(100),
    location_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS general_dashboard_cards (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    total_projects INT,
    total_inventory INT,
    total_employees INT,
    PRIMARY KEY (id)
);

-- ==========================================
-- Maintenance Management
-- ==========================================


CREATE TABLE IF NOT EXISTS equipment_certificate (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    equipment_name VARCHAR(100),
    serial_number VARCHAR(100),
    certificate_type VARCHAR(100),
    issue_date DATE,
    certificate_id VARCHAR(100),
    file_path VARCHAR(255),
    expiration_date DATE,
    certifying_agency VARCHAR(100),
    approved_by VARCHAR(100),
    PRIMARY KEY(id),
    UNIQUE(serial_number)
);

CREATE TABLE IF NOT EXISTS maintenance_ticket (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    maintenance_ticket_id VARCHAR(100),
    equipment_name VARCHAR(100),
    equipment_id VARCHAR(100),
    priority INT,
    proposed_maintenance_date DATE,
    affected_user VARCHAR(100),
    maintenance_type VARCHAR(100),
    cost_summary VARCHAR(100),
    total_cost DECIMAL(10,2),
    status VARCHAR(100),
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    approval_notes VARCHAR(100),
    treated_by VARCHAR(100),
    treated_date DATE,
    closed_by VARCHAR(100),
    closed_date DATE,
    acknowledgement_comment VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE(maintenance_ticket_id)
);

CREATE TABLE IF NOT EXISTS maintenance_issue (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    ticket_id VARCHAR(100),
    serial_number INT,
    description VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES maintenance_ticket(maintenance_ticket_id)
);

CREATE TABLE IF NOT EXISTS maintenance_order (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    maintenance_ticket VARCHAR(100),
    order_type_name VARCHAR(100),
    personnel_name VARCHAR(100),
    location VARCHAR(100),
    maintenance_date DATE,
    order_status VARCHAR(100),
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    approval_notes VARCHAR(100),
    PRIMARY KEY(id),
    FOREIGN KEY (maintenance_ticket) REFERENCES maintenance_ticket(maintenance_ticket_id)
);

CREATE TABLE IF NOT EXISTS maintenance_logs (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    maintenance_location VARCHAR(100),
    maintenance_date DATE,
    description_of_maintenance VARCHAR(100),
    personnel_involved VARCHAR(100),
    notes VARCHAR(100),
    status_after_maintenance VARCHAR(100),
    next_scheduled_maintenance DECIMAL(10,2),
    maintenance_ticket_id VARCHAR(100),
    condition_rating_after_maintenance DECIMAL(10,2),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS maintenance_order_type (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    equipment_name VARCHAR(100),
    maintenance_order_name VARCHAR(100),
    description VARCHAR(100),
    order_list JSON,
    PRIMARY KEY (id),
    UNIQUE(maintenance_order_name)
);

-- ==========================================
-- Request Management
-- ==========================================


CREATE TABLE IF NOT EXISTS request (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    request_serial_number VARCHAR(100),
    initiator_by VARCHAR(100),
    request_date DATETIME,
    reviewed_by VARCHAR(100),
    review_date DATETIME,
    approved_by VARCHAR(100),
    approved_date DATETIME,
    treated_by VARCHAR(100),
    treated_date DATETIME,
    request_section VARCHAR(50),
    request_action VARCHAR(50),
    request_status VARCHAR(50),
    request_data JSON,
    review_data JSON,
    approved_data JSON,
    treated_data JSON,
    PRIMARY KEY (id),
    UNIQUE(request_serial_number)
);

CREATE TABLE IF NOT EXISTS assignment_history (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    request_serial_number VARCHAR(100),
    entity_type VARCHAR(100),
    status VARCHAR(100),
    assigned_from VARCHAR(100),
    assigned_to VARCHAR(100),
    changed_date DATETIME,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS assignment (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    request_serial_number VARCHAR(100),
    entity_type VARCHAR(100),
    currently_assigned_user VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS request_status (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    request_serial_number VARCHAR(100),
    application_sections VARCHAR(100),
    created_by VARCHAR(100),
    current_status VARCHAR(100),
    action_required VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE(request_serial_number)
);

CREATE TABLE IF NOT EXISTS request_status_history (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    request_id VARCHAR(100),
    staff_id VARCHAR(100),
    action_performed VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (request_id) REFERENCES request_status(request_serial_number)
);

-- ==========================================
-- HSE Management
-- ==========================================

CREATE TABLE IF NOT EXISTS hoc_data (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    hoc_type VARCHAR(100),
    project_id VARCHAR(100),
    created_by VARCHAR(100),
    treated_by VARCHAR(100),
    treated_date DATE,
    action_taken VARCHAR(255),
    hoc_details JSON,
    serial_number BIGINT,
    INDEX serial_number_idx (serial_number),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS investigation_report (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    report_id VARCHAR(100),
    project_id VARCHAR(100),
    incident_date DATE,
    incident_time TIME,
    incident_description VARCHAR(255),
    involved_parties VARCHAR(255),
    contributing_factors VARCHAR(255),
    root_causes VARCHAR(255),
    recommendations VARCHAR(255),
    created_by VARCHAR(100),
    reviewed_by VARCHAR(100),
    reviewed_date DATE,
    review_comment VARCHAR(255),
    approved_by VARCHAR(100),
    approved_date DATE,
    approved_comment VARCHAR(255),
    status VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (report_id)
);

CREATE TABLE IF NOT EXISTS hse_procurement (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    hse_procurement_id VARCHAR(100),
    action_type VARCHAR(50),
    total_initiated_price DECIMAL(15,2),
    total_reviewed_price DECIMAL(15,2),
    total_approved_price DECIMAL(15,2),
    created_by VARCHAR(100),
    reviewed_by VARCHAR(100),
    reviewed_date DATE,
    reviewed_comment VARCHAR(255),
    approved_by VARCHAR(100),
    approved_date DATE,
    approved_comment VARCHAR(255),
    PRIMARY KEY (id),
    UNIQUE (hse_procurement_id)
);

CREATE TABLE IF NOT EXISTS hse_procurement_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    hse_procurement VARCHAR(100),
    serial_number INT,
    item_name VARCHAR(100),
    priority INT,
    uom VARCHAR(100),
    initial_quantity DECIMAL(15,2),
    reviewed_quantity DECIMAL(15,2),
    approved_quantity DECIMAL(15,2),
    unit_price DECIMAL(15,2),
    PRIMARY KEY (id),
    FOREIGN KEY (hse_procurement) REFERENCES hse_procurement(hse_procurement_id)
);

CREATE TABLE IF NOT EXISTS hse_inventory (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    item_name VARCHAR(100),
    total_quantity DECIMAL(15,2),
    last_added_quantity DECIMAL(15,2),
    assign_type VARCHAR(50),
    duration INT,
    duration_type VARCHAR(50),
    inventory_threshold DECIMAL(15,2),
    uom VARCHAR(100),
    image_path VARCHAR(255),
    PRIMARY KEY (id),
    INDEX item_name_idx (item_name)
);

CREATE TABLE IF NOT EXISTS hse_inventory_logs (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    name VARCHAR(100),
    initiated_by VARCHAR(100),
    quantity DECIMAL(15,2),
    status VARCHAR(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS hse_project_inventory (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    project_id VARCHAR(100),
    quantity DECIMAL(15,2),
    item_name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS hse_waybill (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    hse_waybill_id VARCHAR(100),
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    driver_name VARCHAR(100),
    driver_number VARCHAR(100),
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    approved_notes VARCHAR(100),
    received_by VARCHAR(100),
    received_notes VARCHAR(100),
    received_date DATE,
    status VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (hse_waybill_id)
);

CREATE TABLE IF NOT EXISTS hse_waybill_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    serial_number INT,
    name VARCHAR(100),
    sent_quantity DECIMAL(15,2),
    received_quantity DECIMAL(15,2),
    hse_waybill VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (hse_waybill) REFERENCES hse_waybill(hse_waybill_id)
);

CREATE TABLE IF NOT EXISTS project_hse_request (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    request_id VARCHAR(100),
    project_id VARCHAR(100),
    created_by VARCHAR(100),
    approved_by VARCHAR(100),
    approved_date DATE,
    approval_comment VARCHAR(100),
    treated_by VARCHAR(100),
    treated_date DATE,
    approved_treatment_by VARCHAR(100),
    approved_treatment_date DATE,
    approved_treatment_comment VARCHAR(100),
    status VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (request_id)
);

CREATE TABLE IF NOT EXISTS project_hse_request_items (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    serial_number INT,
    item_name VARCHAR(100),
    priority INT,
    request_quantity DECIMAL(5,2),
    approved_quantity DECIMAL(15,2),
    project_hse_request VARCHAR(100),
    treatment_status VARCHAR(50),
    PRIMARY KEY (id),
    FOREIGN KEY (project_hse_request) REFERENCES project_hse_request(request_id)
);

CREATE TABLE IF NOT EXISTS hse_assignment (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    assignment_id VARCHAR(100),
    created_by VARCHAR(100),
    closed_by VARCHAR(100),
    closed_date DATE,
    status VARCHAR(50),
    assignment_date DATE,
    name_of_collector VARCHAR(100),
    role_of_collector VARCHAR(100),
    collection_location VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE (assignment_id)
);

CREATE TABLE IF NOT EXISTS hse_assignment_details (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    material_name VARCHAR(100),
    quantity_collected DECIMAL(15,2),
    quantity_returned DECIMAL(15,2),
    expiration_date DATE,
    assignment_id VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (assignment_id) REFERENCES hse_assignment(assignment_id)
);

CREATE TABLE IF NOT EXISTS hse_assignment_logs (
    id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NULL,
    modified_at TIMESTAMP DEFAULT NULL,
    assignment_id VARCHAR(100),
    status VARCHAR(100),
    logged_by VARCHAR(100),
    name_of_personnel_involved VARCHAR(100),
    role_of_personnel_involved VARCHAR(100),
    date_registered DATE,
    item_details JSON,
    PRIMARY KEY (id)
);