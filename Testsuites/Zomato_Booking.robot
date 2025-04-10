*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    OperatingSystem
Library    String

Suite Setup    Open APP
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Edge

# Eazy Diner Locators
# ${EAZYDINER_URL}            https://www.eazydiner.com/bengaluru/restaurants
${ED_SEARCH_INPUT}          //div[@class='search_input_home font-15 padding-l-25 ellipsis test']
${ED_TYPE_INPUT}            //input[@placeholder='Search restaurants, locations or cuisines']
${Select_Restaurant}        //div[@class="city_name padding-b-5 black"][contains(normalize-space(),"Hard Rock Cafe")][1]
${SLOT_SELECTOR}            //div[@class='restaurantDetails_active_border__n3XBk padding-15 margin-t-15 margin-b-15 white pointer radius-8 flex']
${DAY_SELECTOR}             //div[contains(@class, 'restaurantDetails_slot_boxes__kd7C4')]//div[(normalize-space(.)='Tomorrow') or (normalize-space(.)='08 Apr')]
${TIME_SELECTOR}            //div[contains(@class, 'restaurantDetails_day_text__6KzM0') and normalize-space(.) = '08:00 PM']
${GUEST_COUNT}              //div[contains(@class, 'restaurantDetails_slot_boxes__kd7C4 ') and normalize-space(.) = '8']
${FIND_BEST_OFFERS_BUTTON}  //button[normalize-space()='Find Best Offer']  
${BOOK_FOR_FREE}            //div[@class='flex-1 flex align-v-center pointer flex-center padding-10 radius-10 gradient_btn white header_inner']

# Zomato Variables
# ${ZOMATO_URL}               https://www.zomato.com/bangalore/restaurants
${LOCATION_INPUT}           //input[@class="sc-boCWhm gqCoZG"]
${LOCATION_ICON}            //*[@id="root"]/div/div[3]/div[2]/div[2]/div/div[1]/i[2]
${SEARCH_INPUT}             //input[@placeholder='Search for restaurant, cuisine or a dish']
${BOOK_TABLE_BUTTON}        //span[normalize-space()='Book a table']
${GUESTS_DROPDOWN}          //span[contains(normalize-space(),'guest')]
${DATE_SELECTOR}            //span[@class='sc-qnejpk-6 edhdOB']
${LUNCH_ICON}               //div[3]//div[1]//div[1]//span[1]//i[1]//*[name()='svg']//*[name()='path' and contains(@d,'M20 5.42l-')]
${OFFER_OPTION}             //div[@overflow='hidden'][1]
${PROCEED_BUTTON}           //button[@role="button"][@aria-disabled="false"]

# Login Variables
# ${Email_Value}                  # Email to login and should be a valid gmail email with Zomato Account
# ${Signup_Button}            //a[normalize-space()='Sign up']
# ${Login_Button}             //a[normalize-space()='Log in']
# ${Continue_with_Email_Button}    //button[normalize-space()='Continue with Email']
# ${Email_Input_Textbox}      //input[@type='text'][@class='sc-1yzxt5f-9 eSaBRN']
# ${Send_OTP_Button}          //button[normalize-space()='Send One Time Password']
# ${OTP1}                     //input[@type='text'][@class='sc-hp56s6-1 jODXry'][1]
# ${OTP2}                     //input[@type='text'][@class='sc-hp56s6-1 jODXry'][2]
# ${OTP3}                     //input[@type='text'][@class='sc-hp56s6-1 jODXry'][3]
# ${OTP4}                     //input[@type='text'][@class='sc-hp56s6-1 jODXry'][4]
# ${OTP5}                     //input[@type='text'][@class='sc-hp56s6-1 jODXry'][5]
# ${OTP6}                     //input[@type='text'][@class='sc-hp56s6-1 jODXry'][6]

*** Test Cases *** 

Book Restaurant Table
    [Documentation]    Opens Zomato page and books a table at a restaurant
    ${final_status}    Set Variable    ${FALSE}
    FOR    ${i}    IN RANGE    0    2
        Reload APP
        Sleep    2
        ${Location_bs}    Get Environment Variable    TOP_LOCATION[${i}]  
        ${Location}    Convert To Lower Case    ${Location_bs}
        ${Location}    Split the Input Data    ${Location}    ,
        ${Hotel_bs}    Get Environment Variable    TOP_RESTAURANT[${i}]
        ${Hotel}    Convert To Lower Case    ${Hotel_bs}
        ${Hotel}    Split the Input Data    ${Hotel}    ${SPACE}

        ${App}    Get Environment Variable    APP
        ${Guest_Count}    Get Environment Variable    GUEST_COUNT
        ${DATE}    Get Environment Variable    DATE
        ${TIME_SLOT}    Get Environment Variable    TIME_SLOT
        ${TIMING}    Get Environment Variable    TIMING
        
        IF    '${App}' == 'Zomato'
            ${status}    Run Keyword And Return Status     Book Table at a Restaurant on Zomato    ${Location_bs}    ${Location}    ${Hotel_bs}    ${Hotel}    ${Guest_Count}    ${DATE}    ${TIME_SLOT}    ${TIMING}
        ELSE
            ${status}    Run Keyword And Return Status     Book Table at a Restaurant on Eazy Diner    ${Hotel_bs}    ${Hotel}    ${Guest_Count}    ${DATE}    ${TIME_SLOT}    ${TIMING}
        END
            
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

