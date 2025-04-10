*** Settings ***
Resource    ../resource/config.Robot
Library    SeleniumLibrary    screenshot_root_directory=${EXECDIR}/keywords/screenshots
Library    ImapLibrary2
Library    Collections
Library    String
Library    OperatingSystem
Library    DateTime
Library    RPA.email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587
Library    RPA.Email.Exchange

# Task Setup    Authorize    Account=${GMAIL_USER}    Password=${GMAIL_APP_PWD}
 
*** Variables ***
${GMAIL_HOST}         imap.gmail.com
${GMAIL_PORT}         993
${GMAIL_USER}         michael.rockj@gmail.com
${GMAIL_APP_PWD}      vycd ocpu ghmq nwab
${INBOX_FOLDER}       INBOX
${TEST_FOLDER}        TestFolder
${WAIT_TIMEOUT}       10 seconds
 
*** Test Cases ***
Verify Gmail Connection
    [Documentation]    Test basic connection to Gmail using app password
    Connect To Gmail Mailbox
    ${folders}=    Get Folder List   
    # Should Not Be Empty    ${folders}
    Close Mailbox
 
Read Latest Email From Inbox
    [Documentation]    Test reading the most recent email from inbox
    Connect To Gmail Mailbox
    Switch Folder    folder_name=${INBOX_FOLDER}
    ${latest}=    Wait For Email    subject=    timeout=${WAIT_TIMEOUT}
    ${email_body}=    Get Email Body    ${latest}
    Should Not Be Empty    ${email_body}
    Log    ${email_body}
    Close Mailbox
 
Search Email By Subject
    [Documentation]    Test searching for emails with specific subject
    [Tags]    search
    Connect To Gmail Mailbox
    Select Folder    ${INBOX_FOLDER}
    ${emails}=    Wait For Email    subject=Test    timeout=${WAIT_TIMEOUT}
    ${count}=    Get Length    ${emails}
    Log    Found ${count} emails with subject 'Test'
    Close Mailbox
 
Verify Email Metadata
    [Documentation]    Test reading email metadata (subject, sender, date)
    Connect To Gmail Mailbox
    Select Folder    ${INBOX_FOLDER}
    ${latest}=    Wait For Email    subject=    timeout=${WAIT_TIMEOUT}
    ${subject}=    Get Email Subject    ${latest}
    ${sender}=    Get Email Sender    ${latest}
    ${date}=    Get Email Received Date    ${latest}
    Should Not Be Empty    ${subject}
    Should Not Be Empty    ${sender}
    Should Not Be Empty    ${date}
    Close Mailbox
 
Search Emails Within Date Range
    [Documentation]    Test searching emails within specific date range
    ${today}=    Get Current Date
    ${week_ago}=    Subtract Time From Date    ${today}    7 days
    Connect To Gmail Mailbox
    Select Folder    ${INBOX_FOLDER}
    ${emails}=    Wait For Email    sender=    since=${week_ago}    timeout=${WAIT_TIMEOUT}
    Log    Found ${emails} emails from last week
    Close Mailbox
 
*** Keywords ***
Connect To Gmail Mailbox
    [Documentation]    Connects to Gmail using IMAP with app password authentication
    Open Mailbox    host=${GMAIL_HOST}
    ...    port=${GMAIL_PORT}
    ...    user=${GMAIL_USER}
    ...    password=${GMAIL_APP_PWD}
    ...    is_secure=True
 
Get Email Subject
    [Arguments]    ${email}
    [Documentation]    Extracts subject from email
    ${headers}=    Get Email    ${email}    headers=True
    ${subject}=    Get From Dictionary    ${headers}    Subject
    RETURN    ${subject}
 
Get Email Sender
    [Arguments]    ${email}
    [Documentation]    Extracts sender from email
    ${headers}=    Get Email Headers    ${email}
    ${from}=    Get From Dictionary    ${headers}    From
    RETURN    ${from}
 
Get Email Received Date
    [Arguments]    ${email}
    [Documentation]    Extracts received date from email
    ${headers}=    Get Email Headers    ${email}
    ${date}=    Get From Dictionary    ${headers}    Date
    RETURN    ${date}
 
Wait For Email
    [Arguments]    ${subject}=${EMPTY}    ${sender}=${EMPTY}    ${since}=${EMPTY}    ${timeout}=10 seconds
    [Documentation]    Waits for email matching criteria with timeout
    ${criteria}=    Set Variable    ALL
    Run Keyword If    '''${subject}''' != ''    
    ...    Set Variable    ${criteria} SUBJECT "${subject}"
    Run Keyword If    '''${sender}''' != ''    
    ...    Set Variable    ${criteria} FROM "${sender}"
    Run Keyword If    '''${since}''' != ''    
    ...    Set Variable    ${criteria} SINCE "${since}"
   
    Wait For Email    criteria=${criteria}    timeout=${timeout}
 
Sending email
    Send Message  sender=${GMAIL_ACCOUNT}
    ...           recipients=${RECIPIENT_ADDRESS}
    ...           subject=Message from RPA Robot
    ...           body=RPA Robot message body

Sending HTML Email With Image
    [Documentation]     Sending email with HTML content and attachment
    Send Message
    ...                 sender=${GMAIL_ACCOUNT}
    ...                 recipients=${RECIPIENT_ADDRESS}
    ...                 subject=HTML email with body images (2) plus one attachment
    ...                 body=${EMAIL_BODY}
    ...                 html=${TRUE}
    ...                 images=${BODY_IMG1}, ${BODY_IMG2}
    ...                 attachments=example.png