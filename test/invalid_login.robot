# pybot --include wrong_password invalid_login.robot
# pybot invalid_login.robot

*** Settings ***
Resource          resource.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close All Browsers
Test Setup        Login Page Should Be Open
Test Teardown     Go To    ${HOST}
Force Tags        invalid_logins


*** Test cases ***
Wrong Username And Wrong Password
    [Documentation]           This test uses a wrong username and a wrong password}
	[Tags]                    wrong_username    wrong_password
    Login And Expect Error    wronguser     wrongpass
	
Wrong Username And Valid Password
    [Tags]                    wrong_username    valid_password
    Login And Expect Error    wronguser     ${VALID_PASSWORD}
	
Valid Username And Wrong Password
    [Tags]                    valid_username    wrong_password
    Login And Expect Error    ${VALID_USERNAME}     wrongpass
	
Valid Username And Empty Password
    [Tags]                    valid_username    empty_password    wrong_password
    Login And Expect Error    ${VALID_USERNAME}     ${EMPTY}
	
Empty Username And Valid Password
    [Tags]                    empty_username    wrong_username    valid_password
    Login And Expect Error    ${EMPTY}     ${VALID_PASSWORD}
	
Empty Username And Empty Password
    [Tags]                    empty_username    wrong_username    empty_password    wrong_password
    Login And Expect Error    ${EMPTY}    ${EMPTY}

*** Keywords ****

Login And Expect Error
    [Arguments]    ${username}    ${password}
    Open Browser To Login Page
    Input Username    ${username} 
	Input Password    ${password}
	Log In
	Error Page Should Be Open
