*** Settings ***
Library     AppiumLibrary
Library     JSONLibrary
Resource   ../resources/fixtures/screens/login.resource
Resource    ../resources/services/sessions.resource
Resource    ../resources/services/student.resource
Resource    ../resources/services/enrollments.resource
Resource    ../resources/database.resource

*** Variables ***


*** Keywords ***
Start the app
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    automationName=UiAutomator2
    ...    alias=SamrtBit
    ...    platformName=Android
    ...    deviceName=Emulator
    ...    app=${EXECDIR}/apps/smartbit-beta.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true

    Wait Until Page Contains    Informe seu código de acesso

Finish the app
    Capture Page Screenshot
    Close Application

    # Helpers

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load JSON From File
    ...    ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...    encoding=UTF-8
    RETURN    ${fixture}


