*** Settings ***
Resource    ../resource/config.robot

*** Keywords ***

Test Open Browser
    Open Browser And Maximize Window    ${Application_URL}    ${BROWSER}    ${HEADLESS}    ${JENKINS_BOOL}    ${REMOTE_DOWNLOAD_FILEPATH}    ${REMOTE_DOWNLOAD_URL}

Post the Message in CP URL
    [Arguments]    ${username}    ${password}    ${inputs}
    ${auth}    Create List    ${username}    ${password}
    Create Session    mysession    ${base_url}    auth=${auth}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    
    ${data}=    Create Dictionary    grant_type=client_credentials    scope=default
    ${response}    POST On Session    mysession    ${AUTH_URL}    data=${data}    headers=${headers}        
    Log    ${response.content}
    ${token}=    Set Variable    ${response.json()["access_token"]}
    Log    Bearer token: ${token}
 
    ${headers}    Create Dictionary    Authorization    Bearer ${token}
    Create Session    Example    ${base_url}    headers=${headers}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    Example    ${SWITCH_ENDPOINT}    data=${inputs}    headers=${headers}
    ${status_code}    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    202    Status Code Mismatch

Post the Message in HUB URL
    [Arguments]    ${username}    ${password}    ${inputs}
    ${auth}    Create List    ${username}    ${password}
    Create Session    mysession    ${base_url}    auth=${auth}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    
    ${data}=    Create Dictionary    grant_type=client_credentials    scope=default
    ${response}    POST On Session    mysession    ${HUB_AUTH_URL}    data=${data}    headers=${headers}        
    Log    ${response.content}
    ${token}=    Set Variable    ${response.json()["access_token"]}
    Log    Bearer token: ${token}
 
    ${headers}    Create Dictionary    Authorization    Bearer ${token}
    Create Session    Example    ${base_url}    headers=${headers}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    Example    ${HUB_SWITCH_ENDPOINT}    data=${inputs}    headers=${headers}
    ${status_code}    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    202    Status Code Mismatch

Get Query Response
    [Arguments]    ${username}    ${password}    ${inputs}
    ${auth}    Create List    ${username}    ${password}
    Create Session    mysession    ${base_url}    auth=${auth}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded    
    ${data}=    Create Dictionary    grant_type=client_credentials    scope=default
    ${response}    POST On Session    mysession    ${AUTH_URL}    data=${data}    headers=${headers}        
    Log    ${response.content}
    ${token}=    Set Variable    ${response.json()["access_token"]}
    Log    Bearer token: ${token}
 
    ${headers}    Create Dictionary    Authorization    Bearer ${token}
    Create Session    Example    ${base_url}    headers=${headers}
    ${headers}    Create Dictionary    Content-Type=application/json
    ${response}    POST On Session    Example    ${MRQ_ENDPOINT}    data=${inputs}    headers=${headers}    expected_status=anything
    ${response}    Set Variable    ${response.json()["matchRequestQueryResponse"]}
    ${data}    Convert To Dictionary    ${response}
    ${Response_Code}    Get From Dictionary    ${data}    responseCode
    ${Response_Text}    Get From Dictionary    ${data}    responseText
    RETURN    ${Response_Code}    ${Response_Text}

Get Source and Destination correlationID
    ${current_date}=    Get Current Date    result_format=%Y%m%d%H%M%S%f
    ${final_date1}=    Set Variable    ${GRCP_CPID}${current_date}
    ${final_date2}=    Set Variable    ${LRCP_CPID}${current_date}
    RETURN    ${final_date1}    ${final_date2}

Get Source correlationID
    ${current_date}=    Get Current Date    result_format=%Y%m%d%H%M%S%f
    ${final_date1}=    Set Variable    ${GRCP_CPID}${current_date}
    RETURN    ${final_date1}

Get Destination correlationID
    ${current_date}=    Get Current Date    result_format=%Y%m%d%H%M%S%f
    ${final_date1}=    Set Variable    ${GRCP_CPID}${current_date}
    RETURN    ${final_date1}

