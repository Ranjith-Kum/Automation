*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Start Test Setup
    Log    Start of Testcase

End Test Setup
    Log    End of Testcase

Open URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Button    id=login-button
    Title Should Be    Swag Labs
    Input Text    id=user-name    ${logindata.username}
    Input Text    id=password    ${logindata.password}
    
  
