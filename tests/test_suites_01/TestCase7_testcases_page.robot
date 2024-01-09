*** Settings ***
Library  SeleniumLibrary
Resource       ../../resources/config.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${testcases_page}   xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${testcases_page_indicate}    xpath=//*[@id="form"]/div/div[1]/div/h2/b


*** Test Cases ***
Testcases page is opened successfully
    [Documentation]     Opens the website, open test cases and verify if page is opened
    Open Browser    ${BASE_URL}     chrome    executable_path= ${CHROME_DRIVER_PATH}
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Click Element    ${testcases_page}
    ${actual_text1}    Get Text    ${testcases_page_indicate}
    Should Be Equal As Strings   ${actual_text1}  TEST CASES