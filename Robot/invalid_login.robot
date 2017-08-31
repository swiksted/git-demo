*** Settings ***
Resource    resource.robot
Test Setup    Login Page Should Be Open
Test Teardown     Go to    ${HOST}/
Suite Setup    Open Browser To Login Page
Suite Teardown    Close All Browsers
Force Tags   invalid_logins

Test Template    Login And Expect Error

*** Test Cases ***

Login With Wrong Username And Wrong Password    Wrongusername    Wrongpassword

Login With Wrong Username And Valid Password    nönnönöö    ${VALID_PASSWORD}
	
Login With Valid Username and Wrong Password    ${VALID_USERNAME}    Wrongpassword
	
Login With Wrong username and password containing scandinavian Character    öäöäöäöäöäöäöä    öäöäöäöäöäöäöä
	
Login With empty username and valid password    ${EMPTY}    ${VALID_PASSWORD}
	
Login With valid username and empty password    ${VALID_USERNAME}    ${EMPTY}
	
	
*** Keywords ***

Login And Expect Error
    [Arguments]    ${username}    ${password}
	Comment    This comment is visible in report
	Open Browser to Login Page
	Input Username    ${username}
	Input Password    ${password}
	Log In
	Error Page Should be Open
    
