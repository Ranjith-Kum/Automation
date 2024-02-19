*** Settings ***
Library   Browser

*** Variables ***
${browser}        chromium
${url}            https://the-internet.herokuapp.com/login

*** Test Cases ***
My First Test
    New Browser    browser=${browser}    headless=false
    New Page    ${url}
    Type Text    id=username    tomsmith
    Type Text    id=password    SuperSecretPassword!
    Click    css=button >> text=Login
    Sleep    4
    Close Browser 
