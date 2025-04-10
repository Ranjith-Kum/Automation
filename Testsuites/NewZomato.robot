*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    OperatingSystem
Library    String
Resource    ../keywords/data.robot

Suite Setup    Open APP
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Edge

# Zomato Variables
${BOOK_TABLE_BUTTON}        //span[normalize-space()='Book a table']
${GUESTS_DROPDOWN}          //span[contains(normalize-space(),'guest')]
${DATE_SELECTOR}            //span[@class='sc-qnejpk-6 edhdOB']
${LUNCH_ICON}               //div[3]//div[1]//div[1]//span[1]//i[1]//*[name()='svg']//*[name()='path' and contains(@d,'M20 5.42l-')]
${OFFER_OPTION}             //div[@overflow='hidden'][1]
${PROCEED_BUTTON}           //button[@role="button"][@aria-disabled="false"]


*** Test Cases ***
Book Restaurant Table
    [Documentation]    Opens Zomato page and books a table at a restaurant
    ${final_status}    Set Variable    ${FALSE}
    FOR    ${i}    IN RANGE    0    2
        ${URL}    Get Environment Variable    TOP_RESTAURANT[${i}]
        Reload APP    ${${URL}}
        Sleep    2
        ${Guest_Count}    Get Environment Variable    GUEST_COUNT
        ${DATE}    Get Environment Variable    DATE
        ${TIME_SLOT}    Get Environment Variable    TIME_SLOT
        ${TIMING}    Get Environment Variable    TIMING
        
        ${status}    Run Keyword And Return Status     Book Table at a Restaurant on Zomato    ${Guest_Count}    ${DATE}    ${TIME_SLOT}    ${TIMING}
        
        IF    '${status}' == 'True'
            ${final_status}    Set Variable    ${TRUE}
            Exit For Loop
        END
    END
    Should Be True    ${final_status}    None of the Restaurant booking attempts were successful
    Run Keywords
    ...    Log To Console    Restaurant booking is successful
    ...  AND
    ...    Set Test Message    Restaurant booking is successful
    ...    

*** Keywords ***

Open APP
    ${URL}    Get Environment Variable    URLWITHCITY
    Open Browser    ${URL}    ${BROWSER}
    Delete All Cookies
    Maximize Browser Window

Reload APP
    [Arguments]    ${URL}
    Go To    ${URL}    

Book Table at a Restaurant on Zomato
    [Documentation]    Book a table at a restaurant on Zomato
    [Arguments]    ${Guest_Count}    ${DATE}    ${TIME_SLOT}    ${TIMING}

    # Book Table
    Execute JavaScript    window.scrollBy(0, 500);
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${BOOK_TABLE_BUTTON}    10s
    Should Be True    ${status}    Reservation is not available at this Restaurant
    IF    ${status} == True
        Click Element    ${BOOK_TABLE_BUTTON}
    END
    Sleep    5
 
    Scroll Element Into View    ${GUESTS_DROPDOWN}
    Sleep    2
    Click Element    ${DATE_SELECTOR}
    Sleep    3
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@aria-label='${DATE}']    10s
    Should Be True    ${status}    Reservation is not available on the provided date
    IF    ${status} == True
        Click Element    //div[@aria-label='${DATE}']
    END
    Sleep    5

    Click Element    ${GUESTS_DROPDOWN}
    Sleep    3
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(text(),'${Guest_Count} guest')]    10s
    Should Be True    ${status}    Reservation is not available for the provided guest count
    IF    ${status} == True
        Click Element    //span[contains(text(),'${Guest_Count} guest')]
    END
    Sleep    3
 
    Click Element    ${LUNCH_ICON}
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //span[contains(text(),'${TIME_SLOT}')]    10s
    Should Be True    ${status}    Reservation is not available at the provided time slot
    IF    ${status} == True
        Click Element    //span[contains(text(),'${TIME_SLOT}')]
    END
    Sleep    3

    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //div[normalize-space()='${TIMING}']    10s
    Should Be True    ${status}    Reservation is not available at the provided timing
    IF    ${status} == True
        Click Element    //div[normalize-space()='${TIMING}']
    END

    Scroll Element Into View    ${OFFER_OPTION}
    Sleep    2
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${OFFER_OPTION}    10s
    Run Keyword And Continue On Failure    Should Be True    ${status}    Discount offer is not available
    IF    ${status} == True
        Run Keyword And Continue On Failure    Click Element    ${OFFER_OPTION}
    END
    Sleep    3
 
    Click Button    ${PROCEED_BUTTON}
    Sleep    3