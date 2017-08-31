*** Settings ***
Resource         resource.robot
Suite Setup      Open Browser to Login Page
Test Setup       Login Page Should Be Open
Test Teardown    Go to    ${HOST}
Suite Teardown    Close All Browsers
Force Tags       invalid_logins

Test Template    Login And Expect Error

*** Test cases ***

Login With Wrong Username And Wrong Password
    [Documentation]           This test uses wrong username
	[Tags]                    wrong_user    wrong_password
    Login And Expect Error    Wrongusername    Wrongpassword

Login With Wrong Username And Valid Password
    [Tags]                    wrong_user    valid_password
    Login And Expect Error    Wrongusername    ${VALID_PASSWORD}
	
Login With Valid Username And Wrong Password
    [Tags]                    valid_user    wrong_password
    Login And Expect Error    ${VALID_USERNAME}    Wrongpassword
	
Login With Empty Username And Valid Password
    [Tags]                    empty_user    wrong_user    valid_password
    Login And Expect Error    ${EMPTY}    ${VALID_PASSWORD}
	
Login With Valid Username And Empty Password
    [Tags]                    valid_user    empty_password    wrong_password
    Login And Expect Error    ${VALID_USERNAME}    ${EMPTY}

*** Keywords ***

Login And Expect Error
	[Arguments]    ${username}    ${password}
    Open Browser To Login Page
	Input username    ${username}
	Input Password    ${password}
	Log In
	Error Page Should be Open
		
