#I am logged in as an admin and I want to accept a pending review. The review should appear as accepted afterwards.
*** Settings ***
Library           Selenium2Library
Library           DatabaseLibrary

*** Variables *** 
${USERNAME}    panna
${PASSWORD}    papagaj

${DBNAME}   Filmek
${DBUSERNAME}   root
${DBPASSWORD}   abcd
${ADDRESS}  localhost 
${PORT}     3306

${VERIFICATION}     Statusz: elfogadva


*** Test Cases ***
Accept A Pending Review
    Open Browser To URL
    Log In
    Go To Administration 
    Check DB
    Accept Pending Review
    The Review Should Appear As Accepted
    Close Browser
   

*** Keywords ***
Open Browser To URL
    Open Browser    http://localhost:5000/#lista    browser=chrome
    Maximize Browser Window

Log In
    Click Element    xpath://*[@id="navbarNav"]/ul/li[2]/a
    Input Text    xpath:/html/body/main/div/div/form/div[1]/input    ${USERNAME}
    Input Password    xpath:/html/body/main/div/div/form/div[2]/input    ${PASSWORD}
    Click Element    xpath:/html/body/main/div/div/form/input

Go To Administration 
    Click Element   xpath://*[@id="navbarNav"]/ul/li[3]/a

Accept Pending Review
    Click Element       xpath:(/html/body/main/div/div/div[2]/div)[last()]/div/button[1]

  

The Review Should Appear As Accepted
    Element Should Contain      xpath:(/html/body/main/div/div/div[2]/div)[last()]/p[5]      ${VERIFICATION}  

Check DB
    Connect To Database     pymysql  ${DBNAME}  ${DBUSERNAME}  ${DBPASSWORD}  ${ADDRESS}  ${PORT} 
    Table Must Exist        Reviews
    Disconnect From Database




