*** Settings ***
Resource 		resource.robot
Test Setup		Login Page Should Be Open
Test Teardown	Go To 	${HOST}
Suite Setup		Open Browser To Login Page
Suite Teardown	Close All Browsers
Force Tags			invalid_logins

Test Template	Login And Expect Error


*** Test cases ***

Wrong Username And Wrong Password		Wrongusernam	Wrongpassword
	
Right Username And Wrong Password		${VALID_USERNAME}		Wrongpassword
	
Empty Username And Wrong Password		${Empty}				Wrongpassword
	
Right Username And Empty Password		${VALID_USERNAME}		${Empty}
	
Empty Username And Empty Password		${Empty}		${Empty}
	
Scandinavian Characters					åååääääööö		ääååääööö

*** Keywords ***

Login And Expect Error
	[Arguments]		${username}		${password}
	Open Browser To Login Page
	#Open Browser 	${HOST}		firefox
	Input Username	${username}
	Input Password	${password}
	Log In
	Error Page Should Be Open
	
