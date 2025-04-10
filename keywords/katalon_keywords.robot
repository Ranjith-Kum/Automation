*** Settings ***
Resource    ../resource/config.robot


*** Variables ***
${SCREENSHOT_DIRECTORY}       ${EXECDIR}/Keywords/screenshots

*** Keywords ***
IRobot Wait For Loader To Disappear
    [Arguments]         ${TIMEOUT}=120
    [Documentation]     Used to wait until the loader disappears from the current page
    ...                 *Args:*
    ...                     -${TIMEOUT} - waiting time
    Wait Until Page Does Not Contain Element    xpath=//div[@id='loader-backdrop']     ${TIMEOUT}

Setup Login
    [Arguments]   ${URL}   ${BROWSER}    ${USER}    ${PASSWORD}
    ...     ${USERID_PATH}=xpath=//input[@id='userId']
    ...     ${PASS_PATH}=xpath=//input[@id='password']
    [Documentation]     Used to login to the page
    ...                 *Args:*
    ...                     -${URL} - page url
    ...                     -${BROWSER} - supported browser name
    ...                     -${USER} - username
    ...                     -${PASSWORD} - password
    ...                     -${USERID_PATH} - Element ID for Username, Default set to xpath=//input[@id='userId']
    ...                     -${PASS_PATH} - Element ID for Password, Default set to xpath=//input[@id='password']
    Create Browser    ${BROWSER}
    Go to    ${URL}
    type     ${USERID_PATH}    ${USER}
    type     ${PASS_PATH}      ${PASSWORD}
    click    xpath=//button[@type='submit']
    IRobot Wait For Loader To Disappear



