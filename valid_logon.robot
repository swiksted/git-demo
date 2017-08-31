*** Settings ***
resource			resource.robot
test teardown		close browser

*** Test cases ***

valid login
    made up command
	input text    username_field	${VALID_USERNAME}
	input text    password_field	${VALID_PASSWORD}
	click button    login_button
	comment    test comment
	welcome page opens