Get Current Date In DD-MM-YYYY Format
    ${date}    Get Current Date    result_format=%d-%m-%Y
    RETURN    ${date}

Get Current Date In YYYY-MM-DD Format
    ${date}    Get Current Date    result_format=%Y-%m-%d
    RETURN    ${date}

Get current date for SOR
    ${current_date}    Get Current Date
    Log    ${current_date}
    ${current_date}    Convert To String    ${current_date}
    ${current_date}    Get Substring    ${current_date}    0    17
    ${current_date}    Remove String    ${current_date}    ${SPACE}    :    -
    Log    36ed9821-a39b-45f9-8001-${current_date}
    RETURN    36ed9821-a39b-45f9-8001-${current_date}

Scroll Up
    selenium library.Execute Javascript    window.scrollTo(0,10);
 
Scroll Down
    selenium library.Execute Javascript    window.scrollTo(0,350);
 
Scroll Down Further
    selenium library.Execute Javascript    window.scrollTo(0,500);
 
Scroll to bottom
    selenium library.Execute Javascript    window.scrollTo(0,document.body.scrollHeight);

# Verify message is stored in DB
#     [Arguments]    ${sourceCorrelationID}    ${count}    ${msg}
#     Open Connection    ${DB_HOST}    prompt=$    
#     Login    ${DB_HOST_UNAME}    ${DB_HOST_PWD}
#     ${cons_output}    Execute Command    cd ${DYNAMO_DB_PATH} ; ./aws dynamodb query --table-name ${Table_ENV}_mag_switch_message --key-condition-expression "owner_requestCorrelationID = :emailValue" --filter-expression "routingID = :message" --expression-attribute-values '{":emailValue":{"S":"${GRCP_CPID}#${sourceCorrelationID}"},":message":{"S":"${msg}"}}'
#     ${cons_output}    Convert String To Json    ${cons_output}
#     ${db_output1}    Get Value From Json    ${cons_output}    Count
#     Log    ${db_output1}[0]
#     ${cons_output}    Execute Command    cd ${DYNAMO_DB_PATH} ; ./aws dynamodb query --table-name ${Table_ENV}_mag_switch_message --key-condition-expression "owner_requestCorrelationID = :emailValue" --filter-expression "routingID = :message" --expression-attribute-values '{":emailValue":{"S":"${LRCP_CPID}#${sourceCorrelationID}"},":message":{"S":"${msg}"}}'
#     ${cons_output}    Convert String To Json    ${cons_output}
#     ${db_output2}    Get Value From Json    ${cons_output}    Count
#     Log    ${db_output2}[0]
#     ${db_output}    Set Variable    ${${db_output1}[0]+${db_output2}[0]}
#     Should Be Equal As Integers    ${db_output}    ${count}    Message not stored in DB

Login To GUI
    [Arguments]    ${RCP_Email}    ${RCP_Password}
    katalon_keywords.Go to    ${Application_URL}
    waitForVisible    ${EMAIL_textbox}
    type    ${EMAIL_textbox}    ${RCP_Email}
    type    ${PWD_textbox}    ${RCP_Password}
    click    ${LOGIN_button}
    ${status}    Run Keyword And Return Status    katalon_keywords.Wait Until Element Is Visible    ${Worklist_page}    10s
    IF    "${status}" == "False"
        click    ${LOGIN_button}
        Sleep    2s
        katalon_keywords.Wait Until Element Is Visible    ${Worklist_page}    10s
    END
    
Logoff From GUI
    Sleep    1
    click    ${LOG_OFF_button}
    Sleep    1
    click    ${LOG_OFF_confirmation_ok}
    waitForVisible    ${LOGIN_button}

