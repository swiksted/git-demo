*** Settings ***
Resource 		resource.robot
Test Teardown	Close Browser

*** Test cases ***

Valid Login
	# This is comment
	Comment    This comment is visible in report
	Open Browser To Login Page
	#Open Browser 	${HOST}		firefox
	Input Username	${VALID_USERNAME}
	Input Password	${VALID_PASSWORD}
	Log In
	Welcome Page Should Be Open
	

	