*** Settings ***
Library  SeleniumLibrary
Resource       config.robot
Resource       disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${signup_login_button}  xpath=//div/ul/li[4]/a
${signup_text_locator}  xpath=//*[contains(text(),'New User Signup!')]
${new_user_name_field_locator}  xpath=//*[@name="name"]
${new_user_email_field_locator}  xpath=//input[@data-qa='signup-email']
${signup_button}  xpath=//*[@data-qa="signup-button"]
${detail_info_page}  xpath=//*[@id="form"]/div/div/div/div/h2/b
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

#Field values
${user_name}   TestName
${user_email}  test@tmail.coo
${user_password}  password
${first_name}    Test
${last_name}    Automated
${company_name}    ABC
${address1_name}    adress1
${address2_name}    adress2
${country_name}    Australia
${state}    state1
${city}    city1
${zipcode}    01234
${mobile_number}    134567890

*** Keywords *** 
Open Website and sign up page
    [Documentation]     This test case is creating a new user for the website. Some of the main test cases require a new user.
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Wait Until Page Contains Element  ${signup_login_button}
    

Continue from signup page
    Click Element  ${signup_login_button} 
    Element Should Be Visible  ${signup_text_locator}
    Input Text            ${new_user_name_field_locator}    ${user_name}
    Input Text            ${new_user_email_field_locator}   ${user_email}
    Click Button          ${signup_button}
    Element Should Be Visible  ${detail_info_page}  timeout=10s
    ${actual_text}  Get Text   ${detail_info_page}
    Should Be Equal As Strings  ${actual_text}  ENTER ACCOUNT INFORMATION
    ${actual_text}  Get Value   ${new_user_name_field_locator}
    Should Be Equal As Strings  ${actual_text}  ${user_name}
    ${actual_text1}  Get Value   ${new_user_email_disabled}  
    Should Be Equal As Strings  ${actual_text1}  ${user_email}
    Input Text   ${passwordfield_locator}  ${user_password}
    Select From List By Value     ${dob_days_id}   5
    Select From List By Value     ${dob_months_id}   5
    Select From List By Value     ${dob_years_id}   2000
    Scroll Element Into View    ${company_textfield}  
    Sleep  5s
    Click Element  ${signup_newsletter_checkbox}
    Click Element  ${specialoffer_checkbox} 
    Input Text    ${firstname_textfield}  ${first_name}
    Input Text  ${lastname_textfield}   ${last_name}
    Input Text  ${company_textfield}  ${company_name}
    Input Text  ${address_textfield}  ${address1_name}
    Input Text  ${address2_textfield}  ${address2_name}
    Select From List By Value  ${country_dropdown}     ${country_name} 
    Input Text  ${state_textfield}  ${state}
    Input Text  ${city_textfield}  ${city}
    Input Text  ${zipcode_textfield}  ${zipcode}
    Input Text  ${mobilenumber_textfield}  ${mobile_number}
    Click Element  ${create_account_button}
    ${actual_text2}  Get Text  ${account_created_success}
    Should Be Equal As Strings  ${actual_text2}   ACCOUNT CREATED!
    
    