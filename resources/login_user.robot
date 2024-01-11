*** Settings ***
Resource       new_user_creation.robot


*** Variables ***
${login_page}   xpath=//*[@id="form"]/div/div/div[1]/div/h2
${login_email}  xpath=//*[@name="email"]
${login_password}  xpath=//*[@name="password"]
${login_button}  xpath=//*[@id="form"]/div/div/div[1]/div/form/button


*** Keywords ***
User login with email and password
    [Documentation]     This test case is checking the successful login of the page with valid username and password. Here
    ...                same email and password is used in the login  which is created in resources/new_user_creation.robot
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
    
    