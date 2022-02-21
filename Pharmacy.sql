create table employee(
    emp_id number(10) not null,
    place_id number(10) not null,
    name varchar2(20) not null,
    shift_start timestamp not null,
    shift_end timestamp not null,
    hiring_date date not null, 
    retirement_date date,
    gender varchar2(7) check(gender='male' or gender='female'),/*subsetting crittaira*/
    permission varchar2(20),
    constraint pk_emp primary key (emp_id)
);
create table place(
    place_id number(10) not null,
    name varchar2(30) not null,
    address varchar2(30) not null,
    constraint pk_place primary key (place_id));

alter table EMPLOYEE
add constraint fk_employee foreign key(place_id) references place(place_id)


create table manager(
    manager_id number(10) not null,
    emp_id number(10) not null,
    date_became date not null,
    date_end date not null,
    constraint pk_manager primary key (manager_id)
);

alter table MANAGER
add constraint fk_manager foreign key(emp_id) references employee(emp_id)

create table supervisor(
    super_id number(10) not null,
    emp_id number(10) not null,
    date_became date not null,
    date_end date not null,
    constraint pk_super primary key (super_id)
);

alter table supervisor
add constraint fk_super foreign key (emp_id) references employee(emp_id)

create table stock(
    stock_id number(10) not null,
    place_id number(10) not null,
    constraint pk_stock primary key (stock_id)
);

alter table stock
add constraint fk_stock foreign key(place_id) references place(place_id)

create table pharmacy(
    pharma_id number(10) not null,
    place_id number(10) not null,
    constraint pk_pharma primary key (pharma_id)
);

alter table pharmacy
add constraint fk_pharma foreign key(place_id) references place(place_id)

create table login(
    user_id number(10) not null,
    emp_id number(10) not null,
    password number (8) check(password >= 8),
    constraint pk_login primary key (user_id)
)

alter table LOGIN
add user_name varchar2(20) not null

alter table login
add constraint fk_login foreign key (emp_id) references employee (emp_id)

alter table PLACE
add manager_id number(10) not null
add super_id number(10) not null

alter table place
add constraint fk_mananger foreign key(manager_id) references manager(manager_id)

alter table place
add constraint fk_supervisor foreign key(super_id) references supervisor(super_id)

create table contact_number(
    con_number varchar2(15) not null,
    emp_id number(10) not null,
    constraint pk_contact_number primary key (con_number) 
)

alter table contact_number
add constraint fk_con_number foreign key(emp_id) references employee(emp_id)

alter table contact_number
add supplier_id number(10) not null
add doctor_id number(10) not null
add patient_id number(10) not null;

create table drugs(
    trade_name varchar2(30) not null,
    manufacturer varchar2(30) not null,
    generic_name varchar2(30) not null,
    price number(20) not null,
    expire_date date not null,
    mian_discount varchar2(10),
    extra_discout varchar2(10),
    bouns varchar2(10),
    constraint pk_drug primary key (trade_name)
);

create table doctor(
    doctor_id number(10) not null,
    doc_name varchar2(20) not null,
    experience varchar2(20),
    Speciality varchar2(20),
    constraint pk_doctor primary key (doctor_id)
)

create table patient(
    patient_id number(10) not null,
    patient_name varchar2(20) not null,
    gender varchar2(7) check(gender='male' or gender='female'),/*subsetting crittaira*/
    address varchar2(30),
    birthdate date,
    constraint pk_patient primary key (patient_id)
)


create table supplier(
    supplier_id number(10) not null,
    supp_name varchar2(30) not null,
    address varchar2(30) not null,
    constraint pk_supplier primary key (supplier_id) 
)

alter table contact_number
add constraint fk_contact_number_doctor foreign key(doctor_id) references doctor(doctor_id)
add constraint fk_contact_number_patient_id foreign key(patient_id) references patient(patient_id)
add constraint fk_contact_number_supp foreign key(supplier_id) references supplier(supplier_id)


create table storage(
    storage_id number(10) primary key,
    place_id number(10) not null,
    storage_date date not null,
    constraint fk1 foreign key(place_id) references place(place_id)
);


create table storage_line(
    storage_id number(10),
    trade_name varchar2(30) not null,
    quantity number(10) not null,
    constraint pk1 primary key(storage_id,trade_name),
    constraint fk_storage foreign key(storage_id) references storage(storage_id),
    constraint fk_trade_name foreign key(trade_name) references drugs(trade_name)
);


create table takes(
    takes_id number(10) primary key,
    pharma_id number(10) not null,
    stock_id number(10) not null,
    takes_date date not null,
    constraint fk_pharmacy foreign key(pharma_id) references pharmacy(pharma_id),
    constraint fk_stock_2 foreign key(stock_id) references STOCK(stock_id)
);

create table takes_line(
    takes_id number(10),
    trade_name varchar2(30) not null,
    quantity number(10) not null,
    constraint pk_p primary key(takes_id,trade_name),
    constraint fk_trade foreign key(trade_name) references drugs(trade_name),
    constraint fk_takes_id foreign key(takes_id) references takes(takes_id)
);



