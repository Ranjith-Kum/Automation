*** Settings ***
Resource          Resources/Config.robot
Resource          Resources/Keywords.robot
Library           SSHLibrary

*** Variables ***
${Host}        192.168.1.10
&{SSHLogin}    username=npc    password=12345678

*** Test Cases ***
Test1
    Open Connection    ${Host}
    Login    ${SSHLogin.username}    ${SSHLogin.password}
    ${date}=    Execute Command    date
    Close Connection