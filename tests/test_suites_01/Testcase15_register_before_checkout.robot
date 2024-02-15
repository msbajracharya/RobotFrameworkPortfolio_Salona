*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot
Resource       ../../resources/new_user_creation.robot
Resource       ../../resources/card_details_form.robot
Resource       ../../resources/delete_account.robot
Resource       ../../resources/address_detail_verify.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${first_product}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/p
${first_product_price}     xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/h2
${first_product_cart}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/a
${modal_box}    xpath=//*[@id="cartModal"]/div/div
${continue_shopping}    xpath=//*[@id="cartModal"]/div/div/div[3]/button
${view_cart}    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a/u
${proceed_to_checkout}    xpath=//*[@id="do_action"]/div[1]/div/div/a
${checkout_modal_box}    xpath=//*[@id="checkoutModal"]/div/div
${register_link}    xpath=//*[@id="checkoutModal"]/div/div/div[2]/p[2]/a
${cart_page}    xpath=//div/ul/li[3]/a
${description_textarea}    xpath=//*[@id="ordermsg"]/textarea
${place_order}    xpath=//*[@id="cart_items"]/div/div[7]/a


*** Test Cases ***
Register new user and add product to chart for checkout
    [Documentation]     Opens the website, register a new user. Add products to cart and checkout
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 

    #Resuing the steps to create a new user from Resource folder
    Continue from signup page
    ${actual_text3}  Get Text  ${loggedin_user}
    Should Be Equal As Strings  ${actual_text3}   Logged in as ${user_name}
   
    # hover over the first product and click add to cart
    Mouse Over    ${first_product} 
    Click Element    ${first_product_cart}
    Wait Until Element Is Visible    ${modal_box}
    Click Element    ${continue_shopping}

    #Open the cart
    Click Element    ${view_cart}
    
    #Proceed to checkout button
    Click Element    ${proceed_to_checkout}
    
    #verify if the address ad details are matching the once added during new register
    Verify the delivery address is matching the address given while registering

    Input Text    ${description_textarea}    This is automated test
    Click Element    ${place_order}
   
    #Checks if the logged in user is shown
    ${actual_text3}  Get Text  ${loggedin_user}
    Should Be Equal As Strings  ${actual_text3}   Logged in as ${user_name}
    Sleep  5s


    Click Element    ${cart_page}
    Click Element    ${proceed_to_checkout}

    Card details form
    Delete account after logging in