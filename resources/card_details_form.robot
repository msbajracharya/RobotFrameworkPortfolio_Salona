*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${name_on_card_field}    xpath=//*[@name="name_on_card"]
${card_number_field}    xpath=//*[@name="card_number"]
${CVC_field}    xpath=//*[@name="cvc"]
${expiration_month_field}    xpath=//*[@name="expiry_month"]
${expiration_year_field}    xpath=//*[@name="expiry_year"]
${confirm_order_button}        xpath=//*[@id="submit"]
${order_confirmation_text}    xpath=//*[@id="form"]/div/div/div/p

*** Keywords ***
Card details form
    [Documentation]    This is card details form page, which can be resuable anytime the card details form needs to be filled up
    
    #Input all the values to the field
    Input Text    ${name_on_card_field}    Automated Test
    Input Text    ${card_number_field}    1234567890
    Input Text    ${CVC_field}    123
    Input Text    ${expiration_month_field}    12
    Input Text    ${expiration_year_field}    3000
    Click Element    ${confirm_order_button}
    
    #Confirm if the order was successfully placed or not
    Sleep     5s
    ${actual_text}    Get Text    ${order_confirmation_text}
    Should Be Equal As Strings    ${actual_text}    Congratulations! Your order has been confirmed!