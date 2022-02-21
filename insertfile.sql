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


