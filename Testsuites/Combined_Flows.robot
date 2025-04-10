*** Settings ***
Resource    ../resource/config.robot

Suite Setup       Test Open Browser
Suite Teardown    Close Browser

*** Test Cases ***

Test Case - Match Request Till Order Request With Mixed GUI And API Flow
    # Initial GUI flow till first order request
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}  
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button} 
    Sleep    5s
    click    ${Flag_XPATH}
    ${SOR}    Send residentialSwitchMatchConfirmation for IAS only with single SOR    ${Sent_Method_Value}    ${Sentby_Value}    ${MC_Date_Time_Value}    ${MC_Action_Value}    ${Implication_Sent_Value}
    Logoff From GUI
    
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    # Send second order request via API
    ${SCID2}    Get Source correlationID
    ${Planned_Switch_Date2}    Get Current Date In YYYY-MM-DD Format 
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date2}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    # Verify error in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Switch_Error_XPATH}
    Sleep    2s
    Logoff From GUI

Test Case - Match Request Till Cancellation With GRCP GUI And LRCP API Flow
    # Set up needed variable
    ${DCID}    Get Destination correlationID

    # GRCP Match Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    # LRCP Match Confirmation via API
    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    # GRCP Order Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format  
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    # LRCP Order Confirmation via API
    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    # GRCP Cancellation Request via GUI 
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    # LRCP Cancellation Confirmation via API
    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Request With GUI And API Flow
    # Initial GUI flow till trigger request
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}  
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${SOR}    Send residentialSwitchMatchConfirmation for IAS only with single SOR    ${Sent_Method_Value}    ${Sentby_Value}    ${MC_Date_Time_Value}    ${MC_Action_Value}    ${Implication_Sent_Value}
    Logoff From GUI
    
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderConfirmation
    Logoff From GUI

    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Activation_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderTriggerRequest    ${Activation_Date}
    Logoff From GUI

    # Send second trigger request via API
    ${SCID2}    Get Source correlationID
    ${Activation_Date2}    Get Current Date In YYYY-MM-DD Format
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate": "${Activation_Date2}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    # Verify error in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Switch_Error_XPATH}
    Sleep    2s
    Logoff From GUI

Test Case - Match Request Till Order Update Request With GUI And API Flow
    # Initial Match Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    # Match Confirmation via GUI
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}  
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${SOR}    Send residentialSwitchMatchConfirmation for IAS only with single SOR    ${Sent_Method_Value}    ${Sentby_Value}    ${MC_Date_Time_Value}    ${MC_Action_Value}    ${Implication_Sent_Value}
    Logoff From GUI
    
    # Order Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    # Order Confirmation via GUI
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderConfirmation
    Logoff From GUI

    # First Order Update via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${UR_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date}
    Logoff From GUI

    # Second Order Update via API
    ${SCID2}    Get Source correlationID
    ${UR_Date2}    Get Current Date In YYYY-MM-DD Format
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${UR_Date2}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    # Verify error in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Switch_Error_XPATH}
    Sleep    2s
    Logoff From GUI

# Switch Error Flows
Test Case - Match Request Till Trigger Confirmation With Mixed GUI And API Flow
    # Set up needed variable
    ${DCID}    Get Destination correlationID

    # GRCP Match Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    # LRCP Match Confirmation via API
    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    # GRCP Order Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    # LRCP Order Confirmation via API
    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    # GRCP Trigger Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Activation_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderTriggerRequest    ${Activation_Date}
    Logoff From GUI

    # LRCP Trigger Confirmation via API
    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation With Mixed GUI And API Flow
    # Set up needed variable
    ${DCID}    Get Destination correlationID

    # GRCP Match Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    # LRCP Match Confirmation via API
    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    # GRCP Order Request via GUI  
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    # LRCP Order Confirmation via API
    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    # GRCP Cancellation Request via GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    # LRCP Cancellation Confirmation via API 
    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Order Request With GUI And API
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    10s
    click    ${Switching_page}
    ${SCID}    Send Residential Switch Match Request
    Sleep    5s
    Logoff From GUI
    
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}  
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${SOR}    Send residentialSwitchMatchConfirmation for IAS only with single SOR    ${Sent_Method_Value}    ${Sentby_Value}    ${MC_Date_Time_Value}    ${MC_Action_Value}    ${Implication_Sent_Value}
    Logoff From GUI
    
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${Planned_Switch_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderRequest    ${Planned_Switch_Date}
    Logoff From GUI

    # Send second order request via API
    ${SCID2}    Get Source correlationID
    ${Planned_Switch_Date2}    Get Current Date In YYYY-MM-DD Format
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date2}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    # Verify error in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Switch_Error_XPATH}
    Sleep    2s
    Logoff From GUI

