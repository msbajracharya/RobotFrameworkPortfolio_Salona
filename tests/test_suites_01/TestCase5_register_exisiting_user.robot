*** Settings ***
Resource       ../../resources/new_user_creation.robot
Resource        ../../resources/login_user.robot


*** Variables ***
${login_page}   xpath=//*[@id="form"]/div/div/div[1]/div/h2
${login_email}  xpath=//*[@name="email"]
${login_password}  xpath=//*[@name="password"]
${login_button}  xpath=//*[@id="form"]/div/div/div[1]/div/form/button
${existing_user_validation}   xpath=//*[@id="form"]/div/div/div[3]/div/form/p


*** Test Cases ***
User login with existing email and password
    [Documentation]     This test case is checking if signup is blocked when existing username and password is used. Here
    ...                 Functionality to create a new user is being reused from resources/new_user_creation.robot
    ...                After a new user is created then its email and password is used is used again to check the signup validation
    ...                To prevent the dublicate record, the created user is again logged in and deleted 
    Open Website and sign up page 
    Open Browser    ${BASE_URL}     chrome    executable_path= ${CHROME_DRIVER_PATH}
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Wait Until Page Contains Element  ${signup_login_button}
    Click Element  ${signup_login_button} 
    ${actual_text1}  Get Text  ${login_page}
    Should Be Equal As Strings  ${actual_text1}   Login to your account
    Input Text            ${new_user_name_field_locator}    ${user_name}
    Input Text            ${new_user_email_field_locator}   ${user_email}
    Click Button          ${signup_button}
    Wait Until Element Is Visible      ${existing_user_validation}
    ${actual_text2}  Get Text  ${existing_user_validation}
    Should Be Equal As Strings  ${actual_text2}   Email Address already exist!
    
    #To prevent the dublication, the created user is logged in and deleted
    User login with email and password
    Click Element  ${delete_account}
    ${actual_text4}  Get Text  ${delete_success}
    Should Be Equal As Strings  ${actual_text4}   ACCOUNT DELETED!
    Click Element  ${continue_button}