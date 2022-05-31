#I am logged in as an admin and I want to add a movie, the movie should appear in the movielist after the insertion
*** Settings ***
Library           Selenium2Library
Library           DatabaseLibrary


*** Variables *** 
${USERNAME}    panna
${PASSWORD}    papagaj

${TITLE}    Harry Potter 
${DATE}     2007
${DESCRIPTION}      Good
${GENRE}        Fantasy
${IMAGE}        C:/Users/Reka/Desktop/robot/Sajat/Test5_addmovie/MV5BMGVmMWNiMDktYjQ0Mi00MWIxLTk0N2UtN2ZlYTdkN2IzNDNlXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg
${YOUTUBE}      https://www.youtube.com/watch?v=kI17tEL84Qg



*** Test Cases ***
Add A Movie To The DB
    Open Browser To URL
    Log In
    Add New Movie
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

Add New Movie
    ${nr}       Get Element Count       xpath:/html/body/main/div[2]/div[2]/div
    
    Click Element       //*[@id="navbarNav"]/ul/li[2]/a     
    Input Text      xpath:/html/body/main/div/div/form/div[1]/input     ${TITLE}
    Input Text      xpath:/html/body/main/div/div/form/div[2]/input     ${DATE}
    Input Text      xpath:/html/body/main/div/div/form/div[3]/input     ${DESCRIPTION}
    Input Text      xpath:/html/body/main/div/div/form/div[4]/input     ${GENRE} 
    Choose File     xpath:/html/body/main/div/div/form/div[5]/input     ${IMAGE} 
    Input Text      xpath:/html/body/main/div/div/form/div[6]/input     ${YOUTUBE} 
    Click Element   xpath:/html/body/main/div/div/form/p/input  
    Sleep      1s    
    ${last1}     Get Element Attribute       xpath:(/html/body/main/div[2]/div[2])[last()]    onclick
    ${nr1}       Get Element Count       xpath:/html/body/main/div[2]/div[2]/div
    Should Be Equal As Strings      ${nr}      ${nr1}


