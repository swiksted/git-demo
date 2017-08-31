*** Settings ***
resource			resource.robot
test teardown		close browser
# lopputoimet - tehdään aina riippumatta testin tuloksesta


*** Test cases ***

valid login
    made up command
	input username		${INVALID_USERNAME}
	#input text    username_field	${INVALID_USERNAME}
	#input text    password_field	${INVALID_PASSWORD}
	input password		${INVALID_PASSWORD}
	click button    login_button
	comment    test comment
	error page opens


