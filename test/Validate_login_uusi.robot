*** Settings ***
Resource    resource.robot
Test Teardown    Close Browser
# Teardown suoritetaan lopuksi aina, vaikka testi ei menisi läpi

*** Test cases ***

Valid Login
    Open Browser To Login Page
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Log In
    Welcome Page Should Be Open