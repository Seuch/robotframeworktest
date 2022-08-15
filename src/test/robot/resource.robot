*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library    SeleniumLibrary

*** Variables ***
${SERVER}    the-internet.herokuapp.com
${BROWSER}    Chrome
${VALID USER}    tomsmith
${VALID PASSWORD}    SuperSecretPassword!
${LOGIN URL}    https://${SERVER}/login
${SECURE URL}    https://${SERVER}/secure
${DELAY}    0

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Element    //*[@id="login"]/button

Secure Area Is Open
    Location Should Be    ${SECURE URL}
    Page Should Contain    Secure Area

Login With Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Resource.Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Page Should Contain    is invalid!