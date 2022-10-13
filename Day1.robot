*** Settings ***
Library             SeleniumLibrary
Test Setup          Open Browser With Google Chrome
Test Teardown       Close Google Chrome Browser

*** Variables ***
${DEMOBLAZE_URL}    https://www.demoblaze.com/index.html
${CHROME_BROWSER}   chrome

*** Keywords ***
Open Browser With Google Chrome
    Open Browser    url=${DEMOBLAZE_URL}   browser=${CHROME_BROWSER}
    Maximize Browser Window

Verify Demoblaze Logo Appears
    Element Should Be Visible       xpath=//*[@id="nava"]

Verify Top Menu Button Appears
    Element Should Be Visible       xpath=//*[contains(text(), 'Home')]

Verify Banner Appears
    Element Should Be Visible       xpath=//*[@class="carousel-inner"]

Click Login Button In Homepage
    Click Element                   xpath=//*[@id="login2"]

Input Username
    Wait Until Element Is Visible   xpath=//*[@id="loginusername"]
    Input Text                      xpath=//*[@id="loginusername"]    text=test4567

Input Password
    Input Text                      xpath=//*[@id="loginpassword"]    text=test

Click Login Button In Login Popup
    Click Element                   xpath=//*[@type="button" and contains(text(), 'Log in')]

Close Google Chrome Browser
    Close Browser

*** Test Cases ***
User Should Be Able To Open Google Chrome Browser
    Verify Demoblaze Logo Appears
    Verify Top Menu Button Appears
    Verify Banner Appears

User Should Be Able To Login
    Click Login Button In Homepage
    Input Username
    Input Password
    Click Login Button In Login Popup