Create Table Orders(
    ORDER_NUM int,
    STOCK_ID int not null,
    supplier_id int not null,
    order_date TIMESTAMP not null,
    constraint Order_PK PRIMARY KEY (ORDER_NUM),
    CONSTRAINT ORDER_STOCK FOREIGN KEY (stock_id) REFERENCES STOCK(stock_id),
    CONSTRAINT ORDER_SUPPLIER FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
)

Create Table Order_Line(
    ORDER_NUM int NOT NULL,
    trade_name varchar2(30) NOT NULL ,
    QUANTITY int NOT NULL,
    constraint Orders_order_line foreign key (ORDER_NUM) references Orders(ORDER_NUM),
    constraint drugs_Order_Line foreign key (trade_name) references drugs(trade_name),
    constraint Order_Line_PK primary key (ORDER_NUM,trade_name)
);

CREATE TABLE INVOCE(
    invoce_NUM INT ,
    pharma_id INT NOT NULL,
    patient_id INT NOT NULL,
    emp_id INT NOT NULL,
    PAYMENT VARCHAR(20) check(PAYMENT='Cash' or PAYMENT='Later'),/*subsetting crittaira*/ 
    INVOCE_DATE TIMESTAMP NOT NULL,
    CONSTRAINT INVOCE_PK PRIMARY KEY (invoce_NUM),
    CONSTRAINT INVOCE_pharmacy FOREIGN KEY (pharma_id) REFERENCES pharmacy(pharma_id),
    CONSTRAINT INVOCE_patient FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    CONSTRAINT INVOCE_employee FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE INVOCE_LINE(
    invoce_NUM INT NOT NULL,
    trade_name varchar2(30) NOT NULL,
    QUANTITY INT NOT NULL,
    CONSTRAINT INVOCE_INVOCE_LINE FOREIGN KEY (invoce_NUM) REFERENCES INVOCE(invoce_NUM),
    CONSTRAINT drugs FOREIGN KEY (trade_name) REFERENCES drugs(trade_name),
    CONSTRAINT INVOCE_LINE_PK PRIMARY KEY (invoce_NUM,trade_name)
);


CREATE TABLE PRESCRIPTION (
    PRESCRIPTION_NUM int ,
    PRESCRIPTION_Date  timestamp not null,
    DOCTOR_ID INT not null,
    PATIENT_ID int not null,
    constraint PRESCRIPTION_PK primary key (PRESCRIPTION_NUM),
    FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR (doctor_id),
    FOREIGN KEY (PATIENT_ID) REFERENCES patient (patient_id)
)

CREATE TABLE PRESCRIPTION_LINE(
    PRESCRIPTION_NUM int not null,
    trade_name varchar2(30) not null,
    QUANITY int not null,
    FOREIGN key (PRESCRIPTION_NUM) references PRESCRIPTION(PRESCRIPTION_NUM),
    FOREIGN key (trade_name) references drugs(trade_name),
    constraint PRESCRIPTION_LINE_PK primary key (PRESCRIPTION_NUM,trade_name)
)

-- insert

    alter table PLACE
    modify SUPER_ID null

    alter table PLACE
    modify manager_id null


    insert into place (
        PLACE_ID,
        name,
        ADDRESS
    )
    VALUES
        (
            2,
            'Pharmacy moharam',
            'moharam'
        );

    alter table EMPLOYEE
    modify HIRING_DATE null

    insert into employee
    values(
        20201,
        2,
        'mohamed',
        '8',
        '4',
        null,
        null,
        'male',
         NULL
    )
    alter table MANAGER
    modify DATE_BECAME null
    modify DATE_END null

    INSERT into manager
    values (
        202012,
        20201,
        null,
        null
    );

    update PLACE
    set manager_id = 202012
    where PLACE_ID = 1

    insert into LOGIN
    values (
        1,
        20201,
        1010,
        'moh'
    );

    alter table CONTACT_NUMBER
    modify EMP_ID NULL
    modify SUPPLIER_ID NULL
    modify DOCTOR_ID null
    modify PATIENT_ID null;

    INSERT into CONTACT_NUMBER (CON_NUMBER , EMP_ID)
    VALUES(
        '510-555-0407',
        20201
    );

    update EMPLOYEE
    set HIRING_DATE =to_date ('08-08-1999','DD-MM-YYYY')
    where EMP_ID = 20201;

    insert into PHARMACY
    VALUES(
        2,
        2
    );


    update manager
    set DATE_BECAME = to_date ('08-08-2010','DD-MM-YYYY')
    where EMP_ID = 20202

    insert into MANAGER
    VALUES(
        202013,
        20201,
        to_date ('08-08-2010','DD-MM-YYYY'),
        null
    );

    update PLACE
    set MANAGER_ID=202013

    update PLACE
    set MANAGER_ID=202012
    where PLACE_ID=1

    update EMPLOYEE 
    set HIRING_DATE = to_date('08-08-2009','DD-MM-YYYY')
    WHERE EMP_ID=20202

    update EMPLOYEE 
    set HIRING_DATE = to_date('08-08-2015','DD-MM-YYYY')
    WHERE EMP_ID=20203

    INSERT into DOCTOR
    values(
        102,
        'wazzan',
        '5 years',
        'W'
    );
    INSERT into PATIENT
    values(
        203,
        'mohamed',
        'male',
        'smouha',
        to_date('08-08-2018','DD-MM-YYYY')

    );
    INSERT into PRESCRIPTION
    values(
        2,
        to_date('08-09-2021','DD-MM-YYYY'),
        102,
        203

    );
    insert into PRESCRIPTION_LINE
    values (
        2,
        'Ciprofar 750 Tab',
        523
    )

    insert into DRUGS
    VALUES(
        'Ciprofar 750 Tab',
        'farco',
        'antibio',
        80,
        to_date('08-08-2027','DD-MM-YYYY'),
        null,
        null,
        null

    );
    insert into INVOCE
    values(
        2,
        2,
        203,
        20201,
        'Later',
        to_date('08-08-2021','DD-MM-YYYY')
    );

    insert into INVOCE_LINE
    values(
        2,
        'Ciprofar 750 Tab',
        53
    )

    insert into SUPPLIER
    VALUES(
        2,
        'supplier2',
        'borgalarb'
    )

    insert into PLACE
    VALUES(
        4,
        'stock moharam',
        'moharam',
        null,
        null
    )
    insert into stock
    values(
        201,
        4
    )
    insert into TAKES
    VALUES(
        8,
        2,
        201,
        CURRENT_TIMESTAMP
    );

    insert into TAKES_LINE
    VALUES(
        8,
        'Ciprofar 750 Tab',
        5
    )
    insert into ORDERS
    VALUES(
        1,
        201,
        2,
        CURRENT_TIMESTAMP
    )

    insert into ORDER_LINE
    VALUES(
        1,
        'Ciprofar 750 Tab',
        5
    );

alter table storage
modify storage_date null

    insert into storage
    values(
        1,
        2,
null
    )

    INSERT into storage_line
    values(
        1,
        'Ciprofar 750 Tab',
        50
    )


/*     _  ____ _____ _   _  _____ 
      | |/ __ \_   _| \ | |/ ____|
      | | |  | || | |  \| | (___  
  _   | | |  | || | | . ` |\___ \ 
 | |__| | |__| || |_| |\  |____) |
  \____/ \____/_____|_| \_|_____/ 
*/

-- PRESCRIPTION
SELECT * FROM PRESCRIPTION
INNER JOIN -- PRESCRIPTION LINE && DRUGS
(
    SELECT * FROM PRESCRIPTION_LINE
    INNER JOIN drugs
    USING(trade_name)
)
USING(PRESCRIPTION_NUM)
INNER JOIN DOCTOR
USING(DOCTOR_ID)
INNER JOIN patient
USING(PATIENT_ID)

-- INVOCE
SELECT * FROM INVOCE
INNER JOIN 
(   --INVOCE LINE && DRUGS
    SELECT * FROM INVOCE_LINE
    INNER JOIN drugs
    USING(trade_name)
)
USING(invoce_NUM)
INNER JOIN
(   -- PHARMACY && PLACE 
    SELECT * FROM pharmacy
    INNER JOIN PLACE
    USING(place_id)
)
USING(pharma_id)
INNER JOIN patient
USING(PATIENT_ID)
INNER JOIN EMPLOYEE
USING(emp_id)

-- STORAGE 
SELECT * FROM STORAGE
INNER JOIN -- STORAGE LINE && DRUGS
(
    SELECT * FROM storage_line
    INNER JOIN DRUGS
    USING(trade_name)
)
USING(storage_id)
INNER JOIN PLACE
USING(place_id)

-- TAKE 
SELECT * FROM takes
INNER JOIN --TAKES LINE && DRUGS
(   
    SELECT * FROM takes_line
    INNER JOIN DRUGS
    USING(trade_name)
)
USING(takes_id)
INNER JOIN -- PHARMACY && PLACE 
(   
    SELECT * FROM pharmacy
    INNER JOIN PLACE
    USING(place_id)
)
USING(pharma_id)
INNER JOIN -- STOCK && PLACE
(
    SELECT * FROM STOCK
    INNER JOIN PLACE 
    USING (place_id)
)
USING(STOCK_ID)


-- ORDER
SELECT * FROM Orders
INNER JOIN -- ORDER LINE && DRUGS
(
    SELECT * FROM Order_Line
    INNER JOIN DRUGS
    USING(trade_name)
)
USING(ORDER_NUM)
INNER JOIN -- STOCK && PLACE
(
    SELECT * FROM STOCK
    INNER JOIN PLACE 
    USING (place_id)
)
USING(STOCK_ID)
INNER JOIN supplier
USING (supplier_id)