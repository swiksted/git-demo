*** Settings ***
resource			resource.robot
test setup			login page opens
test teardown		go to		${HOST}
suite setup		made up command
suite teardown		close all browsers
force tags				invalidit_tag	
*** Test cases ***

InvalidLogin1
	LoginError		väärä		väärä
	LoginError		${VALID_USERNAME}	väärä

InvalidLogin2
	[Documentation]		jotain infoa casesta
	[Tags]				väärä_käyttääjä		oikea_pw
	LoginError		väärä		${VALID_PASSWORD}
	
*** Keywords ***

LoginError
	[Arguments]		${username}		${password}
	made up command
	input username		$username
	input password		$password
	click button    login_button
	comment    test comment
	error page opens
