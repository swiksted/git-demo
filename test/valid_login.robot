*** Settings ***
Resource        resource.robot
Test Teardown   Close Browser 


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Log In
    Welcome Page Should be Open  

