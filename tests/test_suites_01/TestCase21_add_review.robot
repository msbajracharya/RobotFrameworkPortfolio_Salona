*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${product_page}    xpath=//a[@href="/products"]
${view_product}    xpath=//div[@class="choose"]/ul/li/a
${name_field}    xpath=//input[@id="name"]
${email_field}    xpath=//input[@id="email"]
${review_field}    xpath=//textarea[@id="review"]
${submit_button}    xpath=//button[@id="button-review"]
${submit_verify}    xpath=//div[@id="review-section"]/div/div/span

#data to input
${name}    Automate    
${email}    automate@at.co
${review}    This is an automated test practise

*** Test Cases ***
Add review to a product
    [Documentation]     Opens the website, open a product and review and submit
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    
    #Open product page
    Click Element    ${product_page}
    
    #open view product
    Click Element    ${view_product}

    #add review details and submit
    Input Text    ${name_field}    ${name}
    Input Text    ${email_field}    ${email}
    Input Text    ${review_field}    ${review}
    Click Element    ${submit_button}

    #verify the success of the review submission
    ${actual_text}    Get Text    ${submit_verify}
    Should Be Equal As Strings    ${actual_text}    Thank you for your review.