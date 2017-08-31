*** Settings ***
Resource    resource.robot
Test Setup    Login Page Should Be Open
#Test Teardown    Close Browser ###hidas, koska selain avautuu aina uudestaan
Test Teardown    Go To    ${POST}
Suite Setup    Open Browser To Login Page
Suite Teardown    Close All Browsers
Force Tags    invalid_logins

*** Test cases ***

Login With Wrong Username And Wrong Password
    [Documentation]    This
	[Tags]    Wrong_user    Wrong_password
    Login And Expect Error    Wrongusername    Wrongpassword

Login With Empty Username And Valid Password
	[Tags]    empty_user    valid_password
    Login And Expect Error    ${EMPTY}    ${VALID_PASSWORD}

Login With Valid Username And Empty Password
	[Tags]    valid_user    empty_pass
    Login And Expect Error    ${VALID_USERNAME}    ${EMPTY}

*** Keywords ***

Login And Expect Error
	[Arguments]    ${username}    ${password}
    Open Browser To Login Page
	Input username    ${username}
	Input Password    ${password}
	Log In
	Error Page Should Be Open

