*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${first_product}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/p
${first_product_price}     xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/h2
${first_product_cart}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/a
${modal_box}    xpath=//*[@id="cartModal"]/div/div
${continue_shopping}    xpath=//*[@id="cartModal"]/div/div/div[3]/button
${second_product}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[3]/div/div[1]/div[1]/p
${second_product_price}     xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[3]/div/div[1]/div[1]/h2
${second_product_cart}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[3]/div/div[1]/div[2]/div/a
${view_cart}    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a/u
${first_product_in_cart}    xpath=//*[@id="product-1"]/td[2]/h4/a
${first_product_price_in_cart}    xpath=//*[@id="product-1"]/td[3]/p
${second_product_in_cart}    xpath=//*[@id="product-2"]/td[2]/h4/a
${second_product_price_in_cart}    xpath=//*[@id="product-2"]/td[3]/p



*** Test Cases ***
Add products to Cart and verify the cart
    [Documentation]     Opens the website, add products to cart. Open the card and check the products are added
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    
    # store the product name and price to compare it with the cart detail
    ${first_selected_product_name}    Get Text    ${first_product}
    ${second_selected_product_name}    Get Text    ${second_product}
    ${first_selected_product_price}    Get Text    ${first_product_price}
    ${second_selected_product_price}    Get Text    ${second_product_price}

    # hover over the first product and click add to cart
    Mouse Over    ${first_product} 
    Click Element    ${first_product_cart}
    Wait Until Element Is Visible    ${modal_box}
    Click Element    ${continue_shopping}

    # hover over the second product and click add to cart
    Mouse Over    ${second_product} 
    Click Element    ${second_product_cart}
    Wait Until Element Is Visible    ${modal_box}

    #Open the cart
    Click Element    ${view_cart}
    
    #Store all the details from the cart to compare it with the product details we saved before adding to cart
    ${first_productname_in_cart}     Get Text    ${first_product_in_cart} 
    ${second_productname_in_cart}    Get Text    ${second_product_in_cart}
    ${first_product_amount_in_cart}    Get Text    ${first_product_price_in_cart} 
    ${second_product_amount_in_cart}    Get Text    ${second_product_price_in_cart} 

    #comparing each product's name and price
    Should Be Equal As Strings   ${first_selected_product_name}    ${first_productname_in_cart} 
    Should Be Equal As Strings   ${second_selected_product_name}    ${second_productname_in_cart} 
    Should Be Equal As Strings   ${first_selected_product_price}    ${first_product_amount_in_cart} 
    Should Be Equal As Strings   ${second_selected_product_price}    ${second_product_amount_in_cart} 

    