Send Residential Switch Match Request
    ${Input}    Load Json From File    ${EXECDIR}/keywords/match_request.json
    Sleep    5
    click    ${Switching_page}
    Sleep    5
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchMatchRequest
    ${Source_Type}    Get Value From Json    ${Input}    $.envelope.source.type
    type    ${Source_Type_XPATH}    ${Source_Type[0]}
    ${Destination_Type}    Get Value From Json    ${Input}    $.envelope.destination.type
    type    ${Destination_Type_XPATH}    ${Destination_Type[0]}
    Set Selenium Implicit Wait    10
    Scroll Down Further
    ${LRCP_CP_ID_Value}    Get Value From Json    ${Input}    $.envelope.destination.identity
    type    ${Desination_ID_XPATH}    ${LRCP_CP_ID_Value[0]}
    Set Selenium Implicit Wait    10
    Scroll Down Further
    ${GRCP_BRAND_NAME}    Get Value From JSON    ${Input}    $.residentialSwitchMatchRequest.grcpBrandName
    type    ${GRCP_BRAND_NAME_XPATH}    ${GRCP_BRAND_NAME[0]}
    ${Name}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.name
    type    ${Name_XPATH}    ${Name[0]}
    ${Account_Value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.account
    type    ${Account_XPATH}    ${Account_Value[0]}
    ${UPRN_Value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.uprn
    type    ${UPRN_XPATH}    ${UPRN_Value[0]}
    ${subBuildingName_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.subBuildingName
    type    ${SubBuilding_Name_XPATH}    ${subBuildingName_value[0]}
    ${BuildingName_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.buildingName
    type    ${Building_Name_XPATH}    ${BuildingName_value[0]}
    ${BuildingNumber_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.buildingNumber
    type    ${Building_Number_XPATH}    ${BuildingNumber_value[0]}
    ${DependentThoroughgfare_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.dependentThoroughgfare
    type    ${Dependent_Thoroughgfare_XPATH}    ${DependentThoroughgfare_value[0]}
    ${Thoroughgfare_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.thoroughgfare
    type    ${Thoroughgfare_XPATH}    ${Thoroughgfare_value[0]}
    ${DoubleDependentLocality_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.doubleDependentLocality
    type    ${Double_Dependent_Locality_XPATH}    ${DoubleDependentLocality_value[0]}
    ${DependentLocality_value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.dependentLocality
    type    ${Dependent_Locality_XPATH}    ${DependentLocality_value[0]}
    ${Post_Town_Value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.postTown
    type    ${Post_Town_XPATH}    ${Post_Town_Value[0]}
    ${Post_Code_Value}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.address.postCode
    type    ${Post_Code_XPATH}    ${Post_Code_Value[0]}
    Set Selenium Implicit Wait    10
    selenium library.Execute Javascript    window.scrollTo(0,700);
    ${Service_Type_Value0}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.services[0].serviceType
    Select    ${Service_Type_XPATH0}    ${Service_Type_Value0[0]}
    ${Action_Value0}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.services[0].action
    Select    ${Action_XPATH0}    ${Action_Value0[0]}
    ${Service_Identifier_Value0}    Get Value From Json    ${Input}    $.residentialSwitchMatchRequest.services[0].serviceIdentifier
    type    ${Service_Identifier_XPATH0}    ${Service_Identifier_Value0[0]}
    Set Selenium Implicit Wait    10
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    3
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
    ${sourceCorrelationID}    SeleniumLibrary.Get Element Attribute    ${Get_SCID_XPATH}    value
    RETURN    ${sourceCorrelationID}

Send residentialSwitchMatchConfirmation for IAS only with single SOR
    [Arguments]    ${Sent_Method}    ${Sentby}    ${MC_Date_Time}    ${MC_Action}    ${Implication_Sent}
    Set Selenium Implicit Wait    10
    Scroll Down
    Set Selenium Implicit Wait    10
    verifyText    ${Routing_ID}    Residential Switch Match Confirmation
    select    ${Sent_Method_XPATH}    ${Sent_Method}
    type    ${Sentby_XPATH}    ${Sentby}
    type    ${MC_Date_XPATH}    ${MC_Date_Time}
    type    ${MC_Implications_XPTH}    ${Implication_Sent}
    Scroll to bottom
    Set Selenium Implicit Wait    10
    select    ${Switch_Action_XPATH0}    ${MC_Action}
    Scroll to bottom
    Sleep    5
    click    ${Send_button}
    Sleep    3
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
    ${switchOrderReference}    SeleniumLibrary.Get Element Attribute    ${Get_SOR_XPATH}    value
    RETURN    ${switchOrderReference}
 
Send residentialSwitchOrderRequest
    [Arguments]    ${Planned_Switch_Date}
    Set Selenium Implicit Wait    10
    Scroll Down
    select    ${Routing_ID}     residentialSwitchOrderRequest
    Set Selenium Implicit Wait    10
    type    ${Planned_Switch_Date_XPATH}    ${Planned_Switch_Date}
    Scroll to bottom
    Sleep    5
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderConfirmation
    Scroll Down
    verifyText    ${Routing_ID}     Residential Switch Order Confirmation
    select    ${Status_field}    confirmed
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderUpdateRequest
    [Arguments]    ${UR_Date}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}     residentialSwitchOrderUpdateRequest
    Set Selenium Implicit Wait    10
    type    ${Planned_Switch_Date_XPATH}    ${UR_Date}
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send ResidentialSwitchOrderUpdateConfirmation
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderUpdateConfirmation
    select    ${Status_field}    updated
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderTriggerRequest
    [Arguments]    ${Activation_Date}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderTriggerRequest
    Set Selenium Implicit Wait    10
    type    ${Activation_Date_XPATH}    ${Activation_Date}
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderTriggerConfirmation
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderTriggerConfirmation
    select    ${Status_field}    triggered
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderCancellationRequest
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderCancellationRequest
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderCancellationConfirmation
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderCancellationConfirmation
    select    ${Status_field}    cancelled  
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}  
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchMatchFailure
    [Arguments]    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${Fault_code}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchMatchFailure
    type    ${Auditdata_name_XPATH}    ${Auditdata_name_Input}
    type    ${Auditdata_value_XPATH}    ${Auditdata_value_Input}
    Scroll to bottom
    select    ${Faultcode_field}    ${Fault_code}
    Scroll to bottom
    Set Selenium Implicit Wait    10
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderFailure
    [Arguments]    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${Fault_code}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderFailure
    Set Selenium Implicit Wait    10
    type    ${Auditdata_name_XPATH}    ${Auditdata_name_Input}
    type    ${Auditdata_value_XPATH}    ${Auditdata_value_Input}
    Scroll to bottom
    select    ${Faultcode_field}    ${Fault_code}
    Scroll to bottom
    Sleep    5
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderUpdateFailure
    [Arguments]    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${Fault_code}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderUpdateFailure
    type    ${Auditdata_name_XPATH}    ${Auditdata_name_Input}    
    type    ${Auditdata_value_XPATH}    ${Auditdata_value_Input}
    Scroll to bottom
    select    ${Faultcode_field}    ${Fault_code}
    Scroll to bottom
    Sleep    5
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderTriggerFailure
    [Arguments]    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${Fault_code}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderTriggerFailure
    type    ${Auditdata_name_XPATH}    ${Auditdata_name_Input}
    type    ${Auditdata_value_XPATH}    ${Auditdata_value_Input}
    Scroll to bottom
    select    ${Faultcode_field}    ${Fault_code}
    Scroll to bottom
    Sleep    5
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent
 
Send residentialSwitchOrderCancellationFailure
    [Arguments]    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${Fault_code}
    Scroll Down
    Set Selenium Implicit Wait    10
    select    ${Routing_ID}    residentialSwitchOrderCancellationFailure
    type    ${Auditdata_name_XPATH}    ${Auditdata_name_Input}
    type    ${Auditdata_value_XPATH}    ${Auditdata_value_Input}
    Scroll to bottom
    select    ${Faultcode_field}    ${Fault_code}
    Scroll to bottom
    Sleep    5
    click    ${Send_button}
    Sleep    2
    ${SuccessAlertPresent}    Run Keyword And Return Status    katalon_keywords.verifyValue    ${Sucess_msg_XPATH}    Message sent.
    Should Be Equal As Strings    ${SuccessAlertPresent}    True    Message not sent