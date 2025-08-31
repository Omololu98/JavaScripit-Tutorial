    -- THE TABLES BEEN USED IN THE TENANT DATABASE --

    -- THE TABLES FOR THE HR SYSTEM --

    -- EMPLOYEE MANAGEMENT ---

    create table if not exists employee(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    staff_id varchar(100),
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100),
    role varchar(50),
    staff_status varchar(50),
    passport varchar(255),
    line_manager_id varchar(50),
    sex varchar(50),
    marital_status varchar(50),
    nationality varchar(50),
    religion varchar(50),
    employment_date date,
    current_department varchar(100),
    current_grade varchar(100),
    current_salary decimal(15,2),
    residential_address varchar(150),
    telephone_number varchar(50),
    state_of_origin varchar(50),
    local_government_area varchar(50),
    ethnic_group varchar(50),
    date_of_birth date,
    hobby_1 varchar(100),
    hobby_2 varchar(100),
    hobby_3 varchar(100),
    primary key (id),
    unique(email),
    unique(staff_id),
    index first_name_idx (first_name),
    index last_name_idx (last_name)
    );

    create table if not exists  company_leave_profile(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    name varchar(255),
    gender varchar(255),
    role_details json,
    unique(name),
    primary key (id)
    );

    create table if not exists  employee_certifications(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    certificate_name varchar(255),
    issued_date date,
    expiry_date date,
    staff_id varchar(100),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );


    create table if not exists  employee_dependants(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    surname varchar(255),
    first_name varchar(255),
    middle_name varchar(255),
    address varchar(255),
    phone_number varchar(255),
    relationship varchar(255),
    gender varchar(255),
    date_of_birth date,
    staff_id varchar(100),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists  employee_education(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    institution_name varchar(255),
    address varchar(255),
    qualification varchar(255),
    start_date date,
    end_date date,
    staff_id varchar(255),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists  employee_leave_profile(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    staff_status varchar(255),
    current_leave_application_id varchar(100),
    leave_data json,
    staff_id varchar(255),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists employee_referees(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    first_name varchar(255),
    last_name varchar(255),
    address varchar(255),
    relationship varchar(255),
    job_role varchar(255),
    company_name varchar(255),
    email varchar(255),
    phone_number varchar(255),
    staff_id varchar(255),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists  leave_application(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    leave_application_id varchar(255),
    staff_id varchar(255),
    start_date date,
    resumption_date date,
    leave_type varchar(255),
    notes varchar(255),
    leave_days long,
    created_by varchar(255),
    reviewed_by varchar(255),
    reviewed_date varchar(255),
    review_notes varchar(255),
    approved_by varchar(255),
    approved_date varchar(255),
    approved_notes varchar(255),
    status varchar(255),
    run_count int,
    primary key (id)
    );

    create table if not exists next_of_kin (
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    first_name varchar(255),
    last_name varchar(255),
    middle_name varchar(255),
    title varchar(255),
    relationship varchar(255),
    address varchar(255),
    staff_id varchar(255),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists previous_employment(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    company_name varchar(255),
    position_held varchar(255),
    start_date date,
    end_date date,
    staff_id varchar(255),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );


    create table if not exists professional_memberships(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    membership_name varchar(255),
    membership_number varchar(255),
    staff_id varchar(255),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists time_sheets(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    year varchar(50),
    month varchar(50),
    staff_id varchar(50),
    status varchar(50),
    primary key (id),
    foreign key (staff_id) references employee(staff_id)
    );

    create table if not exists time_sheet_details(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    time_sheets varchar(100),
    day int,
    status varchar(255),
    approved_by varchar(100),
    approved_date date,
    reviewed_by varchar(100),
    reviewed_date date,
    total_hours decimal(10,1),
    primary key (id),
    foreign key (time_sheets) references time_sheets(id)
    );

    create table if not exists time_sheet_activities(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    timesheet_day varchar(100),
    description varchar(100),
    time_in time,
    time_out time,
    section varchar(100),
    overtime_hours decimal(10,1),
    total_hours decimal(10,1),
    primary key(id),
    foreign key (timesheet_day) references time_sheet_details(id)
    );



    create table if not exists time_sheet_comments(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    timesheet_day varchar(255),
    staff_id varchar(100),
    comment varchar(255),
    primary key (id),
    foreign key (timesheet_day) references time_sheet_details(id)
    );

    -- THE TABLES FOR OPERATIONS MANAGEMENT --

    create table if not exists project(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_serial_number varchar(50),
    name varchar(255),
    description varchar(255),
    created_by varchar(100),
    initiated_on date,
    start_date date,
    end_date date,
    invoice_number varchar(255),
    type varchar(255),
    state varchar(50),
    country varchar(50),
    address varchar(100),
    client varchar(255),
    client_contact varchar(255),
    reviewer_id varchar(100),
    review_date date,
    approved_by varchar(100),
    approved_date date,
    ratings decimal(15,2),
    comment varchar(255),
    progress_status varchar(100),
    closed_by varchar(100),
    closed_date date,
    actual_start_date date,
    actual_end_date date,
    primary key (id),
    unique (project_serial_number),
    unique (name)
    );

    create table if not exists team (
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_id varchar(100),
    primary key (id),
    foreign key(project_id) references project(project_serial_number)
    );

    create table if not exists team_members(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    team_id varchar(100),
    staff_id varchar(100),
    staff_full_name varchar(255),
    role varchar(100),
    primary key(id),
    foreign key (team_id) references team(id)
    );

    create table if not exists expense(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    expense_serial_number varchar(100),
    created_by varchar(100),
    summary_details varchar(255),
    reviewed_by varchar(100),
    reviewed_date date,
    approved_by varchar(100),
    approved_date date,
    total_amount decimal(15,2),
    status varchar(100),
    project_id varchar(100),
    comments JSON,
    primary key (id),
    unique(expense_serial_number),
    foreign key (project_id) references project(project_serial_number)
    );

    create table if not exists expense_items(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    expense_id varchar(100),
    quantity int,
    unit_of_measurement varchar(100),
    date date,
    unit_price decimal(15,2),
    net_amount decimal(15,2),
    description varchar(255),
    primary key (id),
    foreign key (expense_id) references expense(expense_serial_number)
    );

    create table if not exists funds_request(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    funds_request_id varchar(100),
    created_by varchar(100),
    reviewed_by varchar(100),
    reviewed_date date,
    approved_date date,
    approved_by varchar(100),
    purpose varchar(100),
    estimated_cost decimal(15,2),
    approved_amount decimal(15,2),
    reviewed_comment varchar(255),
    approved_comment varchar(255),
    status varchar(100),
    project_id varchar(100),
    primary key(id),
    unique(funds_request_id)
    );


    create table if not exists ticket(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_id varchar(100),
    ticket_serial_number varchar(100),
    ticket_description varchar(100),
    started_at date,
    ended_at date,
    created_by varchar(100),
    approved_by varchar(100),
    approved_date date,
    approved_comment varchar(255),
    reviewed_by varchar(100),
    reviewed_date date,
    reviewed_comment varchar(255),
    status varchar(100),
    PRIMARY KEY (id),
    UNIQUE (ticket_serial_number)
    );


    create table if not exists ticket_items(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    ticket_id varchar(100),
    item_number int,
    description varchar(255),
    quantity decimal(15,2),
    unit_of_measurement varchar(100),
    unit_price decimal(15,2),
    discount decimal(5,2),
    net_amount decimal(15,2),
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(ticket_serial_number)
    );


    create table if not exists job_log(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    job_log_id varchar(100),
    title varchar(255),
    invoice_number varchar(255),
    client varchar(255),
    client_contact varchar(255),
    project_type varchar(255),
    country varchar(100),
    started_at date,
    ended_at date,
    project_id varchar(100),
    created_by varchar(100),
    primary key (id),
    unique (job_log_id)
    );

    create table if not exists activities(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    job_log_id varchar(100),
    serial_number int,
    date date,
    start_time time,
    end_time time,
    accumulated_minutes decimal(10,2),
    status varchar(100),
    description varchar(255),
    approved_by varchar(100),
    approved_date date,
    primary key (id),
    foreign key (job_log_id) references job_log(job_log_id)
    );

    create table if not exists task(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    task_serial_id varchar(100),
    task_name varchar(255),
    description varchar(255),
    created_by varchar(100),
    deadline_on date,
    assigned_to varchar(100),
    affected_employee varchar(100),
    review_description varchar(255),
    review_date date,
    rating decimal(5,2),
    status varchar(100),
    project_id varchar(100),
    primary key (id),
    unique(task_serial_id)
    );

    create table if not exists task_feedback(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    feedback_notes varchar(255),
    staff_id varchar(100),
    task_id varchar(100),
    primary key (id),
    foreign key (task_id) references task(task_serial_id)
    );


    create table if not exists delay_logs(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    delay_id varchar(100),
    project_id varchar(100),
    description varchar(255),
    cause varchar(100),
    responsibility varchar(100),
    impact varchar(100),
    start_date date,
    end_date date,
    resolution varchar(255),
    notes varchar(100),
    status varchar(100),
    submitted_by varchar(100),
    open_approvals_name varchar(100),
    open_approvals_date date,
    close_approvals_name varchar(100),
    close_approvals_date date,
    primary key (id),
    unique (delay_id)
    );


    create table if not exists way_bill(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    waybill_id varchar(100),
    drivers_name varchar(100),
    senders_vehicle_number varchar(100),
    waybill_type varchar(100),
    from_location varchar(100),
    to_location varchar(100),
    dispatched_date date,
    trucking_company varchar(255),
    drivers_phone_number varchar(100),
    vehicle_type varchar(100),
    status varchar(100),
    written_by varchar(100),
    approved_by varchar(100),
    approved_date date,
    received_by varchar(100),
    received_date date,
    approval_notes varchar(255),
    primary key (id),
    unique(waybill_id)
    );

    create table if not exists way_bill_goods(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    way_bill_goods_id int,
    equipmentSerialNumber varchar(100),
    name varchar(255),
    quantity_loaded decimal(10,2),
    quantity_received decimal (10,2),
    material_type varchar(100),
    inventory_type varchar(100),
    waybill_id varchar(100),
    primary key (id),
    foreign key (waybill_id) references way_bill(waybill_id)
    );


    create table if not exists project_inventory_purchase(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    inventory_purchase_id varchar(100),
    project_id varchar(100),
    created_by varchar(100),
    approved_by varchar(100),
    approved_date date,
    approval_notes varchar(100),
    treated_by varchar(100),
    treated_notes varchar(100),
    treated_date date,
    status varchar(100),
    primary key (id),
    unique (inventory_purchase_id)
    );


    create table if not exists project_inventory_purchase_items(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_inventory_purchase_id varchar(100),
    serial_number int,
    name varchar(100),
    quantity decimal(10,2),
    unit_of_measurement varchar(100),
    inventory_type varchar(100),
    purchased_date date,
    price decimal(10,2),
    primary key (id),
    foreign key (project_inventory_purchase_id) references project_inventory_purchase(inventory_purchase_id)
    );


    create table if not exists project_machinery_inventory(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_id varchar(100),
    equipment_serial_number varchar(100),
    quantity int,
    primary key (id),
    index project_id_idx (project_id),
    index equipment_serial_number_idx (equipment_serial_number)
    );

    create table if not exists project_non_machinery_inventory(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_id varchar(100),
    inventory_name varchar(100),
    last_added date,
    last_added_quantity decimal(10,2),
    total_quantity decimal(10,2),
    available_quantity decimal(10,2),
    project_alert_level decimal(10,2),
    primary key (id),
    index project_id_idx (project_id),
    index inventory_name_idx (inventory_name)
    );

    create table if not exists project_inventory_log(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    from_location varchar(100),
    to_location varchar(100),
    item_name varchar(255),
    item_type varchar(100),
    change_type varchar(100),
    quantity_change decimal(10,2),
    remaining_quantity decimal(10,2),
    logged_by varchar(255),
    primary key(id),
    index item_name_idx (item_name)
    );

    create table if not exists project_machinery_usage(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    project_id varchar(100),
    machine_name varchar(100),
    serial_number varchar(100),
    usage_minutes decimal(10,2),
    logged_by varchar(100),
    used_by varchar(100),
    date date,
    start_time time,
    end_time time,
    primary key (id)
    );

    create table if not exists project_non_machinery_consumables_usage(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    inventory_name varchar(100),
    date_used date,
    used_by varchar(100),
    logged_by varchar(100),
    project_id varchar(100),
    quantity_used decimal(10,2),
    remaining_quantity decimal(10,2),
    primary key (id)
    );

    create table if not exists project_non_machinery_non_consumables_usage(
      id VARCHAR(255) NOT NULL,
      created_at timestamp DEFAULT NULL,
      modified_at timestamp DEFAULT NULL,
      project_id varchar(100),
      logged_by varchar(100),
      collected_by varchar(100),
      returned_by varchar(100),
      inventory_name varchar(100),
      quantity_collected decimal(10,2),
      quantity_returned decimal(10,2),
      remaining_quantity decimal(10,2),
      date date,
      primary key(id)
    );

    create table if not exists usage_breakdown(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    usage_id varchar(255),
    brand_new decimal(10,2),
    worn decimal(10,2),
    good decimal(10,2),
    damaged decimal(10,2),
    operational decimal(10,2),
    lost decimal(10,2),
    primary key(id),
    foreign key (usage_id) references project_non_machinery_non_consumables_usage(id)
    );

    create table if not exists project_status_chart(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    month varchar(100),
    year int default 0,
    project_not_started int default 0,
    project_ongoing int default 0,
    project_completed int default 0,
    project_closed_out int default 0,
    project_suspended int default 0,
    primary key (id)
    );


    -- REPOSITORY MANAGEMENT--

    create table if not exists document_store(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    name varchar(100),
    document_path varchar(200),
    category varchar(100),
    size varchar(100),
    project_id varchar(100),
    document_type varchar(50),
    primary key (id)
    );


    create table if not exists document_category(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    name varchar(100),
    description varchar(100),
    fileNumbers int default 0,
    primary key(id),
    unique(name)
    );

    -- INVENTORY MANAGEMENT --

    create table if not exists inventory_request(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    inventory_request_serial_number varchar(100),
    requesting_project_id varchar(100),
    created_by varchar(100),
    approved_by varchar(100),
    approved_date datetime,
    approved_notes varchar(100),
    treated_by varchar(100),
    treated_date datetime,
    status varchar(100),
    primary key(id),
    unique(inventory_request_serial_number)
    );

    create table if not exists inventory_request_item(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    serial_number int,
    inventory_type varchar(100),
    inventory_name varchar(100),
    uom varchar(100),
    quantity decimal(10,2),
    priority_level int,
    quantity_approved decimal(10,2),
    action_performed varchar(20),
    inventory_request_serial_number varchar(100),
    primary key (id),
    foreign key (inventory_request_serial_number) references inventory_request (inventory_request_serial_number)
    );


    create table if not exists machine_inventory_preview(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    name varchar(100),
    quantity int,
    alert_level decimal(10,0),
    uom varchar(50),
    created_by varchar(100),
    primary key(id),
    unique(name)
    );

    create table if not exists machine_inventory_detail(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    alias_name varchar(100),
    equipment_name varchar(100),
    equipment_serial_number varchar(100),
    model varchar(100),
    size varchar(100),
    machine_status varchar(100),
    condition_rating varchar(100),
    manufacturer varchar(100),
    current_location varchar(100),
    location_tracker varchar(100),
    purchased_date date,
    usage_hours decimal(10,2),
    max_hours_before_maintenance decimal(10,2),
    maintenance_alert_threshold decimal(10,2),
    hours_before_next_maintenance decimal(10,2),
    last_maintenance_date date,
    created_by varchar(100),
    vendor varchar(100),
    primary key(id),
    unique(equipment_serial_number),
    unique(alias_name)
    );

    create table if not exists non_machinery(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    name varchar(100),
    quantity_added decimal(10,2),
    total_quantity decimal(10,2),
    uom varchar(100),
    non_machinery_type varchar(100),
    created_by varchar(100),
    description varchar(100),
    alert_level decimal(10,2),
    primary key(id),
    unique(name)
    );

    create table if not exists procurement(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    procurement_id varchar(100),
    initiated_total_price decimal(15,2),
    reviewed_total_price decimal(15,2),
    approved_total_price decimal(15,2),
    initiated_by varchar(100),
    reviewed_by varchar(100),
    approved_by varchar(100),
    reviewed_date datetime,
    approved_date datetime,
    review_notes varchar(100),
    approval_notes varchar(100),
    status varchar(100),
    primary key(id),
    unique(procurement_id)

    );

    create table if not exists procurement_items(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    procurement_id varchar(100),
    serial_number int,
    vendor_name varchar(100),
    item_name varchar(100),
    unit_price decimal(15,2),
    unit_of_measurement varchar(50),
    item_priority int,
    quantity_requested decimal(15,2),
    quantity_reviewed decimal(15,2),
    quantity_approved decimal(15,2),
    primary key (id),
    foreign key (procurement_id) references procurement(procurement_id)
    );


    create table if not exists vendor(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    name varchar(100),
    contact_person varchar(100),
    created_by varchar(100),
    email varchar(100),
    phone_number varchar(100),
    address varchar(100),
    notes varchar(100),
    status varchar(100),
    service_description varchar(100),
    reviewed_by varchar(100),
    approved_by varchar(100),
    primary key(id),
    unique(name)
    );

    create table if not exists inventory_log(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    main_inventory varchar(100),
    inventory_type varchar(100),
    inventory_name varchar(100),
    change_type varchar(100),
    quantity decimal(10,2),
    quantity_remaining decimal(10,2),
    employee_id varchar(100),
    destination varchar(100),
    primary key(id)
    );

    create table if not exists inventory_distribution(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    inventory_type varchar(100),
    inventory_name varchar(100),
    quantity decimal(15,2),
    location_id varchar(100),
    location_name varchar(100)
    );

    -- MAINTENANCE MANAGEMENT --

    create table if not exists equipment_certificate(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    equipment_name varchar(100),
    serial_number varchar(100),
    certificate_type varchar(100),
    issue_date date,
    certificate_id varchar(100),
    file_path varchar(100),
    expiration_date date,
    certifying_agency varchar(100),
    approved_by varchar(100),
    primary key(id),
    unique(serial_number)
    );


    create table if not exists maintenance_ticket(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    maintenance_ticket_id varchar(100),
    equipment_name varchar(100),
    equipment_id varchar(100),
    priority int,
    proposed_maintenance_date date,
    affected_user varchar(100),
    maintenance_type varchar(100),
    cost_summary varchar(100),
    total_cost decimal(10,2),
    status varchar(100),
    created_by varchar(100),
    approved_by varchar(100),
    approved_date date,
    approval_notes varchar(100),
    treated_by varchar(100),
    treated_date date,
    closed_by varchar(100),
    closed_date date,
    acknowledgement_comment varchar(100),
    primary key (id),
    unique(maintenance_ticket_id)
    );


    create table if not exists maintenance_issue(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    ticket_id varchar(100),
    serial_number int,
    description varchar(100),
    primary key (id),
    foreign key (ticket_id) references maintenance_ticket(maintenance_ticket_id)
    );


    create table if not exists maintenance_order(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    maintenance_ticket varchar(100),
    order_type_name varchar(100),
    personnel_name varchar(100),
    location varchar(100),
    maintenance_date date,
    order_status varchar(100),
    created_by varchar(100),
    approved_by varchar(100),
    approved_date date,
    approval_notes varchar(100),
    primary key(id),
    foreign key (maintenance_ticket) references maintenance_ticket(maintenance_ticket_id)
    );

    create table if not exists maintenance_logs(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    maintenance_location varchar(100),
    maintenance_date date,
    description_of_maintenance varchar(100),
    personnel_involved varchar(100),
    notes varchar(100),
    status_after_maintenance varchar(100),
    next_scheduled_maintenance decimal(10,2),
    maintenance_ticket_id varchar(100),
    primary key(id)
    );

    create table if not exists maintenance_order_type(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    equipment_name varchar(100),
    maintenance_order_name varchar(100),
    description varchar(100),
    order_list json,
    primary key (id),
    unique(maintenance_order_name)
    );


    -- REQUEST MANAGEMENT --
    create table if not exists request(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    request_serial_number varchar(100),
    initiator_by varchar(100),
    request_date datetime,
    reviewed_by varchar(100),
    review_date datetime,
    approved_by varchar(100),
    approved_date datetime,
    treated_by varchar(100),
    treated_date datetime,
    request_section varchar(50),
    request_action varchar(50),
    request_status varchar(50),
    request_data json,
    review_data json,
    approved_data json,
    treated_data json,
    primary key (id),
    unique(request_serial_number)
    );

    create table if not exists assignment_history(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    request_serial_number varchar(100),
    entity_type varchar(100),
    status varchar(100),
    assigned_from varchar(100),
    assigned_to varchar(100),
    changed_date datetime,
    primary key(id)
    );

    create table if not exists assignment(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    request_serial_number varchar(100),
    entity_type varchar(100),
    currently_assigned_user varchar(100),
    primary key(id)
    );

    create table if not exists request_status(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    request_serial_number varchar(100),
    application_sections varchar(100),
    created_by varchar(100),
    current_status varchar(100),
    primary key (id),
    unique(request_serial_number)
    );

    create table if not exists request_status_history(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    request_id varchar(100),
    staff_id varchar(100),
    action_performed varchar(100),
    primary key (id),
    foreign key (request_id) references request_status(request_serial_number)
    );

alter table request_status
add action_required varchar(100);

alter table project_non_machinery_inventory
rename column last_added to last_added_date;

alter table way_bill_goods
rename column equipmentSerialNumber to equipment_serial_number;
create table if not exists way_bill_discrepancy(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
waybill varchar(50),
item_name varchar(100),
quantity_loaded decimal(15,2),
quantity_received decimal(15,2),
quantity_difference decimal(15,2),
is_reported boolean,
primary key (id),
foreign key (waybill) references way_bill(waybill_id)
);

alter table inventory_log
rename column main_inventory to from_location,
rename column destination to to_location;

alter table way_bill
add received_notes varchar(100);

alter table inventory_request
add result_id json;

create table if not exists general_dashBoard_cards(
      id VARCHAR(255) NOT NULL,
      created_at timestamp DEFAULT NULL,
      modified_at timestamp DEFAULT NULL,
      total_projects int,
      total_inventory int,
      total_employees int,
      primary key (id)
);

alter table project_inventory_purchase_items
add material_type varchar(50);

alter table equipment_certificate
modify column file_path varchar(255);

alter table maintenance_logs
add condition_rating_after_maintenance decimal(10,2);

create table if not exists hoc_data(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    hoc_type varchar(100),
    project_id varchar(100),
    created_by varchar(100),
    treated_by varchar(100),
    treated_date date,
    action_taken varchar(255),
    hoc_details json,
    serial_number bigint,
    index serial_number_idx (serial_number),
    primary key (id)
);

create table if not exists investigation_report(
    id VARCHAR(255) NOT NULL,
    created_at timestamp DEFAULT NULL,
    modified_at timestamp DEFAULT NULL,
    report_id varchar(100),
    project_id varchar(100),
    incident_date date,
    incident_time time,
    incident_description varchar(255),
    involved_parties varchar(255),
    contributing_factors varchar(255),
    root_causes varchar(255),
    recommendations varchar(255),
    created_by varchar(100),
    reviewed_by varchar(100),
    reviewed_date date,
    review_comment varchar(255),
    approved_by varchar(100),
    approved_date date,
    approved_comment varchar(255),
    status varchar(100),
    primary key (id),
    unique (report_id)
);

alter table next_of_kin
add next_of_kin_id varchar(100);

alter table employee_certifications
add certificate_id varchar(100);

alter table employee_dependants
add dependent_id varchar(100);

alter table employee_education
add education_id varchar(100);

alter table employee_referees
add referee_id varchar(100);

alter table previous_employment
add previous_employment_id varchar(100);

alter table professional_memberships
add membership_id varchar(100);
create table if not exists hse_procurement(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
hse_procurement_id varchar(100),
action_type varchar(50),
total_initiated_price decimal(15,2),
total_reviewed_price decimal(15,2),
total_approved_price decimal(15,2),
created_by varchar(100),
reviewed_by varchar(100),
reviewed_date date,
reviewed_comment varchar(255),
approved_by varchar(100),
approved_date date,
approved_comment varchar(255),
primary key (id),
unique (hse_procurement_id)
);


create table if not exists hse_procurement_items(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
hse_procurement varchar(100),
serial_number int,
item_name varchar(100),
priority int,
uom varchar(100),
initial_quantity decimal(15,2),
reviewed_quantity decimal(15,2),
approved_quantity decimal(15,2),
unit_price decimal(15,2),
primary key (id),
foreign key (hse_procurement) references hse_procurement(hse_procurement_id)
);

create table  if not exists hse_inventory(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
item_name varchar(100),
total_quantity decimal(15,2),
last_added_quantity  decimal(15,2),
assign_type varchar(50),
duration int,
duration_type varchar(50),
inventory_threshold decimal(15,2),
uom varchar(100),
image_path varchar(255),
primary key (id),
index item_name_idx (item_name)
);

create table  if not exists hse_inventory_logs(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
from_location varchar(100),
to_location varchar(100),
name varchar(100),
initiated_by varchar(100),
quantity decimal(15,2),
status varchar(100),
primary key (id)
);

create table if not exists hse_project_inventory(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
project_id varchar(100),
quantity decimal(15,2),
item_name varchar(255),
primary key (id)
);

create table if not exists hse_waybill(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
hse_waybill_id varchar(100),
from_location varchar(100),
to_location varchar(100),
driver_name varchar(100),
driver_number varchar(100),
created_by varchar(100),
approved_by varchar(100),
approved_date date,
approved_notes varchar(100),
received_by varchar(100),
received_notes varchar(100),
received_date date,
status varchar(100),
primary key (id),
unique (hse_waybill_id)
);

create table if not exists hse_waybill_items(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
serial_number int,
name varchar(100),
sent_quantity decimal(15,2),
received_quantity decimal(15,2),
hse_waybill varchar(100),
primary key (id),
foreign key (hse_waybill) references hse_waybill(hse_waybill_id)
);

create table if not exists project_hse_request(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
request_id varchar(100),
project_id varchar(100),
created_by varchar(100),
approved_by varchar(100),
approved_date date,
approval_comment varchar(100),
treated_by varchar(100),
treated_date date,
approved_treatment_by varchar(100),
approved_treatment_date date,
approved_treatment_comment varchar(100),
status varchar(100),
primary key (id),
unique (request_id)
);

create table if not exists project_hse_request_items(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
serial_number int,
item_name varchar(100),
priority int,
request_quantity decimal(5,2),
approved_quantity decimal(15,2),
project_hse_request varchar(100),
treatment_status varchar(50),
primary key (id),
foreign key (project_hse_request) references project_hse_request(request_id)
);

create table if not exists hse_assignment(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
assignment_id varchar(100),
created_by varchar(100),
closed_by varchar(100),
closed_date date,
status varchar(50),
assignment_date date,
name_of_collector varchar(100),
role_of_collector varchar(100),
collection_location varchar(100),
primary key (id),
unique (assignment_id)
);

create table if not exists hse_assignment_details(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
material_name varchar(100),
quantity_collected decimal(15,2),
quantity_returned decimal(15,2),
expiration_date date,
assignment_id varchar(100),
primary key (id),
foreign key (assignment_id) references hse_assignment(assignment_id)
);

create table if not exists hse_assignment_logs(
id VARCHAR(255) NOT NULL,
created_at timestamp DEFAULT NULL,
modified_at timestamp DEFAULT NULL,
assignment_id varchar(100),
status varchar(100),
logged_by varchar(100),
name_of_personnel_involved varchar(100),
role_of_personnel_involved varchar(100),
date_registered date,
item_details json,
primary key (id)
);
alter table machine_inventory_preview
add image_path varchar(255);

alter table non_machinery
add image_path varchar(255);

alter table document_category
rename column fileNumbers to file_numbers;

alter table employee_certifications
add certificate_number varchar(100);




