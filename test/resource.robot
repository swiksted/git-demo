*** Settings ***
Library    Selenium2Library

*** Variables ***
${POST}    http://localhost:7272
${VALID_USERNAME}    demo
${VALID_PASSWORD}    mode
${INVALID_USERNAME}    demo2
${INVALID_PASSWORD}    mode2
${VALID_WELLCOME_PAGE_TITLE}    Welcome Page
${ERROR_PAGE_TITLE}    Error Page
${LOGIN_PAGE_TITLE}    Login Page
${EMPTY}
	
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${POST}

Input username
    [Arguments]    ${username}
    Input text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input text    password_field    ${password}

Log In
    Click button    login_button

Login Page Should Be Open
	Wait Until Page Contains    Login    5 second
	Location Should Be    ${POST}/
    Title should be       ${LOGIN_PAGE_TITLE}

Welcome Page Should Be Open
	Wait Until Page Contains    Welcome    5 second
	Location Should Be    ${POST}/welcome.html
    Title should be       ${VALID_WELLCOME_PAGE_TITLE}

Error Page Should Be Open
	Wait Until Page Contains    Error    5 second
	Location Should Be    ${POST}/error.html
    Title should be       ${ERROR_PAGE_TITLE}