*** Keywords ***
Open APP
    ${URL}    Get Environment Variable    URLWITHCITY
    Open Browser    ${URL}    ${BROWSER}
    Delete All Cookies
    Maximize Browser Window

Reload APP
    ${URL}    Get Environment Variable    URLWITHCITY
    Go To    ${URL}    

Split the Input Data
    [Arguments]    ${Data}    ${separator}
    ${parts}=    Split String    ${Data}    separator=${separator}
    ${length}=    Get Length    ${parts}
    
    # Ensure there are exactly 3 parts
    ${first_three_parts}=    Set Variable    ${EMPTY}
    ${first_three_parts}=    Run Keyword If    ${length} >= 3    Create List    ${parts}[0]    ${parts}[1]    ${parts}[2]
    ...    ELSE IF    ${length} == 2    Create List    ${parts}[0]    ${parts}[1]    ${EMPTY}
    ...    ELSE IF    ${length} == 1    Create List    ${parts}[0]    ${EMPTY}    ${EMPTY}
    
    RETURN    ${first_three_parts}

Book Table at a Restaurant on Zomato
    [Documentation]    Book a table at a restaurant on Zomato
    [Arguments]    ${Location_bs}    ${Location}    ${Hotel_bs}    ${Hotel}    ${Guest_Count}    ${DATE}    ${TIME_SLOT}    ${TIMING}

    # Search Location  
    Log To Console    Suggested Location is: ${Location_bs}
    Wait Until Element Is Visible    ${LOCATION_INPUT}
    Clear Element Text    ${LOCATION_INPUT}
    Click Element    ${LOCATION_INPUT}
    Input Text    ${LOCATION_INPUT}    ${location_bs}
    Sleep    5s    # Wait for location suggestions to appear
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //p[(contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Location[0]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Location[1]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Location[2]}"))]    10s
    Should Be True    ${status}    Location not found
    IF    ${status} == True
        Click Element    //p[(contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Location[0]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Location[1]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Location[2]}"))]
    END
    Sleep    5
    Log To Console    Location set to: ${location_bs}
    
    # Search Restaurant
    Log To Console    Suggested Restaurant is: ${Hotel_bs}
    Wait Until Element Is Visible    ${SEARCH_INPUT}
    Click Element    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${Hotel_bs}
    Sleep    10    # Wait for search results to appear
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //p[(contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[0]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[1]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[2]}"))]     10s
    Should Be True    ${status}    Restaurant not found
    IF    ${status} == True
        Click Element    //p[(contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[0]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[1]}") and contains(translate(text(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[2]}"))]
    END  
    Sleep    5
    Log To Console    Restaurant set to: ${Hotel_bs}

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
    
Book Table at a Restaurant on Eazy Diner
    [Documentation]    Book a table at a restaurant on Eazy Diner
    [Arguments]    ${Hotel_bs}    ${Hotel}    ${Guest_Count}    ${DATE}    ${TIME_SLOT}    ${TIMING}
    
    # Search Restaurant
    Log To Console    Suggested Restaurant is: ${Hotel_bs}
    Wait Until Element Is Visible    ${ED_SEARCH_INPUT}    10s
    Click Element    ${ED_SEARCH_INPUT}
    Wait Until Element Is Visible    ${ED_TYPE_INPUT}    10s
    Clear Element Text    ${ED_TYPE_INPUT}
    Input Text    ${ED_TYPE_INPUT}    ${Hotel_bs}
    Sleep    10    # Wait for search results to appear
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@class="city_name padding-b-5 black"][(contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[0]}") and contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[1]}") and contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[2]}"))]     10s
    Should Be True    ${status}    Restaurant not found
    IF    ${status} == True
        Click Element    //div[@class="city_name padding-b-5 black"][(contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[0]}") and contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[1]}") and contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), "${Hotel[2]}"))]
    END  
    Sleep    5
    Log To Console    Restaurant set to: ${Hotel_bs}
 
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${SLOT_SELECTOR}    10s
    Should Be True    ${status}    Reservation is not available at this Restaurant
    IF    ${status} == True
        Click Element    ${SLOT_SELECTOR}
    END
    Sleep    5
   
    #Selecting day
    Scroll Element Into View    //div[contains(@class, 'restaurantDetails_slot_boxes__kd7C4')]//div[(normalize-space(.)='${DATE}') or (normalize-space(.)='${DATE}')]
    Click Element    //div[contains(@class, 'restaurantDetails_slot_boxes__kd7C4')]//div[(normalize-space(.)='${DATE}') or (normalize-space(.)='${DATE}')]
 
    Sleep    5
    #Selecting time
    Scroll Element Into View    //div[contains(@class, 'restaurantDetails_day_text__6KzM0') and normalize-space(.) = '${TIMING}']
    Click Element    //div[contains(@class, 'restaurantDetails_day_text__6KzM0') and normalize-space(.) = '${TIMING}']
    
    Sleep    5
    #Guest Count
    Scroll Element Into View    //div[contains(@class, 'restaurantDetails_slot_boxes__kd7C4 ') and normalize-space(.) = '${Guest_Count}']
    Click Element    //div[contains(@class, 'restaurantDetails_slot_boxes__kd7C4 ') and normalize-space(.) = '${Guest_Count}']
 
    Sleep    5
    Click Button    ${FIND_BEST_OFFERS_BUTTON}
 
    Sleep    5
    Click Element    ${BOOK_FOR_FREE}
    Sleep    5