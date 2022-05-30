*** Settings ***
Library           Selenium2Library

*** Variables ***
${USERNAME}    panna
${PASSWORD}    papagaj

*** Test Cases ***
Sign Up A User
    Open Browser To URL
    Sign Up User
    Result Should Contain Username And Password
    Close Browser

*** Keywords ***
Open Browser To URL
    Open Browser    http://localhost:5000/#lista    browser=chrome
    Maximize Browser Window

Sign Up User
    Click Element    xpath://*[@id="navbarNav"]/ul/li[2]/a
    Input Text    xpath:/html/body/main/div/div/form/div[1]/input    ${USERNAME}
    Input Password    xpath:/html/body/main/div/div/form/div[2]/input    ${PASSWORD}
    Click Element    xpath:/html/body/main/div/div/form/input

Result Should Contain Username And Password
   Element Should Contain    xpath://*[@id="navbarNav"]/ul/li[6]/p    ${USERNAME}
   

    
