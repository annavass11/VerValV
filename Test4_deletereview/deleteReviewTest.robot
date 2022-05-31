#I am logged in as a user and I want to delete one of my reviews.

*** Settings ***
Library           Selenium2Library

*** Variables ***
${USERNAME}    gellert
${PASSWORD}    golya


*** Test Cases ***
Delete A Review
    Open Browser To URL
    Sign In
    Delete A Review
    #Review Should Not Be Shown On Page
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

Delete A Review
    Click Element   xpath://*[@id="navbarNav"]/ul/li[2]/a
    ${attr}    Get Element Attribute       xpath:/html/body/main/div/div/div/div/div[1]/button     onclick
    Click Element   xpath:/html/body/main/div/div/div/div/div[1]/button
    Sleep      1s
    ${attr2}    Get Element Attribute       xpath:/html/body/main/div/div/div/div/div[1]/button     onclick
    Should Not Be Equal As Strings      ${attr}      ${attr2} 
    #Element Attribute Value Should Not Be   xpath:/html/body/main/div/div/div/div/div[1]/button     onclick     ${attr}

Review Should Not Be Shown On Page
    #Page Should Not Contain Element     xpath:/html/body/main/div/div/div/div/div[1]/button
    #Element Attribute Value Should Be   xpath:/html/body/main/div/div/div/div/div[1]/button     onclick     ${attr}

Log Out
    Click Element   xpath://*[@id="navbarNav"]/ul/li[3]/a
    
   

    
