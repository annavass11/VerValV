*** Settings ***
Library           Selenium2Library
Library           DatabaseLibrary
Test Template     Registration Should Fail When

*** Variables ***
${NAME}    bela
${USERNAME}    bela
${PASSWORD}    beka
${DBNAME}   Filmek
${DBUSERNAME}   root
${DBPASSWORD}   abcd
${ADDRESS}  localhost 
${PORT}     3306


*** Test Cases ***		        Name        Username    Password   PasswordAgain
The Username Already Exists     panna       panna       aaa        aaa
The Username Is Empty           ${EMPTY}       panna       aaa        aaa
The Passwords Are Different     anna        anna        abcd        abb

   

*** Keywords ***
Registration Should Fail When
    [Arguments]     ${Name}     ${Username}     ${Password}     ${PasswordAgain}
    Open Browser    http://localhost:5000/#lista    browser=chrome
    Maximize Browser Window

    Click Element   xpath://*[@id="navbarNav"]/ul/li[3]/a
    Input Text   xpath:/html/body/main/div/div/form/div[1]/input   ${Name}
    Input Text   xpath:/html/body/main/div/div/form/div[2]/input   ${Username}
    Input Password   xpath:/html/body/main/div/div/form/div[3]/input   ${Password} 
    Input Password   xpath:/html/body/main/div/div/form/div[4]/input   ${PasswordAgain} 
    Click Element   xpath://*[@id="submit"]
   
    Connect To Database     pymysql  ${DBNAME}  ${DBUSERNAME}  ${DBPASSWORD}  ${ADDRESS}  ${PORT}
    Table Must Exist        Users

	${loc}      Get Location 
    Should Not Be Equal As Strings      ${loc}    http://localhost:5000/

    Disconnect From Database
    Close Browser



	

