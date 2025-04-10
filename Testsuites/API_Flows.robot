*** Settings ***
Resource    ../resource/config.robot

*** Variables ***

# ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
# ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
# ${Residential Switch Match Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchMatchFailure": {"faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
# ${Residential Switch Order Request}    Cantenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
# ${Residential Switch Order Confirmation}    Cantenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
# ${Residential Switch Order Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
# ${Residential Switch Update Request}    Cantenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
# ${Residential Switch Update Confirmation}    Cantenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
# ${Residential Switch Update Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderUpdateFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
# ${Residential Switch Trigger Request}    Cantenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
# ${Residential Switch Trigger Confirmation}    Cantenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
# ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
# ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
# ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
# ${Residential Switch Cancellation Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderCancellationFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}

*** Test Cases ***

# API Flows
# Both CP Registered to MAG

Test Case - Match Request Till Trigger with Failed First Update for Both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID 
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1301
    ${Fault_Text}    Set Variable    Invalid or missing planned switch date
    ${Residential Switch Update Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderUpdateFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Failure}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation with Both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation Failure with Both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1505
    ${Fault_Text}    Set Variable    Switch order has already been cancelled
    ${Residential Switch Cancellation Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderCancellationFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Failure}
    Sleep    5s
    
Test Case 1
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s
    Log To Console    ${SCID1}

Test Case - Match Request Till Cancellation with Both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID 
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s


Test Case - Match Request Till Cancellation With Two Order Updates For Both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation with Both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 2
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 3
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation with both CPs registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation with Order Update with Both CPs registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s
    
    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation with Trigger Failure when both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation with Order Update when both CPs registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation Confirmation with One Trigger Failure when both CPs Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s


Test Case 4 - Match Request and Match Failure
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s
    # Verify message is stored in DB    ${SCID1}    2    Residential Switch Match Request

    ${Fault_Code}    Set Variable    1101
    ${Fault_Text}    Set Variable    Missing or incomplete address
    
    ${Residential Switch Match Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchMatchFailure": {"faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Failure}
    Sleep    5s
    # Verify message is stored in DB    ${SCID1}    2    Residential Switch Match Failure

Test Case 5 - Match Request and Second Order Success
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1201
    ${Fault_Text}    Set Variable    Invalid or missing switch order reference
    ${Residential Switch Order Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Failure}
    Sleep    5s

    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 6 - Match Request to Cancel with Update
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 7 - Match Request to Trigger with Failed First Trigger
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation} 
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 8 - Match Request to Cancel with Single Update
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 9 - Match Request Till Order Update Request
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

Test Case 10 - Match Request Till Cancellation with Two Order Updates
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request} 
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 11 - Match Request Till Trigger Failure
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403  
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

Test Case 12 - Match Request to Trigger with Failed Update Request
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1301
    ${Fault_Text}    Set Variable    Invalid or missing planned switch date
    ${Residential Switch Update Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderUpdateFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Failure}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 13 - Match Request to Trigger with Failed Cancellation
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1505
    ${Fault_Text}    Set Variable    Switch order has already been cancelled
    ${Residential Switch Cancellation Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderCancellationFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Failure}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 14 - Match Request Till Cancellation with Cancel Failure After Order Confirmation
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1504
    ${Fault_Text}    Set Variable    Switch order cannot be cancelled
    ${Residential Switch Cancellation Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderCancellationFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Failure}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 15 - Match Request Till Cancellation confirmation When Trigger Failure Received After Update
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s
    
Test Case 18 - Match Request to Trigger Confirmation With CP to CP
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation} 
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s
    
Test Case 19 - Match Request to Cancel Confirmation From CP to CP
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format  
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 22 - Match Request to Trigger Confirmation with Order Failure
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1201
    ${Fault_Text}    Set Variable    Invalid or missing switch order reference
    ${Residential Switch Order Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Failure}
    Sleep    5s

    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 25 - Match Request Till Cancellation with Order Update when both CPs registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID 
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

# LRCP Not Registered to MAG

Test Case 16 - Match Request From CP and Match Failure from HUB
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1101
    ${Fault_Text}    Set Variable    Missing or incomplete address
    ${Residential Switch Match Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchMatchFailure": {"faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Failure}
    Sleep    5s

Test Case 17 - Match Request to Trigger Confirmation From CP to Hub
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger with Failed Cancel Request for LRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1505
    ${Fault_Text}    Set Variable    Switch order has already been cancelled
    ${Residential Switch Cancellation Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderCancellationFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Failure}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation For LRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger with Failed Update Request
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Request} 
    Sleep    5s

    ${Fault_Code}    Set Variable    1301
    ${Fault_Text}    Set Variable    Invalid or missing planned switch date
    ${Residential Switch Update Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderUpdateFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Failure}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 20 - LRCP to HUB Match Request to Cancellation
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 23 - Match Request From LRCP Till Trigger with Failed First Trigger
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Confirmation}
    Sleep    5s


