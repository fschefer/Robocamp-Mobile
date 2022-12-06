*** Settings ***
Documentation       Managing database

Library             DatabaseLibrary


*** Keywords ***
Connect to Postgres
    Connect To Database
    ...    psycopg2
    ...    icrdwkxo
    ...    icrdwkxo
    ...    t2Nzj4ilucJng56lN6Wqzt1GMLV0NI3J
    ...    babar.db.elephantsql.com
    ...    5432

Select User by E-mail
    [Arguments]    ${email}

    ${query}    Set Variable    SELECT * FROM public.students WHERE email='${email}'
    ${result}    Query    ${query}
    RETURN    ${result}[0]

Delete Enrollment By E-mail
    [Arguments]    ${email}

    ${user}    Select User by E-mail    ${email}

    ${query}    Set Variable    DELETE FROM public.enrollments WHERE student_id ='${user}[0]';
    Execute Sql String    ${query}


# Helpers
Reset Student
    [Arguments]                   ${email}
    
    Connect To Postgres
    Delete Enrollment By E-mail       ${email}
    Disconnect From Database