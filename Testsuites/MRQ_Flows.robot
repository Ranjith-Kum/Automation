*** Settings ***
Resource    ../resource/config.robot

*** Variables ***
# ${MRQ_input}    Catenate    SEPARATOR=    {"matchRequestQuery": {"account": "${Account}","serviceIdentifier": "${Identifier}"}}

*** Test Cases ***

Test case 1
    ${Account}    Set Variable    123456
    ${Identifier}    Set Variable    123456
    ${MRQ_input}    Catenate    SEPARATOR=    {"matchRequestQuery": {"account": "${Account}","serviceIdentifier": "${Identifier}"}}
    ${Response_Code}    ${Response_Text}    Get Query Response    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${MRQ_input}
    Set Test Message    Verification completed and response code is ${Response_Code} and response text is ${Response_Text}

Test case 2
    ${Account}    Set Variable    123456
    ${Identifier}    Set Variable    123456
    ${MRQ_input}    Catenate    SEPARATOR=    {"matchRequestQuery": {"account": "${Account}","serviceIdentifier": "${Identifier}"}}
    ${Response_Code}    ${Response_Text}    Get Query Response    ${LRCP_CLIENT_ID}    ${LRCP_CLIENT_SECRET}    ${MRQ_input}
    Set Test Message    Verification completed and response code is ${Response_Code} and response text is ${Response_Text}


Match Flow And Query Test
    # First perform match request flow
    ${SCID1}    ${DCID}    Get Source and Destination correlationID

    ${Residential Switch Match Request}    Catenate    SEPARATOR=    {"envelope": {"source": {"type": "RCPID","identity": "${GRCP_CPID}","correlationID": "${SCID1}"},"destination": {"type": "RCPID","identity":"${LRCP_CPID}","correlationID": ""},"routingID": "residentialSwitchMatchRequest"},"residentialSwitchMatchRequest": {"grcpBrandName": "","name": "RAA","account":"1234","address": {"addressLines": ["Num1","Build1","","Tfare1","","Dlocala"],"postTown": "bba","postCode": "SW01 0BB"},"services": [{"serviceType": "IAS","serviceIdentifier": "6789","action": "cease"}]}}
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

    # Then perform query request
    ${Account}    Set Variable    1234
    ${Identifier}    Set Variable    6789
    ${MRQ_input}    Catenate    SEPARATOR=    {"matchRequestQuery": {"account": "${Account}","serviceIdentifier": "${Identifier}"}}
    ${Response_Code}    ${Response_Text}    Get Query Response    ${GRCP_CLIENT_ID}    ${GRCP_CLIENT_SECRET}    ${MRQ_input}
    Should Be Equal    ${Response_Code}    RF1204    Responsecode doesn't match
    Set Test Message    Query verification completed with response code ${Response_Code} and response text ${Response_Text}