# GRCP Not Registered to MAG

Test Case 21 - HUB to LRCP Match Request to Trigger Confirmation
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 24 - Match Request Till Cancellation with Hub Credentials
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case 27 - Match Request Till Trigger Confirmation with Failed Order Update when GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s 

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID 
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1301
    ${Fault_Text}    Set Variable    Invalid or missing planned switch date
    ${Residential Switch Update Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderUpdateFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Failure}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation From Hub
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request} 
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case 26 - HUB to LRCP Match Request to Trigger with Two Order Updates
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation Confirmation with GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation with Order Update for GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s


Test Case - Match Request Till Cancellation Confirmation with Order Update for GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s


Test Case - Match Request Till Cancellation With Order Update and Trigger Failure for GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Cancellation flow with GRCP Not Registered to MAG and Order Update
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${SCID3}    Get Source correlationID
    ${Residential Switch Update Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderUpdateRequest"},"residentialSwitchOrderUpdateRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Update Request}
    Sleep    5s

    ${Residential Switch Update Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID3}"},"routingID": "residentialSwitchOrderUpdateConfirmation"},"residentialSwitchOrderUpdateConfirmation": {"switchOrderReference": "${SOR}","status":"updated"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Update Confirmation}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s
    
Test Case - Match Request Till Cancellation With Trigger Failure for GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation} 
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    Sleep    5s

    ${SCID5}    Get Source correlationID
    ${Residential Switch Cancellation Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${EMPTY}"},"routingID": "residentialSwitchOrderCancellationRequest"},"residentialSwitchOrderCancellationRequest": {"switchOrderReference": "${SOR}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Cancellation Request}
    Sleep    5s

    ${Residential Switch Cancellation Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID5}"},"routingID": "residentialSwitchOrderCancellationConfirmation"},"residentialSwitchOrderCancellationConfirmation": {"switchOrderReference": "${SOR}","status":"cancelled"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Cancellation Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Failure With Order Failure for GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1201
    ${Fault_Text}    Set Variable    Invalid or missing switch order reference
    ${Residential Switch Order Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Failure}
    Sleep    5s

    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Fault_Code}    Set Variable    1403
    ${Fault_Text}    Set Variable    Invalid or missing activation date
    ${Residential Switch Trigger Failure}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerFailure","auditData": [{"name": "faultCode","value": "${Fault_Code}"}]},"residentialSwitchOrderTriggerFailure": {"switchOrderReference": "${SOR}","faultCode": "${Fault_Code}","faultText": "${Fault_Text}"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Failure}
    
    
Test Case 28 - Match Request Till Trigger Confirmation with GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

Test Case - Match Request Till Trigger Confirmation with GRCP Not Registered to MAG
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","action": "cease"}]}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Match Request}
    Sleep    5s

    ${SOR}    Get current date for SOR
    ${Residential Switch Match Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID1}"},"routingID": "residentialSwitchMatchConfirmation"},"residentialSwitchMatchConfirmation": {"implicationsSent":[{"sentMethod":"sms","sentTo":"704****661","sentBy":"2025-03-06 11:15:37"}],"matchResult":{"switchOrderReference": "${SOR}","services":[{"serviceType":"IAS","switchAction":"ServiceFound"}]}}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Match Confirmation}
    Sleep    5s

    ${Planned_Switch_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID2}    Get Source correlationID
    ${Residential Switch Order Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID":"residentialSwitchOrderRequest"},"residentialSwitchOrderRequest": {"switchOrderReference": "${SOR}","plannedSwitchDate": "${Planned_Switch_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Order Request}
    Sleep    5s

    ${Residential Switch Order Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID2}"},"routingID": "residentialSwitchOrderConfirmation"},"residentialSwitchOrderConfirmation": {"switchOrderReference": "${SOR}","status":"confirmed"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Order Confirmation}
    Sleep    5s

    ${Activation_Date}    Get Current Date In YYYY-MM-DD Format
    ${SCID4}    Get Source correlationID
    ${Residential Switch Trigger Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"destination": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchOrderTriggerRequest"},"residentialSwitchOrderTriggerRequest": {"switchOrderReference": "${SOR}","activationDate":"${Activation_Date}"}}
    Post the Message in HUB URL    ${MPCS_HUBClient_ID}    ${MPCS_HUBSecret_ID}    ${Residential Switch Trigger Request}
    Sleep    5s

    ${Residential Switch Trigger Confirmation}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${LRCP_CPID}","correlationID": "${DCID}"},"destination": {"type": "RCPID","identity": "${Unregistered_CP}","correlationID": "${SCID4}"},"routingID": "residentialSwitchOrderTriggerConfirmation"},"residentialSwitchOrderTriggerConfirmation": {"switchOrderReference": "${SOR}","status":"triggered"}}
    Post the Message in CP URL    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${Residential Switch Trigger Confirmation}
    Sleep    5s

