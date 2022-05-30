*** Settings ***
Library           Selenium2Library
Library           DatabaseLibrary


*** Variables ***
${NAME}    bela
${USERNAME}    bela
${PASSWORD}    beka
${HOMEPAGEINFO}    Kellemes időtöltést!
${DBNAME}   Filmek
${DBUSERNAME}   root
${DBPASSWORD}   abcd
${ADDRESS}  localhost 
${PORT}     3306

*** Test Cases ***
Register a user
    Open Browser To URL
    Register User
    Result Should Be Homepage
    Connect To DB
    User Should Be In Database
    Delete User
    Disconnect From Database
    Close Browser
   

*** Keywords ***
Open Browser To URL
    Open Browser    http://localhost:5000/#lista    browser=chrome
    Maximize Browser Window

Register User
    Click Element   xpath://*[@id="navbarNav"]/ul/li[3]/a
    Input Text   xpath:/html/body/main/div/div/form/div[1]/input   ${NAME}
    Input Text   xpath:/html/body/main/div/div/form/div[2]/input   ${USERNAME}
    Input Password   xpath:/html/body/main/div/div/form/div[3]/input   ${PASSWORD} 
    Input Password   xpath:/html/body/main/div/div/form/div[4]/input   ${PASSWORD} 
    Click Element   xpath://*[@id="submit"]


Result Should Be Homepage
   Element Should Contain    xpath:/html/body/main/div[1]/div/p[2]    ${HOMEPAGEINFO}

Connect To DB
    Connect To Database     pymysql  ${DBNAME}  ${DBUSERNAME}  ${DBPASSWORD}  ${ADDRESS}  ${PORT}

User Should Be In Database
    Table Must Exist        Users
	Check If Exists In Database     select UserID from Users where Username='bela'
   
Delete User
	Execute SQL String  delete from Users where Username = 'bela'

