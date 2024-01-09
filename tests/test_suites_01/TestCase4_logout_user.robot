*** Settings ***
Resource           ../../resources/new_user_creation.robot
Resource           ../../resources/login_user.robot


*** Variables ***
${logout_user}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a


*** Test Cases ***
User login with email and password
    [Documentation]     This test case is checking the successful logout of user, Here
    ...                 Functionality to create a new user is being reused from resources/new_user_creation.robot
    ...                After a new user is created then its email and password is used in the login 
    Open Website and sign up page 
    User login with email and password
    Click Element    ${logout_user}
    ${actual_text1}  Get Text  ${login_page}
    Should Be Equal As Strings  ${actual_text1}   Login to your account