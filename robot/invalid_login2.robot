*** Settings ***
Resource         resource.robot
Suite Setup      Open Browser to Login Page
Test Setup       Login Page Should Be Open
Test Teardown    Go to    ${HOST}
Suite Teardown    Close All Browsers
Force Tags       invalid_logins

Test Template    Login And Expect Error

*** Test cases ***

Wrong Username And Wrong Password    Wrongusername    Wrongpassword

Wrong Username And Valid Password    Wrongusername    ${VALID_PASSWORD}
	
Valid Username And Wrong Password    ${VALID_USERNAME}    Wrongpassword
	
Empty Username And Valid Password    ${EMPTY}    ${VALID_PASSWORD}
	
Valid Username And Empty Password    ${VALID_USERNAME}    ${EMPTY}

*** Keywords ***

Login And Expect Error
	[Arguments]    ${username}    ${password}
    Open Browser To Login Page
	Input username    ${username}
	Input Password    ${password}
	Log In
	Error Page Should be Open
		
