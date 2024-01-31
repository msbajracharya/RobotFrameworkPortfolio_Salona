*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.example.com
${CHROMEDRIVER_PATH}    ../../chromedriver
${EXTENSION_PATH}    /workspaces/RobotFrameworkPortfolio_Salona/AdBlock.crx

*** Test Cases ***
Open Chrome Browser In Headless Mode With Adblock Extension
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${ChromeOptions}    add_extension    ${EXTENSION_PATH}
    Call Method    ${chrome_options}    add_argument    --headless
    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${CHROMEDRIVER_PATH}
    Go To    ${URL}
    Close Browser
