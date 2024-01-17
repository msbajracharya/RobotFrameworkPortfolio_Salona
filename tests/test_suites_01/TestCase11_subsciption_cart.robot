*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${cart_page}    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a
${verify_subsciption}    xpath=//*[@id="footer"]/div[1]/div/div/div[2]/div/h2
${subsciption_email_field}    xpath=//*[@id='susbscribe_email']
${subsciption_email_submit}    xpath=//*[@id='subscribe']
${subsciption_submit_success}    xpath=//*[@id="success-subscribe"]/div
*** Test Cases ***
Check for the Subsciption from Cart page and add subsciption email
    [Documentation]     Opens the website, Scroll to footer and add subsciption email. Verify success text is visible
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    
    Click Element    ${cart_page}
    #Scroll to the bottom of the page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);

    ${actual_text}    Get Text    ${verify_subsciption}
    Should Be Equal As Strings    ${actual_text}    SUBSCRIPTION

    Input Text    ${subsciption_email_field}    test.t@t.coo
    Click Element    ${subsciption_email_submit}
    
    #the subsciption success text is in the HTML all the time, the class is hidden until subscribe button is clicked
    #this will check if the hidden attribe is removed from the class or not
    ${element_classes}=    Get Element Attribute    css=.col-md-9.form-group   class
    ${hide_class_removed}=    Evaluate    'hide' not in '${element_classes}'.split(' ')
    Should Be True    ${hide_class_removed}
    
    #this verify the text value
    ${actual_text1}    Get Text    ${subsciption_submit_success}
    Should Be Equal As Strings    ${actual_text1}    You have been successfully subscribed!