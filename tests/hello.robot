*** Settings ***
Documentation       Robot+Appium

Library             AppiumLibrary


*** Test Cases ***
Open the SmartBit app
    Open Application
    ...    http://localhost:4723/wd/hub
    ...    automationName=UiAutomator2
    ...    alias=SamrtBit
    ...    platformName=Android
    ...    deviceName=Emulator
    ...    app=${EXECDIR}/apps/smartbit-beta.apk
    ...    udid=emulator-5554
    ...    autoGrantPermissions=true
    Close Application
