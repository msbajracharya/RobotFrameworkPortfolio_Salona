*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${loggedin_user}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[10]/a
${delete_account}  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
${delete_success}  xpath=//*[@id="form"]/div/div/div/h2/b
${continue_button}  xpath=//*[@data-qa="continue-button"]


*** Keywords ***
Delete account after logging in
    [Documentation]    In most of the test case, we need to delete the account atfter completion of steps, so this resuable 
    ...                keyword to delete the account is created. This simply deleted account and checks for successfull deletion
    
    #Delete the logged in user
    Click Element  ${delete_account}
    ${actual_text4}  Get Text  ${delete_success}
    Should Be Equal As Strings  ${actual_text4}   ACCOUNT DELETED!
    Click Element  ${continue_button}
