*** Settings ***
Resource       ../../resources/new_user_creation.robot
Resource       ../../resources/delete_account.robot
Resource       ../../resources/card_details_form.robot
Resource       ../../resources/address_detail_verify.robot


*** Variables ***
${login_page}   xpath=//*[@id="form"]/div/div/div[1]/div/h2
${login_email}  xpath=//*[@name="email"]
${login_password}  xpath=//*[@name="password"]
${login_button}  xpath=//*[@id="form"]/div/div/div[1]/div/form/button
${first_product}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/p
${first_product_price}     xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/h2
${first_product_cart}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/a
${modal_box}    xpath=//*[@id="cartModal"]/div/div
${continue_shopping}    xpath=//*[@id="cartModal"]/div/div/div[3]/button
${view_cart}    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a/u
${proceed_to_checkout}    xpath=//*[@id="do_action"]/div[1]/div/div/a
${description_textarea}    xpath=//*[@id="ordermsg"]/textarea
${place_order}    xpath=//*[@id="cart_items"]/div/div[7]/a

*** Test Cases ***
Login user and Checkout to complete order
    [Documentation]     Login from valid user and process to checkout after adding product. Since we are logging from a valid user,
    ...                    we will first create a new user.
    Open Website and sign up page 
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Wait Until Page Contains Element  ${signup_login_button}
    Click Element  ${signup_login_button} 
    ${actual_text1}  Get Text  ${login_page}
    Should Be Equal As Strings  ${actual_text1}   Login to your account
    Input Text  ${login_email}  ${user_email}
    Input Text  ${login_password}  ${user_password}
    Click Element  ${login_button}
    ${actual_text3}  Get Text  ${loggedin_user}
    Should Be Equal As Strings  ${actual_text3}   Logged in as ${user_name}
    Sleep  5s
    
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

    Card details form
    Delete account after logging in
   
    