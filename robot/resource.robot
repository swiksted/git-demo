*** Settings ***
Library          Selenium2Library

*** Variables ***
${HOST}                    http://localhost:7272
${VALID_USERNAME}          demo
${VALID_PASSWORD}          mode
${WELLCOME_PAGE_TITLE}     Welcome Page
${ERROR_PAGE_TITLE}        Error Page
${LOGIN_PAGE_TITLE}        Login Page
		
*** Keyword ***
Open Browser To Login Page	
	Open Browser        ${HOST}
	
Input username
    [Arguments]         ${username}
    Input Text          username_field    ${username}    

Input Password
    [Arguments]         ${password}
    Input Text          password_field    ${password}	
	
Log In
    Click Button        login_button
	
Login Page Should Be Open
    Wait Until Page Contains    Login    5 second
	Location Should Be         ${HOST}/
	Title Should Be            ${LOGIN_PAGE_TITLE}  

Welcome Page Should be Open
    Wait Until Page Contains    Welcome    5 second
    Location Should Be    ${HOST}/welcome.html    
    Title Should Be       ${WELLCOME_PAGE_TITLE}
	
Error Page Should be Open
    Wait Until Page Contains    Error    5 second
    Location Should Be    ${HOST}/error.html    
    Title Should Be       ${ERROR_PAGE_TITLE}