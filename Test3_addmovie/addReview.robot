#I am logged in as a user and I want to review a movie

*** Settings ***
Library           Selenium2Library
Library           DatabaseLibrary

*** Variables ***
${USERNAME}    gellert
${PASSWORD}    golya
${POINTS}   10
${REVIEW}   nagyon jo
${DBNAME}   Filmek
${DBUSERNAME}   root
${DBPASSWORD}   abcd
${ADDRESS}  localhost 
${PORT}     3306
${rowCount}     0

*** Test Cases ***
Review A Movie
    Open Browser To URL
    Sign In
    Choose A Movie
    Connect To DB
    Fill Review 
    Review Should Be In DB
    Log Out
    Close Browser

*** Keywords ***
Open Browser To URL
    Open Browser    http://localhost:5000/#lista    browser=chrome
    Maximize Browser Window

Sign In
    Click Element    xpath://*[@id="navbarNav"]/ul/li[2]/a
    Input Text    xpath:/html/body/main/div/div/form/div[1]/input    ${USERNAME}
    Input Password    xpath:/html/body/main/div/div/form/div[2]/input    ${PASSWORD}
    Click Element    xpath:/html/body/main/div/div/form/input

Choose A Movie
    Click Element   xpath://*[@id="navbarNav"]/ul/li[1]/a
    Sleep  1s
    Click Element   xpath:/html/body/main/div[2]/div[2]/div[1]/a
    Sleep  1s
    
Fill Review 
    Table Must Exist	Reviews
    ${rowCount} =    Row Count    SELECT ReviewID FROM Reviews
    #${rowCount} =	Convert To Integer  ${rowCount}
    Input Text      xpath:/html/body/main/div[1]/form/div[2]/input      ${POINTS} 
    Input Text      xpath:/html/body/main/div[1]/form/div[3]/input      ${REVIEW} 
    Click Element   xpath://*[@id="submit"]

Connect To DB
    Connect To Database     pymysql  ${DBNAME}  ${DBUSERNAME}  ${DBPASSWORD}  ${ADDRESS}  ${PORT} 


Review Should Be In DB   
    Row Count Is Greater Than X 	select ReviewID from Reviews     ${rowCount}
    Disconnect From Database

Log Out
    Click Element   xpath://*[@id="navbarNav"]/ul/li[3]/a
    
   

    
