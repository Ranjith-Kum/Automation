*** Settings ***
Resource          Resources/Config.robot
Resource          Resources/Keywords.robot
Test Setup        Start Test Setup
Test Teardown     End Test Setup

*** Test Cases ***
Testcase1
    Open URL
    Sleep    2
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select
    Sleep    2
    Click Element    xpath=//*[@id="header_container"]/div[2]/div/span/select/option[2]
    Sleep    2
    Click Element    xpath=//*[@id="item_4_title_link"]/div
    Sleep    2
    Click Button    xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep    2
    Click Element    xpath=//*[@id="shopping_cart_container"]/a
    Sleep    2
    Click Button    xpath=//*[@id="remove-sauce-labs-backpack"]
    Sleep    2
    Click Button    xpath=//*[@id="continue-shopping"]
    Sleep    2
    Click Button    xpath=//*[@id="react-burger-menu-btn"]
    Sleep    2
    Click Element    xpath=//*[@id="logout_sidebar_link"]
    Sleep    2
    Close Browser
