*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${url}        https://www.saucedemo.com/
${browser}    chrome
&{logindata}    username=standard_user    password=secret_sauce
