#szotarban akarunk ekezetes es 
*** Settings ***
Library           Selenium2Library


*** Variables *** 
${word}     csosz
${wronginput}   Hoppá-hoppá, nincs találat!
${rightinput}  "csősz" szinonimái:

*** Test Cases ***
Search a Word With Accent In The dictionary
    Open Browser To URL
    Accept Cookies
    Search The Word
    Verify Result    ${wronginput}
    Close Browser

Search a Word Without Accent In The dictionary 
    Open Browser To URL
    Accept Cookies
    Check Not Case Sensitive
    Search The Word
    Verify Result    ${rightinput}
    Close Browser

*** Keywords ***
Open Browser To URL
    Open Browser    https://szinonimaszotar.hu/keres/csosz    browser=chrome
    Maximize Browser Window

Accept Cookies 
    Click Element    //*[@id="qc-cmp2-ui"]/div[2]/div/button[1]/span

Search The Word
    Input Text      //*[@id="searchstring"]     ${word}
    Click Element   //*[@id="search"]/form/input[2]

Verify Result
    [Arguments]     ${input}
    Element Should Contain      //*[@id="content"]/h1     ${input}

Check Not Case Sensitive
    Click Element       //*[@id="onoff"]
    Wait Until Element Is Visible       //*[@id="ekezetek"]
    Select Checkbox     //*[@id="ekezetek_mellozese"]