*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=${EXECDIR}/keywords/screenshots
Library    OperatingSystem
Library    RequestsLibrary
Library    Collections
Library    driversync.py    WITH NAME    driversync
Library    Screenshot
Library    DateTime
Library    SSHLibrary
Library    JSONLibrary
Library    String
Resource    ../keywords/common_keywords.robot
Resource    ../keywords/katalon_keywords.robot
Resource    locators.robot

*** Variables ***

# Browser and Grid Variables
${BROWSER}    Edge
${HEADLESS}    False
${GRID_FLAG}    False
${JENKINS_BOOL}    False
${REMOTE_DOWNLOAD_FILEPATH}    ${CURDIR}\\downloads
${REMOTE_DOWNLOAD_URL}    http://10.20.161.109:4444/wd/hub

# Environment Variables
${ENV}    qaenvdummy.com

# MAG GUI URL
${Application_URL}    https://${ENV}/dummy/portal/login

# CP Credentials
${Unregistered_CP}    TROA
${GRCP_CPID}    MPCT
${LRCP_CPID}    MPCS
${Table_ENV}    dummy-qa

# GUI Login Credentials
${GRCP_Email}    grcp@gmail.com
${GRCP_Password}    user@12345

${LRCP_Email}    lrcp@gmail.com
${LRCP_Password}    user@12345

# CP and HUB Endpoints and credentials
${BASE_URL}    https://${ENV}/
${MRQ_ENDPOINT}    /dummyendpoint/v1/search
${AUTH_URL}    /dummycptoken/oauth2/token
${SWITCH_ENDPOINT}    /dummycpendpoint/v1/post
${GRCP_CLIENT_ID}    1234567890123456789012345678901234567890123456789012345678901234567890
${GRCP_CLIENT_SECRET}    1234567890123456789012345678901234567890123456789012345678901234567890
${LRCP_CLIENT_ID}    1234567890123456789012345678901234567890123456789012345678901234567890
${LRCP_CLIENT_SECRET}    1234567890123456789012345678901234567890123456789012345678901234567890
${HUB_AUTH_URL}    /dummyhubtoken/oauth2/token
${HUB_SWITCH_ENDPOINT}    /dummyhubendpoint/v1/post
${MPCS_HUBClient_ID}    1234567890123456789012345678901234567890123456789012345678901234567890
${MPCS_HUBSecret_ID}    1234567890123456789012345678901234567890123456789012345678901234567890
${MPCT_HUBClient_ID}    1234567890123456789012345678901234567890123456789012345678901234567890
${MPCT_HUBSecret_ID}    1234567890123456789012345678901234567890123456789012345678901234567890

# Match Confirmation Variables
${Sent_Method_Value}    email
${Sentby_Value}    abc@gmail.com
${MC_Date_Time_Value}    17-01-2025 02:24:03
${MC_Action_Value}    ServiceFound
${Implication_Sent_Value}    Hi, Your service has been found, and is gonnabe switched to new CP. Please confirm the same.

# Failure Message Variables
${Auditdata_name_Input}    faultCode
${Auditdata_value_Input}    value

# Fault codes

# Match Failure Codes
${1101}    1101##Missing or incomplete address.
${1102}    1102##Name not provided.
${1103}    1103##Account not found.
${1104}    1104##Account found but is closed or historic.
${1105}    1105##Account found but at least one serviceIdentifier not found on the account.
${1107}    1107##No customers found with service at that location.
${1108}    1108##One or more customers found, but no match on surname.
${1109}    1109##Multiple customers found matching on surname.
${1110}    1110##Customer found, but they have multiple matching services at the same address.
${1111}    1111##A switch is currently in progress.
${1112}    1112##Data Integrity issue detected by LRCP.The LRCP must upload their Customer Data flat file to the iconectiv MAP.
${1113}    1113##Account number format not valid for <residentialMatchRequest|businessMatchRequest>.
${1114}    1114##Address does not match despite two other strong points of contact, one of which is account number.
${1115}    1115##Address does not match and no account number is included despite two other strong points of contact.
${1116}    1116##Service Identifier not found.
${1117}    1117##Services not included or invalid.
${1118}    1118##No DN included as service identifier for an NBICS port or identify.
${1119}    1119##Account found, but no IAS or NBICS services were found under it.
${1120}    1120##The requested service was not found against the matched customer / account / subscription.
${1121}    1121##Name does not match and address is only a close match.
${1122}    1122##Name does not match, address and service identifier match, but account number is not included.
 
# Order Failure Codes
${1201}    1201##Invalid or missing switch order reference.
${1202}    1202##Switch order reference is no longer available has expired.
${1203}    1203##Invalid or missing planned switch date.
${1204}    1204##Switch order has already been completed.
${1205}    1205##Switch order has already been cancelled.
${1211}    1211##A switch is currently in progress.
${1212}    1212##All services requested to be ceased are no longer active.
${1213}    1213##Switch Order Reference is already in use.
${1214}    1214##There is an open cease order which is past point of no return and cannot be cancelled.
${1215}    1215##There is an open modify order which is past point of no return and cannot be cancelled.
 
# Update Failure Codes
${1301}    1301##Invalid or missing switch order reference.
${1302}    1302##Switch order reference is no longer available.
${1303}    1303##Invalid or missing planned switch date.
${1304}    1304##Switch order has already been completed.
${1305}    1305##Switch order has already been cancelled.
${1306}    1306##Switch order was never raised.
 
# Trigger Failure Codes
${1401}    1401##Invalid or missing switch order reference.
${1402}    1402##Switch order reference is no longer available.
${1403}    1403##Invalid or missing activation date.
${1404}    1404##Switch order has already been completed.
${1405}    1405##Switch order has already been cancelled.
${1406}    1406##Switch order was never raised.

# Cancellation Failure Codes
${1501}    1501##Invalid or missing switch order reference.
${1502}    1502##Switch order reference is no longer available.
${1504}    1504##Switch order has already been completed.
${1505}    1505##Switch order has already been cancelled.
${1506}    1506##Switch order was never raised.
 