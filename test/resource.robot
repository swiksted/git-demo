*** Settings ***
Library    Selenium2Library

<<<<<<< HEAD
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
=======
# Test Teardown    Close Browser

*** Variables ***
${HOST}                  http://localhost:7272
${VALID_USERNAME}        demo
${VALID_PASSWORD}        mode
${WELCOME_PAGE_TITLE}    Welcome Page
${ERROR_PAGE_TITLE}      Error Page



*** Keyword ***
Open Browser To Login Page
    Open Browser    ${HOST}    firefox
	
Input username
    [Arguments]     ${username}
    Input text      username_field    ${username} 
	
Input Password
    [Arguments]     ${password}
	Input text      password_field    ${password}
	
Log In
    Click Button    login_button

Login Page Should Be Open
	Wait Until Page Contains    Login    5 seconds
    Location Should Be    ${HOST}/
	Title Should Be       Login Page
	
Welcome Page Should Be Open
    Wait Until Page Contains    Welcome    5 seconds
    Location Should Be    ${HOST}/welcome.html
    Title Should Be       ${WELCOME_PAGE_TITLE}
	
Error Page Should Be Open
    Wait Until Page Contains    Error    5 seconds
	Location Should Be    ${HOST}/error.html
    Title Should Be       ${ERROR_PAGE_TITLE}
>>>>>>> 0c6d782164bc6ede821e071c4c165bd8fe1f02fa
