*** Settings ***
Resource    resource.robot
Library     Selenium2Library

*** Test cases ***

Valid Login
    # This is comment
	Comment    This comment is visible in report
	Open Browser to Login Page
	Input Username    ${VALID_USERNAME}
	Input Password    ${VALID_PASSWORD}
	Log In
	Welcome Page Should be Open