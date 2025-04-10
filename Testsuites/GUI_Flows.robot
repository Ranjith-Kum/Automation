*** Settings ***
Resource    ../resource/config.robot

Suite Setup       Test Open Browser
Suite Teardown    Close Browser

*** Test Cases ***

# GUI Process Flow Testcases With Manual Match Confirmation



Test Case - Full Flow Till Trigger Confirmation With One Order Update
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    ${UR_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case 1 - Login and Send Match Request 
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow With Cancellation
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI
    
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow With Order Update
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    ${UR_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation 
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
    
    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow With Two Order Updates And Cancellation
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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

    # First Order Update
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${UR_Date1}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date1}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation 
    Logoff From GUI

    # Second Order Update
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button} 
    Sleep    5s
    click    ${Flag_XPATH}
    ${UR_Date2}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date2}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation
    Logoff From GUI

    # Cancellation
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Trigger Failure
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1401}
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Cancellation Failure
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1501}
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow with Trigger Failure After Order Flow And Cancellation
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1401}
    Logoff From GUI
    
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow till Trigger Confirmation With Cancellation Failure After Order Update
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    click    ${Switching_page}
    Sleep    5s
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
    ${UR_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s 
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation
    Logoff From GUI

    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationRequest 
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1501}
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Trigger Confirmation With Order Failure For First Order Request
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    Send residentialSwitchOrderFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1201}
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Match Failure
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    Send residentialSwitchMatchFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1101}
    Logoff From GUI

Test Case - Full Flow Till Trigger Failure With Order Failure For First Order Request
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    Send residentialSwitchOrderFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1201}
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1401}
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Cancellation With Order Update Failure For First Update Request
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    ${UR_Date}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderUpdateFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1301}
    Logoff From GUI
    
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${UR_Date2}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date2}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation
    Logoff From GUI

    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password} 
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Trigger Confirmation
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Trigger With Two Order Update And First Update Failure
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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

    # First Order Update with Failure
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${UR_Date1}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date1}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderUpdateFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1301}
    Logoff From GUI

    # Second Order Update
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    ${UR_Date2}    Get Current Date In DD-MM-YYYY Format
    Send residentialSwitchOrderUpdateRequest    ${UR_Date2}
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send ResidentialSwitchOrderUpdateConfirmation
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

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderTriggerConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

Test Case - Full Flow Till Cancellation With Order Failure For First Order Request
    Login To GUI    ${GRCP_Email}    ${GRCP_Password}
    Sleep    5s
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
    Send residentialSwitchOrderFailure    ${Auditdata_name_Input}    ${Auditdata_value_Input}    ${1201}
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
    Send residentialSwitchOrderCancellationRequest
    Logoff From GUI

    Login To GUI    ${LRCP_Email}    ${LRCP_Password}
    Sleep    5s
    type    ${SourceCorrelation_textbox}    ${SCID}
    click    ${Retrive_button}
    Sleep    5s
    click    ${Flag_XPATH}
    Send residentialSwitchOrderCancellationConfirmation
    Logoff From GUI

    Log    Switch Order Reference: ${SOR}

