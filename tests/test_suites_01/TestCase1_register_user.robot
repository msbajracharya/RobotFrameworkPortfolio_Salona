*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${signup_login_button}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
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


*** Test Cases ***
Open Website and sign up page
    [Documentation]     Opens the website, checks if the page was successfully opened and go to Login/signup page
    Open Browser    http://automationexercise.com     chrome    executable_path= ../../chromedriver.exe
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Wait Until Page Contains Element  ${signup_login_button}
    Click Element  ${signup_login_button} 
    

    
Signup for new user
    [Documentation]     Check if the signup page is opened, and fill up the username and email in the signup form
    Element Should Be Visible  ${signup_text_locator}
    Input Text            ${new_user_name_field_locator}    ${user_name}
    Input Text            ${new_user_email_field_locator}   ${user_email}
    Click Button          ${signup_button}
    Element Should Be Visible  ${detail_info_page}  timeout=10s
    ${actual_text}  Get Text   ${detail_info_page}
    Should Be Equal As Strings  ${actual_text}  ENTER ACCOUNT INFORMATION


User info for new user
    [Documentation]     Check the enter account information is opened and fills up all the details and save
    ...                This testcase also delets the created user after successful login
    ...    

    #Validates if the username and email given when signing up is automatically populated in that specific field
    ${actual_text}  Get Value   ${new_user_name_field_locator}
    Should Be Equal As Strings  ${actual_text}  ${user_name}
    ${actual_text1}  Get Value   ${new_user_email_disabled}  
    Should Be Equal As Strings  ${actual_text1}  ${user_email}

    #Fill up other remaining fields
    Input Text   ${passwordfield_locator}  ${user_password}
    Select From List By Value     ${dob_days_id}   5
    Select From List By Value     ${dob_months_id}   5
    Select From List By Value     ${dob_years_id}   2000
    Scroll Element Into View    ${company_textfield}  
    Click Element  ${signup_newsletter_checkbox}
    Click Element  ${specialoffer_checkbox} 
    Input Text    ${firstname_textfield}  Test
    Input Text  ${lastname_textfield}   Automated
    Input Text  ${company_textfield}  ABC
    Input Text  ${address_textfield}  adress1
    Input Text  ${address2_textfield}  address2
    Select From List By Value  ${country_dropdown}     Australia
    Input Text  ${state_textfield}  state1
    Input Text  ${city_textfield}  city1
    Input Text  ${zipcode_textfield}  01234
    Input Text  ${mobilenumber_textfield}  134567890
    Click Element  ${create_account_button}

    #After details are filled up, it checks if the account is successfully created
    ${actual_text2}  Get Text  ${account_created_success}
    Should Be Equal As Strings  ${actual_text2}   ACCOUNT CREATED!
    Click Element  ${continue_button}

    #Checks if the logged in user is shown
    ${actual_text3}  Get Text  ${loggedin_user}
    Should Be Equal As Strings  ${actual_text3}   Logged in as ${user_name}
    Sleep  5s

    #Delete the logged in user
    Click Element  ${delete_account}
    ${actual_text4}  Get Text  ${delete_success}
    Should Be Equal As Strings  ${actual_text4}   ACCOUNT DELETED!
    Click Element  ${continue_button}