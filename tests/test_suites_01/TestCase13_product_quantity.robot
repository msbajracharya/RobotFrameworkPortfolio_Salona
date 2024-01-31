*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${first_product}    xpath=/html/body/section[2]/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/ul/li/a
${first_product_name}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/h2
${product_quantity}    xpath=//*[@id="quantity"]
${add_cart}    xpath=/html/body/section/div/div/div[2]/div[2]/div[2]/div/span/button
${modal_box}    xpath=//*[@id="cartModal"]/div/div
${view_cart}    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a/u
${first_product_cart}     xpath=//*[@id="product-1"]/td[2]/h4/a
${first_product_quantity}     xpath=//*[@id="product-1"]/td[4]/button


*** Test Cases ***
Verify products quantity in Cart 
    [Documentation]     Opens the website, increase the product quantity and add products to cart. Open the card and check the 
    ...    products are added and verify if the quantity is correct
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 

    Click Element    ${first_product}
    ${product_name}    Get Text    ${first_product_name} #Storing the Product name to compare it in the Cart list

    Clear Element Text    ${product_quantity}
    Input Text    ${product_quantity}    4
    Click Element    ${add_cart}
    Wait Until Element Is Visible    ${modal_box}
    Click Element    ${view_cart}
    
    ${actual_text}    Get Text    ${first_product_cart}
    Should Be Equal As Strings    ${actual_text}    ${product_name}

    ${actual_text1}    Get Text    ${first_product_quantity}
    Should Be Equal As Strings    ${actual_text1}    4