# Switch Error Flows

Test Case - Send Order Request With Unique SOR From API And Verify Error
# Set up needed variable and prepare unique SOR
    ${SCID}    Get Source correlationID
    ${Unique_SOR}    Get current date for SOR
    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format

    # Send order request via API with unique SOR
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${Unique_SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    # Verify 1201 error in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Switch_Error_XPATH}
    click    ${Switch_Error_XPATH}
    katalon_keywords.Element Should Contain    ${Faultcode_field}    ${1201}
    Sleep    2s
    Logoff From GUI

Test Case - Send Order Update Request With Unique SOR From API And Verify Error
    # Set up needed variable and prepare unique SOR
    ${SCID}    Get Source correlationID
    ${Unique_SOR}    Get current date for SOR
    ${UR_Date}    Get Current Date In YYYY-MM-DD Format

    # Send order update request via API with unique SOR
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${Unique_SOR}","plannedSwitchDate": "${UR_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    # Verify 1301 error in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Switch_Error_XPATH}
    click    ${Switch_Error_XPATH}
    katalon_keywords.Element Should Contain    ${Faultcode_field}    ${1301}
    Sleep    2s
    Logoff From GUI

# Unregistered CP Flows 

Test Case - Send Order Update Request With Unique SOR From HUB API And Unregistered CP
    # Set up needed variable and prepare unique SOR
    ${SCID}    Get Source correlationID
    ${Unique_SOR}    Get current date for SOR
    ${UR_Date}    Get Current Date In YYYY-MM-DD Format

    # Send order update request via HUB API with unregistered CP
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${Unique_SOR}","plannedSwitchDate": "${UR_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    # Verify order failure
    Login To GUI    ${GRCP_Email}    ${GRCP_Password} 
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Order_Failure_XPATH}
    katalon_keywords.Element Should Contain    ${Faultcode_field}    ${1301}
    Sleep    2s
    Logoff From GUI

Test Case - Send Order Request With Unique SOR From HUB API And Unregistered CP
    # Set up needed variable and prepare unique SOR
    ${SCID}    Get Source correlationID
    ${Unique_SOR}    Get current date for SOR
    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format

    # Send order request via HUB API with unregistered CP
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${Unique_SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    # Verify order failure with 1201 fault code in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password} 
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    Element Should Be Visible    ${Order_Failure_XPATH}
    katalon_keywords.Element Should Contain    ${Faultcode_field}    ${1201}
    Sleep    2s
    Logoff From GUI

Test Case - Send Order Trigger Request With Unique SOR From HUB API And Unregistered CP
    # Set up needed variable and prepare unique SOR 
    ${SCID}    Get Source correlationID
    ${Unique_SOR}    Get current date for SOR
    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format

    # Send trigger request via HUB API with unregistered CP
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${Unique_SOR}","activationDate": "${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    # Verify order failure with 1401 fault code in GUI
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button} 
    Sleep    5s
    Element Should Be Visible    ${Order_Failure_XPATH}
    katalon_keywords.Element Should Contain    ${Faultcode_field}    ${1401}
    Sleep    2s
    Logoff From GUI

