*** Settings ***
Library      Selenium2Library
# pythonilla voi tehdä omia kirjastoja



*** Variables ***
# globaalit muuttujat, best practice et globaalit all capseilla
${HOST}   			http://localhost:7272 
${VALID_USERNAME}	demo
${VALID_PASSWORD}	mode
${INVALID_USERNAME}	demox
${INVALID_PASSWORD}	modex


# python perusteet -matsku cs.helsinki.fi + pythonin sivuilta beginners' guide
# http://localhost:7272/ python server


# vscode (ilmainen) on hyvä kehitin robot/python-koodin tekemiseen
# robotin lokitustasoa voi säätää trace/debug/info jne
# separate things in Robot "code" with a tab/4 spaces OR MORE (e.g. test steps under the test case name; comment keyword and the actual comment)

# you can use camel casing, but it's not necessary - lower case all the way works as well
# best practice is to use camel and use uppercased keywords

# this is a comment only visible in this file
#Comment    Comment is a built-in keyword. This comment will also be visible in the reports, unlike the comment above


*** Keyword ***

# uudelleenkäytettävät, itse määritellyt keywordit, voi siis käyttää muissakin testeissä kun tallennus

made up command
	open browser    		${HOST}	
	# tälle voi syöttää muuttujana eri selainten nimet, oletus FF
	
input username 
	[arguments]				${username}
	input text    			username_field	$username 
	# muuttujat voi syöttää myös tiedostosta, ei tarvii antaa komentorivillä
	
input password 
	[arguments]				${password}
	input text    			password_field	$password 
	
welcome page opens
	#sleep					1 second
	#wait until page contains		sometext	1 second
	location should be    	${HOST}/welcome.html
	title should be    		Welcome Page
	# keywordeihin voi yhdistää useamman komennon
	
login page opens
	location should be    	${HOST}/
	title should be    		Login Page
	
error page opens
	#sleep					1 second
	#wait until page contains		sometext	1 second
	location should be    	${HOST}/error.html
	title should be    		Error Page
	# keywordeihin voi yhdistää useamman komennon
	