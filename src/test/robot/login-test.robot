*** Settings ***
Documentation    A test suite containing tests regarding login
Resource    resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    tomsmith
    Resource.Input Password    SuperSecretPassword!
    Submit Credentials
    Secure Area Is Open
    [Teardown]    Close Browser