*** Settings ***
resource			resource.robot
test teardown		close browser
# lopputoimet - tehdään aina riippumatta testin tuloksesta


*** Test cases ***

valid login
    made up command
	input text    username_field	${VALID_USERNAME}
	#input username		${VALID_USERNAME}
	# yllä oleville luotu omat keywordit, alla olevat käyttää päosin suoraan kirjastojen komentoja
	input text    password_field	${VALID_PASSWORD}
	#input password		${VALID_PASSWORD}
	click button    login_button
	comment    test comment
	welcome page opens

