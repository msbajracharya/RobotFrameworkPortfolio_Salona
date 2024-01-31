*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot
Resource       ../../resources/new_user_creation.robot

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
${signup_text_locator}  xpath=//*[contains(text(),'New User Signup!')]
${new_user_name_field_locator}  xpath=//*[@name="name"]
${new_user_email_field_locator}  xpath=//input[@data-qa='signup-email']
${signup_button}  xpath=//*[@data-qa="signup-button"]
${detail_info_page}  xpath=//*[@id="form"]/div/div/div/div/h2/b
${user_name}   TestName
${user_email}  test@tmail.coo
${user_password}  password
${new_user_email_disabled}  xpath=//*[@id="email"]
${passwordfield_locator}   xpath=//*[@id="password"]
${dob_days_id}   xpath=//*[@id="days"]
${dob_months_id}   xpath=//*[@id="months"]
${dob_years_id}   xpath=//*[@id="years"]
${signup_newsletter_checkbox}  xpath=//*[@id="newsletter"]
${specialoffer_checkbox}  xpath=//*[@id="optin"]
${firstname_textfield}   xpath=//*[@id="first_name"]
${lastname_textfield}    xpath=//*[@id="last_name"]
${company_textfield}   xpath=//*[@id="company"]
${address_textfield}    xpath=//*[@id="address1"]
${address2_textfield}   xpath=//*[@id="address2"]
${country_dropdown}    xpath=//*[@id="country"]
${state_textfield}   xpath=//*[@id="state"]
${city_textfield}   xpath=//*[@id="city"]
${zipcode_textfield}    xpath=//*[@id="zipcode"]
${mobilenumber_textfield}    xpath=//*[@id="mobile_number"]
${create_account_button}  xpath=//*[@data-qa="create-account"]
${account_created_success}  xpath=//*[@id="form"]/div/div/div/h2/b

${continue_button}  xpath=//*[@data-qa="continue-button"]
${loggedin_user}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a
${delete_account}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${delete_success}  xpath=//*[@id="form"]/div/div/div/h2/b

${login_page}   xpath=//*[@id="form"]/div/div/div[1]/div/h2
${login_email}  xpath=//*[@name="email"]
${login_password}  xpath=//*[@name="password"]
${login_button}  xpath=//*[@id="form"]/div/div/div[1]/div/form/button

${cart_page}    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a


*** Test Cases ***
Add products to Cart and Register after checkout
    [Documentation]     Opens the website, add products to cart. Open the card , go to checkout and Register to complete the order
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    
   
   
    # hover over the first product and click add to cart
    Mouse Over    ${first_product} 
    Click Element    ${first_product_cart}
    Wait Until Element Is Visible    ${modal_box}
    Click Element    ${continue_shopping}

    #Open the cart
    Click Element    ${view_cart}
    
    #Proceed to checkout button
    Click Element    ${proceed_to_checkout}

    #at for modal to popup and Register link is clicked
    Wait Until Element Is Visible    ${checkout_modal_box}
    Click Element    ${register_link}
    ${result}=    Run Keyword If    True    Continue from signup page
   
    Click Element  ${continue_button}

    #Checks if the logged in user is shown
    ${actual_text3}  Get Text  ${loggedin_user}
    Should Be Equal As Strings  ${actual_text3}   Logged in as ${user_name}
    Sleep  5s


    Click Element    ${cart_page}
    Click Element    ${proceed_to_checkout}

