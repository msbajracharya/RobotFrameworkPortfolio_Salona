*** Settings ***
Library  SeleniumLibrary
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${contactus_page}       xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a
${contactus_page_indicator}   xpath=//*[@id="contact-page"]/div[2]/div[1]/div/h2
${name_locator}   xpath=//*[@name="name"]
${email_locator}    xpath=//*[@name="email"]
${subject_locator}    xpath=//*[@name="subject"]
${message_locator}    xpath=//*[@id="message"]
${file_locator}    xpath=//input[@name='upload_file']
${submit_locator}    xpath=//*[@name="submit"]
${info_send_success}    xpath=//*[@id="contact-page"]/div[2]/div[1]/div/div[2]
${home_button}    xpath=//*[@id="form-section"]/a



*** Test Cases ***
Open Website and go to contact us
    [Documentation]     Opens the website, open contact us form and verify if page is opened
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Click Element  ${contactus_page}
    ${actual_text}    Get Text  ${contactus_page_indicator}
    Should Be Equal As Strings  ${actual_text}  GET IN TOUCH


Fill up contact us form  
    [Documentation]    Fill up the contact us page with all the details
    Input Text  ${name_locator}    RandomName
    Input Text    ${email_locator}    randomemail@t.coo
    Input Text    ${subject_locator}    AutoTestSubject    
    Input Text    ${message_locator}    This is a random message.123
    Scroll Element Into View    ${file_locator}
    Sleep  5s
    Choose File    ${file_locator}    ${file_path}    
    Click Element    ${submit_locator}
    Handle Alert    ACCEPT
    ${actual_text}    Get Text    ${info_send_success}
    Should Be Equal As Strings    ${actual_text}    Success! Your details have been submitted successfully.
    Click Element    ${home_button}
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    