Create Edge Headless
    [Arguments]    ${browser}
    [Documentation]     Used to create Edge browser in headless mode
    ...                 *Args:*
    ...                     -${browser} - supported browser name
    ${driver_path}    driversync.Get Edgedriver Path
    ${edge_options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()
    Call Method    ${edge_options}   add_argument    --headless
    Call Method    ${edge_options}   add_argument    --disable-gpu
    Call Method    ${edge_options}   add_argument    window-size\=1920,1080
    Call Method    ${edge_options}   add_argument    --no-sandbox
    Call Method    ${edge_options}   add_argument    --disable-dev-shm-usage
    create webdriver    ${browser}    executable_path=${driver_path}    options=${edge_options}

Create Firefox Headless
    [Arguments]    ${browser}
    [Documentation]     Used to create Firefox browser in headless mode
    ...                 *Args:*
    ...                     -${browser} - supported browser name
    ${driver_path}    driversync.Get Firefox Path
    ${firefox_options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()
    Call Method    ${firefox_options}   add_argument    --headless
    Call Method    ${firefox_options}   add_argument    --disable-gpu
    Call Method    ${firefox_options}   add_argument    window-size\=1920,1080
    Call Method    ${firefox_options}   add_argument    --no-sandbox
    Call Method    ${firefox_options}   add_argument    --disable-dev-shm-usage
    create webdriver    ${browser}    executable_path=${driver_path}    options=${firefox_options}

Create Chrome Headless
    [Arguments]    ${browser}
    [Documentation]     Used to create Chrome browser in headless mode
    ...                 *Args:*
    ...                     -${browser} - supported browser name
    ${driver_path}    driversync.Get Chromedriver Path
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${chrome_options}   add_argument    --headless
    Call Method    ${chrome_options}   add_argument    --disable-gpu
    Call Method    ${chrome_options}   add_argument    window-size\=1920,1080
    Call Method    ${chrome_options}   add_argument    --no-sandbox
    Call Method    ${chrome_options}   add_argument    --disable-dev-shm-usage
    create webdriver    ${browser}    executable_path=${driver_path}    options=${chrome_options}

Open Browser and Maximize Window
    [Arguments]    ${URL}=${None}    ${BROWSER}=${None}  ${HEADLESS}=${None}    ${JENKINS}=${None}
    ...    ${REMOTE_DOWNLOAD_FILEPATH}=${None}    ${REMOTE_DOWNLOAD_URL}=${None}
    [Documentation]     Used to create chosen browser and navigates to the passed url
    ...                 *Args:*
    ...                     -${URL} - page url
    ...                     -${BROWSER} - supported browser name
    ...                     -${HEADLESS} - enable/disable headless mode
    ...                     -${JENKINS} - enable/disable jenkins parameters
    ...                     -${REMOTE_DOWNLOAD_FILEPATH} - filepath for remote download
    ...                     -${REMOTE_DOWNLOAD_URL} - url for remote download
    Create Browser    ${BROWSER}    ${HEADLESS}    ${JENKINS}  ${REMOTE_DOWNLOAD_FILEPATH}
    ...    ${REMOTE_DOWNLOAD_URL}
    Go to    ${URL}
    Maximize Browser Window

Create Browser
    [Arguments]   ${browser}=${None}    ${HEADLESS}=${None}    ${JENKINS}=${None}
    ...    ${REMOTE_DOWNLOAD_FILEPATH}=${None}    ${REMOTE_DOWNLOAD_URL}=${None}
    [Documentation]     Used to create a browser based on the passed parameters
    ...                 *Args:*
    ...                     -${browser} - supported browser name
    ...                     -${HEADLESS} - enable/disable headless mode
    ...                     -${JENKINS} - enable/disable jenkins parameters
    ...                     -${REMOTE_DOWNLOAD_FILEPATH} - filepath for remote download
    ...                     -${REMOTE_DOWNLOAD_URL} - url for remote download

    ${browser}    Convert To Title Case    ${browser}
    IF    '${browser}' == 'Edge'
        ${driver_path}    driversync.Get Edgedriver Path
    ELSE IF    '${browser}' == 'Firefox'
        ${driver_path}    driversync.Get Firefox Path
    ELSE
        ${browser}    Set Variable    Chrome
        ${driver_path}    driversync.Get Chromedriver Path
    END

    Remove Directory    ${SCREENSHOT_DIRECTORY}    recursive=True
    Create Directory    ${SCREENSHOT_DIRECTORY}
    
    ${JENKINS_BOOL}  Convert To Boolean   ${JENKINS}
    ${HEADLESS_BOOL}  Convert To Boolean   ${HEADLESS}
    ${GRID_FLAG}    Convert To Boolean    ${GRID_FLAG}
    ${log_level}    set variable    log-level=3
    IF    ${JENKINS_BOOL} == ${True}
        Set Suite Variable    ${REMOTE_DOWNLOAD_FILEPATH}
        Set Global Variable    ${global_downloadDir}    ${REMOTE_DOWNLOAD_FILEPATH}
        ${options}    Create Browser Options    ${BROWSER}    ${REMOTE_DOWNLOAD_FILEPATH}    ${REMOTE_DOWNLOAD_URL}    ${HEADLESS_BOOL}
        IF    ${GRID_FLAG} == ${True}
            ${REMOTE_URL}    set variable    ${REMOTE_DOWNLOAD_URL}
            ${GRID_FLAG}    set variable    False
            set global variable    ${GRID_FLAG}
        END
        Create Webdriver    Remote    command_executor=${REMOTE_URL}    desired_capabilities=${options}

    ELSE
        IF    ${HEADLESS_BOOL} == ${True}
            IF    '${browser}' == 'Edge'
                Create Edge Headless    ${browser}
            ELSE IF    '${browser}' == 'Firefox'
                Create Firefox Headless    ${browser}
            ELSE
                Create Chrome Headless    ${browser}
            END
        ELSE
        create webdriver    ${browser}    executable_path=${driver_path}
        END
    END

Create Browser Options
    [Arguments]    ${BROWSER}    ${REMOTE_DOWNLOAD_FILEPATH}    ${REMOTE_DOWNLOAD_URL}    ${HEADLESS}
    [Documentation]     Used to tailor a browser's options to run on Jenkins side
    ...                 *Args:*
    ...                     -${BROWSER} - supported browser name
    ...                     -${REMOTE_DOWNLOAD_FILEPATH} - filepath for remote download
    ...                     -${REMOTE_DOWNLOAD_URL} - url for remote download
    ...                     -${HEADLESS} - enable/disable headless mode

    ${browser}    Convert To Title Case    ${BROWSER}
    IF    '${browser}' == 'Edge'
         ${options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()
    ELSE IF   '${browser}' == 'Firefox'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].FirefoxOptions()
        call method    ${options}    set_preference    browser.download.dir    ${REMOTE_DOWNLOAD_FILEPATH}
    ELSE IF    '${browser}' == 'Chrome'
        ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    END
    IF    '${BROWSER}' == 'Edge' or '${BROWSER}' == 'Chrome'
         ${preferences}=    Create Dictionary    download.default_directory=${REMOTE_DOWNLOAD_FILEPATH}
         Call Method    ${options}   add_experimental_option    prefs    ${preferences}
    END
    IF    ${HEADLESS}==${True}
                Call Method    ${options}   add_argument    --headless
                Call Method    ${options}   add_argument    --disable-gpu
                Call Method    ${options}   add_argument    window-size\=1920,1080
                Call Method    ${options}   add_argument    --no-sandbox
    END
    ${options}=     Call Method     ${options}    to_capabilities
    RETURN    ${options}

Close Current Browser
    [Documentation]     Used to close current browser
    Close Browser

clear
    [Arguments]   ${element}
    [Documentation]     Used to clear all data in the field
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element to be cleared
    Press Keys  ${element}  CTRL+a+BACKSPACE

Soft assert
    [Arguments]     ${statement}
    [Documentation]     Used to run the keyword 'Should Be Equal' and continue execution even if a failure occurs
    ...                 *Args:*
    ...                     -${statement} - statement to be verified
    Take Screenshot
    Run Keyword And Continue On Failure     Should Be Equal    ${statement}    ${True}

Open browser chrome
    [Arguments]     ${LOGIN_URL}
    [Documentation]     Used to open the passed URL in the chrome browser
    ...                 *Args:*
    ...                     -${LOGIN_URL} - URL to the login page
    Open Browser    ${LOGIN_URL}    Chrome

open
    [Arguments]    ${element}
    [Documentation]     Used to open page by the passed 'locator'
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Enabled    ${element}    timeout=10
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    [Documentation]     Used to click on the element
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element to be clicked
    Wait Until Element Is Enabled    ${element}     timeout=10
    Click Element  ${element}

click
    [Arguments]    ${element}
    [Documentation]     Used to click on the element and wait for loader to disappear
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element to be clicked
    Wait Until Element Is Enabled    ${element}    timeout=20
    Click Element  ${element}
    IRobot Wait For Loader To Disappear

sendKeys
    [Arguments]    ${element}    ${value}
    [Documentation]     Used to simulates the user pressing key(s) to an element or on the active browser
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - key(s) in the string format
    Wait Until Element Is Enabled    ${element}     timeout=10
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    [Documentation]     Used to submit form
    ...                 *Args:*
    ...                     -${element} - 'locator' to the form
    Wait Until Element Is Enabled    ${element}     timeout=10
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    [Documentation]     Used to enter values in the field
    ...                 *Args:*
    ...                     -${element} - 'locator' to the input field
    ...                     -${value} - the value to be entered
    Wait Until Element Is Enabled    ${element}     timeout=10
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    [Documentation]     Used to select values from list and wait
    ...                 *Args:*
    ...                     -${element} - 'locator' to the list
    ...                     -${value} - the value to be selected
    Wait Until Element Is Enabled    ${element}     timeout=10
    Select From List by Value  ${element}  ${value}


select
    [Arguments]        ${element}  ${value}
    [Documentation]     Used to select values from the list
    ...                 *Args:*
    ...                     -${element} - 'locator' to the list
    ...                     -${value} - the value to be selected
    Wait Until Element Is Enabled    ${element}     timeout=10
    Select From List by Value  ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that an element contains the passed value
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - the value to be verified
    Wait Until Element Is Visible    ${element}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that an element contains the passed text
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - the text to be verified
    Wait Until Element Is Visible    ${element}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    [Documentation]     Used to verify that passed element is presented on the current page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Visible    ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    [Documentation]     Used to verify that passed element is visible on the current page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Visible    ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    [Documentation]     Used to verify that the current page title equals expected title
    ...                 *Args:*
    ...                     -${title} - expected title
    Wait Until Element Is Visible    ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that the table contains passed value
    ...                 *Args:*
    ...                     -${element} - 'locator' to the table
    ...                     -${value} - the value to be verified
    Wait Until Element Is Visible    ${element}
    Element Should Contain       ${element}  ${value}

assertElementAttributeValue
    [Arguments]  ${locator}  ${attribute}  ${expected_value}
    [Documentation]     Used to verify that element identified by 'locator' contains expected attribute value
    ...                 *Args:*
    ...                     -${locator} - 'locator' to the element
    ...                     -${attribute} - attribute name
    ...                     -${expected_value} - expected value
    Take Screenshot
    Element Attribute Value Should Be    ${locator}  ${attribute}  ${expected_value}

assertNotVisible
    [Arguments]    ${element}
    [Documentation]     Used to verify that the element identified by 'locator' is NOT visible on the page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Not Visible    ${element}  timeout=10
    Take Screenshot
    Element Should Not Be Visible    ${element}

assertConfirmation
    [Arguments]                  ${value}
    [Documentation]     Used to verify that an alert is present and then it is used to verify alert's message
    ...                 *Args:*
    ...                     -${value} - alert message
    Wait Until Element Is Visible    ${value}
    Take Screenshot
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that the element exactly contains the expected text.
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - expected text
    Wait Until Element Is Visible    ${element}    timeout=10
    Take Screenshot
    Element Text Should Be    ${element}  ${value}

assertLocation
    [Arguments]    ${expected_location_url}
    [Documentation]     Used to verify that the current URL is exactly expected url
    ...                 *Args:*
    ...                     -${expected_location_url} - expected url
    Take Screenshot
    Location Should Be    ${expected_location_url}

assertPageTitle
    [Arguments]    ${expected_page_title}
    [Documentation]     Used to verify that the actual page title is equal to the expected page title
    ...                 *Args:*
    ...                     -${expected_page_title} - expected page title
    ${actual_page_title}    Get Title
    Take Screenshot
    Should Be Equal    ${actual_page_title}    ${expected_page_title}

assertValue
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that element 'locator' contains expected value
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - expected value
    Wait Until Element Is Visible    ${element}
    Take Screenshot
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    [Documentation]     Used to verify that element 'locator' is found on the current page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Visible    ${element}
    Take Screenshot
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    [Documentation]     Used to verify that element 'locator' is visible on the current page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Visible    ${element}
    Take Screenshot
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    [Documentation]     Used to verify that the current page title equals expected title
    ...                 *Args:*
    ...                     -${title} - expected title
    Wait Until Element Is Visible    ${title}
    Take Screenshot
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that the table contains expected value
    ...                 *Args:*
    ...                     -${element} - 'locator' to the table
    ...                     -${value} - the value in the table to be verified
    Wait Until Element Is Visible    ${element}
    Take Screenshot
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that element 'locator' is visible and contains exactly the expected text
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - expected text
    Wait Until Element Is Visible    ${element}
    Element Text Should Be    ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that element 'locator' is visible and contains expected value
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    ...                     -${value} - expected value
    Wait Until Element Is Visible    ${element}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    [Documentation]     Used to verify that element 'locator' is presented on the current page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Visible    ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    [Documentation]     Used to verify that element 'locator' is visible on the current page
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Visible    ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    [Documentation]     Used to verify that the current page title is visible and equals expected title
    ...                 *Args:*
    ...                     -${title} - expected title
    # Wait Until Element Is Visible    ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    [Documentation]     Used to verify that the table is visible and contains expected value
    ...                 *Args:*
    ...                     -${element} - 'locator' to the table
    ...                     -${value} - the value in the table to be verified
    Wait Until Element Is Visible    ${element}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    [Documentation]     Double clicks the element identified by 'locator'
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Enabled    ${element}     timeout=10
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    [Documentation]     Double clicks the element identified by 'locator'
    ...                 *Args:*
    ...                     -${element} - 'locator' to the element
    Wait Until Element Is Enabled    ${element}     timeout=10
    Double Click Element  ${element}

goBack
    [Documentation]     Used to simulate the back button click
    #Logger For Robot    Simulating back button click
    Go Back

goBackAndWait
    [Documentation]     Used to simulate the back button click
    #Logger For Robot    Simulating back button click
    Go Back

runScript
    [Arguments]         ${code}
    [Documentation]     Used to execute the given JavaScript code
    ...                 *Args:*
    ...                     -${code} - JavaScript code
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    [Documentation]     Used to execute the given JavaScript code
    ...                 *Args:*
    ...                     -${code} - JavaScript code
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    [Documentation]     Used to set the timeout that is used by various keywords
    ...                 *Args:*
    ...                     -${value} - value can be given as a number or as a human-readable string like ``1 second``
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    [Documentation]     Used to set the timeout that is used by various keywords
    ...                 *Args:*
    ...                     -${value} - value can be given as a number or as a human-readable string like ``1 second``
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    [Documentation]     Used to verify that an alert is present and then it is used to verify alert's message
    ...                 *Args:*
    ...                     -${value} - alert message
    Alert Should Be Present  ${value}



Generate Random TN Number
    [Documentation]     Generate random number
    #Logger For Robot    Generating random numbers
    ${numbers}   Generate Random String     10   23456789
    RETURN    ${numbers}

iSelect Frame
    [Arguments]    ${locator}
    [Documentation]     Customize keyword to check if page contains frame, if yes, select that frame
    ...                 *Args:*
    ...                     -${locator} - frame's locator
    ${stmt}    Validate if page contains frame    ${locator}
    IF    ${stmt} == ${True}
        SeleniumLibrary.select frame    ${locator}
    ELSE
        no operation
    END

iUnSelect Frame
    [Documentation]     Keyword to Unselect Frame
    TRY
        SeleniumLibrary.Unselect Frame
    EXCEPT
        no operation
    END

Validate if page contains frame
    [Arguments]    ${locator}
    [Documentation]     Keyword to check if page contains frame, if yes, returns statement as True;
    ...                 else returns statement as False
    ...                 *Args:*
    ...                     -${locator} - frame's locator
    TRY
        page should contain element    xpath=//frame[@*='${locator}']
        ${stmt}    set variable    ${True}
    EXCEPT
        #Logger For Robot    Page doesn't contain frame ${locator}
        ${stmt}    set variable    ${False}
    END
    RETURN    ${stmt}

Wait Until Element Is Enabled
    [Arguments]    ${element}   ${timeout}=${None}    ${error}=${None}
    #Logger For Robot    Wait untill ${element} is enabled
    SeleniumLibrary.Wait Until Element Is Enabled    ${element}   ${timeout}

Wait Until Element Is Visible
    [Arguments]    ${element}   ${timeout}=${None}   ${error}=${None}
    #Logger For Robot    Wait untill ${element} is visible
    SeleniumLibrary.Wait Until Element Is Visible    ${element}     ${timeout}

Wait Until Element Is Not Visible
    [Arguments]    ${element}   ${timeout}=${None}   ${error}=${None}
    #Logger For Robot    Wait untill ${element} is not visible
    SeleniumLibrary.Wait Until Element Is Not Visible    ${element}     ${timeout}

Go to
    [Arguments]    ${url}
    #Logger For Robot    Opening url: ${url}
    SeleniumLibrary.Go To    ${url}

Press Keys
    [Arguments]    ${element}    ${value}
    #Logger For Robot    Press keys: ${value}
    SeleniumLibrary.Press Keys    ${element}    ${value}

Element Should Contain
    [Arguments]    ${element}    ${value}
    #Logger For Robot    Verifying that ${element} contains ${value}
    SeleniumLibrary.Element Should Contain    ${element}    ${value}

Element Should Not Be Visible
    [Arguments]    ${element}
    #Logger For Robot    Veriying that ${element} is not visible
    SeleniumLibrary.Element Should Not Be Visible    ${element}

Page Should Contain Element
    [Arguments]    ${element}   ${message}=${None}   ${loglevel}=TRACE   ${limit}=${None}
    #Logger For Robot    Checking that current page should contains ${element}
    SeleniumLibrary.Page Should Contain Element    ${element}

Title Should Be
    [Arguments]    ${title}   ${message}=${None}
    #Logger For Robot    Verifying that current page title equals ${title}
    SeleniumLibrary.Title Should Be    ${title}    ${message}

Alert Should Be Present
    [Arguments]    ${value}   ${action}=ACCEPT   ${timeout}=${None}
    #Logger For Robot    Verifying that an alert ${value} is present
    SeleniumLibrary.Alert Should Be Present    ${value}    ${action}   ${timeout}

Element Text Should Be
    [Arguments]    ${value}   ${expected}=${None}   ${message}=${None}
    #Logger For Robot    Verifying that element ${value} contains exact the text ${expected}
    SeleniumLibrary.Element Text Should Be    ${value}    ${expected}   ${message}

Location Should Be
    [Arguments]    ${url}   ${message}=${None}
    #Logger For Robot    Verifying that the current URL is exactly ${url}.
    SeleniumLibrary.Location Should Be    ${url}    ${message}

Double Click Element
    [Arguments]    ${element}
    #Logger For Robot    Double click on element ${element}.
    SeleniumLibrary.Double Click Element    ${element}

Click Element
    [Arguments]    ${element}
    #Logger For Robot    Click on element ${element}.
    SeleniumLibrary.Click Element    ${element}

Execute Javascript
    [Arguments]    ${code}
    #Logger For Robot    Executing the given JavaScript code: ${code}
    SeleniumLibrary.Execute Javascript    ${code}

Set Selenium Timeout
    [Arguments]    ${value}
    #Logger For Robot    Set Selenium timeout on time: ${value}
    SeleniumLibrary.Set Selenium Timeout    ${value}
