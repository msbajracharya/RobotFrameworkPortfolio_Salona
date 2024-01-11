*** Settings ***
Library  SeleniumLibrary
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${product_page}   xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
${product_page_indicate}    xpath=/html/body/section[2]/div/div/div[2]/div/h2
${first_product_view}    xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[2]/ul/li/a
${first_product_detail_page}    xpath=//div[@class="product-information"]
${product_name}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/h2
${category}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/p[1]
${price}     xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/span/span
${availability}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/p[2]
${condition}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/p[3]
${brand}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/p[4]




*** Test Cases ***
Products page is opened successfully
    [Documentation]     Opens the website, open products page and verify all product details
    ...                 for now it is hard coded data compared with the product details
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    
    Click Element    ${product_page}
    ${actual_text1}    Get Text    ${product_page_indicate}
    Should Be Equal As Strings   ${actual_text1}  ALL PRODUCTS

    Click Element    ${first_product_view}
    Wait Until Element Is Visible  ${first_product_detail_page}

    ${actual_text2}    Get Text    ${product_name}
    Should Be Equal As Strings   ${actual_text2}  Blue Top

    ${actual_text3}    Get Text    ${category}
    Should Be Equal As Strings   ${actual_text3}  Category: Women > Tops

    ${actual_text4}    Get Text    ${price}
    Should Be Equal As Strings   ${actual_text4}  Rs. 500

    ${actual_text5}    Get Text    ${availability}
    Should Be Equal As Strings   ${actual_text5}  Availability: In Stock

    ${actual_text6}    Get Text    ${condition}
    Should Be Equal As Strings   ${actual_text6}  Condition: New

    ${actual_text7}    Get Text    ${brand}
    Should Be Equal As Strings   ${actual_text7}  Brand: Polo
    


