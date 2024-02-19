*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}        https://the-internet.herokuapp.com/login
${browser}    chrome
@{project}    NPG    FASHI    IOT
&{logindata}    username=tomsmith    password=SuperSecretPassword!

*** Keywords ***
Login to web
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    1
    Input Text    id=username    tomsmith
    Input Text    name=password    SuperSecretPassword!
    Click Button    class=radius    
    Sleep    2
    Close Browser


*** Test Cases ***
Testcase1
    Open Browser    ${url}    ${browser}
    Input Text    id=username    ${logindata.username}
    Input Text    name=password    ${logindata.password}
    Click Button    class=radius
    Close Browser

Testcase2
    ${local}    Set Variable    this is local
    ${lenght}    Get Length    ${project}
    Log    This is scalar variable --> ${browser}
    Log    This is list variable --> ${project}[1]
    Log    This is dict variable --> ${logindata.password}
    Log    this is the lenght --> ${lenght}

Testcase3
    Login to web