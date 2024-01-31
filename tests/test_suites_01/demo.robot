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
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${URL}
    Close Browser
