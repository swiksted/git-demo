*** Settings ***
resource			resource.robot
test teardown		close browser

*** Test cases ***

valid login
    made up command
	input username		${INVALID_USERNAME}
	input password		${INVALID_PASSWORD}
	click button    login_button
	comment    test comment
	error page opens


