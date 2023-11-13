-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-11 14:24:19.725

-- tables
-- Table: company

ALTER DATABASE frafare CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE company (
    id int  NOT NULL AUTO_INCREMENT,
    name varchar(255)  NOT NULL,
    state int  NOT NULL,
    CONSTRAINT company_pk PRIMARY KEY (id)
);

-- Table: config_request_cab
CREATE TABLE config_request_cab (
    id int  NOT NULL AUTO_INCREMENT,
    frequency int  NOT NULL,
    unity_frequency varchar(255)  NOT NULL,
    state int  NOT NULL,
    query_days int  NOT NULL,
    register_user varchar(255)  NOT NULL,
    register_date timestamp  NOT NULL,
    CONSTRAINT config_request_cab_pk PRIMARY KEY (id)
);

-- Table: config_request_det
CREATE TABLE config_request_det (
    id int  NOT NULL AUTO_INCREMENT,
    cab_id int  NOT NULL,
    origin int  NOT NULL,
    destination int  NOT NULL,
    company_id int  NOT NULL,
    register_date timestamp  NOT NULL,
    register_user int  NOT NULL,
    CONSTRAINT config_request_det_pk PRIMARY KEY (id)
);

-- Table: location
CREATE TABLE location (
    id int  NOT NULL AUTO_INCREMENT,
    name varchar(255)  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table: location_company
CREATE TABLE location_company (
    id int  NOT NULL AUTO_INCREMENT,
    name varchar(255)  NOT NULL,
    code varchar(255)  NOT NULL,
    location_id int  NOT NULL,
    company_id int  NOT NULL,
    CONSTRAINT location_company_pk PRIMARY KEY (id)
);

-- Table: process_cab
CREATE TABLE process_cab (
    id int  NOT NULL AUTO_INCREMENT,
    request_cab_id int  NOT NULL,
    start_date timestamp  NOT NULL,
    end_date timestamp  NOT NULL,
    state varchar(255)  NOT NULL,
    CONSTRAINT id PRIMARY KEY (id)
);

-- Table: process_det
CREATE TABLE process_det (
    id int  NOT NULL AUTO_INCREMENT,
    cab_id int  NOT NULL,
    request_det_id int  NOT NULL,
    result varchar(255)  NULL,
    exception text  NULL,
    executed_date timestamp  NOT NULL,
    CONSTRAINT process_det_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: config_request_det_company (table: config_request_det)
ALTER TABLE config_request_det ADD CONSTRAINT config_request_det_company FOREIGN KEY config_request_det_company (company_id)
    REFERENCES company (id);

-- Reference: config_request_det_confi_request_cab (table: config_request_det)
ALTER TABLE config_request_det ADD CONSTRAINT config_request_det_confi_request_cab FOREIGN KEY config_request_det_confi_request_cab (cab_id)
    REFERENCES config_request_cab (id);

-- Reference: config_request_det_location_destination (table: config_request_det)
ALTER TABLE config_request_det ADD CONSTRAINT config_request_det_location_destination FOREIGN KEY config_request_det_location_destination (destination)
    REFERENCES location (id);

-- Reference: config_request_det_location_origin (table: config_request_det)
ALTER TABLE config_request_det ADD CONSTRAINT config_request_det_location_origin FOREIGN KEY config_request_det_location_origin (origin)
    REFERENCES location (id);

-- Reference: location__location_company (table: location_company)
ALTER TABLE location_company ADD CONSTRAINT location__location_company FOREIGN KEY location__location_company (company_id)
    REFERENCES company (id);

-- Reference: location_company_location (table: location_company)
ALTER TABLE location_company ADD CONSTRAINT location_company_location FOREIGN KEY location_company_location (location_id)
    REFERENCES location (id);

-- Reference: process_cab_config_request_cab (table: process_cab)
ALTER TABLE process_cab ADD CONSTRAINT process_cab_config_request_cab FOREIGN KEY process_cab_config_request_cab (request_cab_id)
    REFERENCES config_request_cab (id);

-- Reference: process_det_config_request_det (table: process_det)
ALTER TABLE process_det ADD CONSTRAINT process_det_config_request_det FOREIGN KEY process_det_config_request_det (request_det_id)
    REFERENCES config_request_det (id);

-- Reference: process_det_process_cab (table: process_det)
ALTER TABLE process_det ADD CONSTRAINT process_det_process_cab FOREIGN KEY process_det_process_cab (cab_id)
    REFERENCES process_cab (id);

-- End of file.

