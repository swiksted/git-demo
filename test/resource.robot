*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOST}    http://localhost:7272/
${VALID_USERNAME}    demo
${VALID_PASSWORD}    mode
${INVALID_USERNAME}    wronguser
${INVALID_PASSWORD}    wrongpass
${WELCOME_PAGE_TITLE}    Welcome Page
${ERROR_PAGE_TITLE}    Error Page
${LOGIN_PAGE_TITLE}    Login Page
${BROWSER}    firefox

*** Keyword ***
Open Browser To Login Page
    Open Browser    ${HOST}    ${BROWSER}

Input Username
    [Arguments]    ${username}
    input Text    username_field    ${USERNAME}

Input Password
    [Arguments]    ${password}
    input Text    password_field    ${PASSWORD}

Log In
    Click Button    login_button

Login Page Should be Open
    Wait Until Page Contains    Login    5 Second
    Location Should Be    ${HOST}
    Title Should Be                        ${LOGIN_PAGE_TITLE}
	
Welcome Page Should Be Open
    Wait Until Page Contains    Welcome    5 Second
    Location Should Be    ${HOST}welcome.html
    Title Should Be                        ${WELCOME_PAGE_TITLE}

Error Page Should Be Open
    Wait Until Page Contains    Error    5 Second
    Location Should Be    ${HOST}error.html
    Title Should Be                        ${ERROR_PAGE_TITLE}

