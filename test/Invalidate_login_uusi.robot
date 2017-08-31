*** Settings ***
Resource    resource.robot
Suite Setup    Open Browser to Login Page
Suite Teardown    Close All Browsers
Test Setup    Login Page Should be Open
Test Teardown    Go To    ${HOST}
# Teardown suoritetaan lopuksi aina, vaikka testi ei menisi läpi
Force tags    invalid_logins    

Test Template    Login And Expect Error

*** Test cases ***

# Templaten käyttö

Wrong Username And Wrong Password    Wrongusername    Wrongpassword

# Tai alla oleva tapa ilman Templatea

Login with Wrong Username and Wrong Password
    [Documentation]    This test uses wrong testname
	[Tags]    Wrong_user    Wrong_password
	Login And Expect Error    Wrongusername    Wrongpassword

Login with Valid Username and Wrong Password
    [Tags]    Valid_user    Wrong_password
	Login And Expect Error    ${VALID_USERNAME}    Wrongpassword

Login with Wrong Username and Valid Password
    [Tags]    Wrong_user    Valid_password
    Login And Expect Error    Wrongusername    ${VALID_PASSWORD}

Login with Empty Username and Valid Password
    [Tags]    Empty_user    Wrong_user    Valid_password
    Login And Expect Error    ${EMPTY}    ${VALID_PASSWORD}

Login with Valid Username and Empty Password
    [Tags]    Valid_user    Empty_password    Wrong_password
    Login And Expect Error    ${VALID_PASSWORD}    ${EMPTY}
	
Login with Special Characters
    Login And Expect Error    ½!"#¤%&/()=?`§+´@£{[]}\€~¨^*'$    ½!"#¤%&/()=?`§+´@£{[]}\€~¨^*'$

*** Keywords ***

Login And Expect Error
    [Arguments]    ${username}    ${password}
	Open Browser To Login Page
    Input Username    ${username}
    Input Password    ${username}
    Log In
    Error Page Should Be Open