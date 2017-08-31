*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOST}                  http://localhost:7272
${VALID_USERNAME}        demo
${VALID_PASSWORD}        mode
${WELCOME_PAGE_TITLE}    Welcome Page
${ERROR_PAGE_TITLE}      Error Page


*** Keyword ***
Open Browser To Login Page
    Open Browser    ${HOST}/
Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
Input Password
    [Arguments]    ${password}
    Input Text                  password_field       ${password}
Log In
    Click Button                login_button
Welcome Page Should be Open
    Wait Until Page Contains    Welcome              5 seconds
    Location Should be          ${HOST}/welcome.html
    Title Should Be             ${WELCOME_PAGE_TITLE}
	
Login Page Should Be Open
    Wait Until Page Contains    Login              5 seconds
    Location Should be          ${HOST}/
	Title Should Be             Login Page
	
Error Page Should be Open
    Wait Until Page Contains     Error               5 seconds
    Location Should be          ${HOST}/error.html
	Title Should Be              ${ERROR_PAGE_TITLE}