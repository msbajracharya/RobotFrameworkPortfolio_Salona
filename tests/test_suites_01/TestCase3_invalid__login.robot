*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${signup_login_button}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a
${signup_text_locator}  xpath=//*[contains(text(),'New User Signup!')]
${login_page}   xpath=//*[@id="form"]/div/div/div[1]/div/h2
${login_email}  xpath=//*[@name="email"]
${login_password}  xpath=//*[@name="password"]
${login_button}  xpath=//*[@id="form"]/div/div/div[1]/div/form/button
${invalid_user_validation}   xpath=//*[@id="form"]/div/div/div[1]/div/form/p

*** Test Cases ***
User login with email and password
    [Documentation]     Verify the login is not successful with invalid email and password
    Open Browser    http://automationexercise.com     chrome    executable_path= ../../chromedriver.exe
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    Wait Until Page Contains Element  ${signup_login_button}
    Click Element  ${signup_login_button} 
    ${actual_text1}  Get Text  ${login_page}
    Should Be Equal As Strings  ${actual_text1}   Login to your account
    Input Text  ${login_email}  random.random@t.co
    Input Text  ${login_password}  password
    Click Element  ${login_button}
    ${actual_text2}  Get Text  ${invalid_user_validation}
    Should Be Equal As Strings  ${actual_text2}   Your email or password is incorrect!
    