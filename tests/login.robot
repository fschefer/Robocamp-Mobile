*** Settings ***
Resource            ../resources/base.resource

Test Setup          Start the app
Test Teardown       Finish the app


*** Variables ***
${error_401}            Acesso não autorizado! Entre em contato com a equipe de atendimento.



*** Test Cases ***
Should login successfully
    ${arabella}    Get Fixture    arabella

    Login with student id    ${arabella}[student][id]
    Wait Until Page Contains    Olá, ${arabella}[student][name]!

Invalid student ID
    ${arabella}    Get Fixture    arabella
    Login with student id    9999
    Wait Until Page Contains    Acesso não autorizado! Entre em contato com a equipe de atendimento.

Negative access code
    Login With Student Id        -1
    Wait Until Page Contains     ${error_401}

Access code with letters
    Login With Student Id        abc123
    Wait Until Page Contains     ${error_401}