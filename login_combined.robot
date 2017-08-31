*** Settings ***
resource			resource.robot
test setup			login page opens
test teardown		go to		${HOST}
#test teardown		close browser
# lopputoimet - tehdään aina riippumatta testin tuloksesta
suite setup		made up command
suite teardown		close all browsers
force tags				invalidit_tag	
# tämä luo yo. tagin kaikille suiten caseille. tägejä voi käyttää testien suodattamiseen ajossa, mm. raportoinnissa / etsimisessä jne.		
# kaikki luodut tagit löytyy miten?? 	esim. generoituva automaattiraportti osaa oletuksena näyttää suodatinehtona kaikki tagit.

#Test template		LoginError
# jos määrittelee tän, ei testicaseissa tarvitse kutsua keywordia lainkaan, antaa vain parametrit, tyyliin:
#InvalidLogin2 väärä		${VALID_PASSWORD}


*** Test cases ***

InvalidLogin1
	LoginError		väärä		väärä
	LoginError		${VALID_USERNAME}	väärä
	# näitä steppejä voidaan jatkaa eri parametrein tästä ikuisuuteen


InvalidLogin2
	[Documentation]		jotain infoa casesta
	[Tags]				väärä_käyttääjä		oikea_pw
	LoginError		väärä		${VALID_PASSWORD}
	
*** Keywords ***

LoginError
	[Arguments]		${username}		${password}
	made up command
	input username		$username
	# huomaa että tässä välitetään parametri testicasen kutsusta saakka resource-tiedostoon
	input password		$password
	click button    login_button
	comment    test comment
	error page opens
