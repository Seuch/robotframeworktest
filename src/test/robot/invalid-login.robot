*** Settings ***
Documentation    A test suite containing tests related to invalid login

Resource    resource.robot
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup    Go To Login Page
Test Template    Login With Credentials Should Fail
Resource    resource.robot

*** Test Cases ***    USER NAME    PASSWORD
Invalid Username    invalid    ${VALID PASSWORD}
Invalid Password    ${VALID USER}    invalid
Invalid Username And Password    invalid    whatever

*** Keywords ***
Login With Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Resource.Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Page Should Contain    is invalid!