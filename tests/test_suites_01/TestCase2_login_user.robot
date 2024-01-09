*** Settings ***
Resource       ../../resources/new_user_creation.robot


*** Variables ***
${login_page}   xpath=//*[@id="form"]/div/div/div[1]/div/h2
${login_email}  xpath=//*[@name="email"]
${login_password}  xpath=//*[@name="password"]
${login_button}  xpath=//*[@id="form"]/div/div/div[1]/div/form/button


*** Test Cases ***
User login with email and password
    [Documentation]     This test case is checking the successful login of the page with valid username and password. Here
    ...                 Functionality to create a new user is being reused from resources/new_user_creation.robot
    ...                After a new user is created then its email and password is used in the login 
    Open Website and sign up page 
    Open Browser    http://automationexercise.com     chrome    executable_path= ../../chromedriver.exe
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
    Click Element  ${delete_account}
    ${actual_text4}  Get Text  ${delete_success}
    Should Be Equal As Strings  ${actual_text4}   ACCOUNT DELETED!
    Click Element  ${continue_button}