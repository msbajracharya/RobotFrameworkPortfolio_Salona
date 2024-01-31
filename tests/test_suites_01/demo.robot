*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com
${CHROMEDRIVER_PATH}    /workspaces/RobotFrameworkPortfolio_Salona/chromedriver

*** Test Cases ***
Open Chrome Browser With Path To ChromeDriver
    Open Browser    ${URL}    Chrome    executable_path=${CHROMEDRIVER_PATH}
    Close Browser
