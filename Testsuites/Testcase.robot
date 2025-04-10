*** Settings ***
Resource          ../resource/config.robot
Resource          ../resource/locators.robot
Resource          ../keywords/common_keywords.robot
Resource          ../keywords/katalon_keywords.robot

*** Test Cases ***

TC022 - Test postcode format validation
    [Documentation]    Validates postcode format validation rules
    [Tags]    validation    postcode
    
    # Login to application
    Test Open Browser
    Input Text    ${EMAIL_textbox}    ${GRCP_Email}
    Input Password    ${PWD_textbox}    ${GRCP_Password}
    Click Button    ${LOGIN_button}
    
    # Navigate to Switching page
    Wait Until Element Is Visible    ${Switching_page}
    Click Element    ${Switching_page}
    
    # Enter invalid postcode
    Input Text    ${Post_Code_XPATH}    123456
    
    # Verify error message for invalid format
    Wait Until Element Is Visible    ${Alert_errmsg_XPATH}
    Element Should Contain    ${Alert_errmsg_XPATH}    Invalid postcode format
    
    # Enter valid postcode
    Clear Element Text    ${Post_Code_XPATH}
    Input Text    ${Post_Code_XPATH}    SW01 0BB
    
    # Verify error message disappears
    Wait Until Element Is Not Visible    ${Alert_errmsg_XPATH}
    
    # Close browser
    Close Browser

TC001 - Validate successful generation of Gaining Provider Initial Request message
    [Documentation]    Validates the successful generation of Gaining Provider Initial Request message
    [Tags]    gaining_provider    request_message
    
    # Login to application
    Test Open Browser
    Input Text    ${EMAIL_textbox}    ${GRCP_Email}
    Input Password    ${PWD_textbox}    ${GRCP_Password}
    Click Button    ${LOGIN_button}
    
    # Navigate to Switching page
    Wait Until Element Is Visible    ${Switching_page}
    Click Element    ${Switching_page}
    
    # Select source and destination details
    Select From List By Value    ${Source_Type_XPATH}    RCPID
    Select From List By Value    ${Destination_Type_XPATH}    RCPID
    Input Text    ${Desination_ID_XPATH}    ${LRCP_CPID}
    
    # Enter customer details
    Input Text    ${GRCP_BRAND_NAME_XPATH}    Freds Communications Ltd (Telesales)
    Input Text    ${Name_XPATH}    RAA
    Input Text    ${Account_XPATH}    20001
    Input Text    ${UPRN_XPATH}    10001
    
    # Enter address details
    Input Text    ${SubBuilding_Name_XPATH}    Apa1
    Input Text    ${Building_Name_XPATH}    Build1
    Input Text    ${Building_Number_XPATH}    Num1
    Input Text    ${Dependent_Thoroughgfare_XPATH}    DTfare1
    Input Text    ${Thoroughgfare_XPATH}    Tfare1
    Input Text    ${Double_Dependent_Locality_XPATH}    Ddlocala
    Input Text    ${Dependent_Locality_XPATH}    Dlocala
    Input Text    ${Post_Town_XPATH}    bba
    Input Text    ${Post_Code_XPATH}    SW01 0BB
    
    # Add service details
    Select From List By Value    ${Service_Type_XPATH0}    IAS
    Input Text    ${Service_Identifier_XPATH0}    ONTONT1234567801
    Select From List By Value    ${Action_XPATH0}    cease
    
    # Send the request
    Click Element    ${Send_button}
    
    # Verify success message
    Wait Until Element Is Visible    ${Sucess_msg_XPATH}
    Element Should Contain    ${Sucess_msg_XPATH}    Message sent.
    
    # Get the source correlation ID for verification
    ${sourceCorrelationID}    Get Element Attribute    ${Get_SCID_XPATH}    value
    Should Not Be Empty    ${sourceCorrelationID}
    
    # Close browser
    Close Browser



*** Keywords ***
Scroll Down
    Execute JavaScript    window.scrollTo(0,document.body.scrollHeight)