*** Settings ***
Library      Selenium2Library



*** Variables ***
${HOST}   			http://localhost:7272 
${VALID_USERNAME}	demo
${VALID_PASSWORD}	mode
${INVALID_USERNAME}	demox
${INVALID_PASSWORD}	modex

*** Keyword ***

made up command
	open browser    		${HOST}	
	
input username 
	[arguments]				${username}
	input text    			username_field	$username 
	
input password 
	[arguments]				${password}
	input text    			password_field	$password 
	
welcome page opens
	location should be    	${HOST}/welcome.html
	title should be    		Welcome Page
	
login page opens
	location should be    	${HOST}/
	title should be    		Login Page
	
error page opens
	location should be    	${HOST}/error.html
	title should be    		Error Page
	