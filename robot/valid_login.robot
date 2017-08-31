*** Settings ***
Resource         resource.robot
Test Teardown    Close Browser

*** Test cases ***
Login With Right Username And Right Password
    Login And Expect Error    ${VALID_USERNAME}    ${VALID_PASSWORD}

*** Keywords ***

Login And Expect Error
	[Arguments]    ${username}    ${password}
    Open Browser To Login Page
	Input username    ${username}
	Input Password    ${password}
	Log In
	Welcome Page Should be Open
	