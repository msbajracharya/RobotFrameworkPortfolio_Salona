*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${product_page}   xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
${product_page_indicate}    xpath=/html/body/section[2]/div/div/div[2]/div/h2
${search_field}    xpath=//*[@id="search_product"]
${search_button}    xpath=//*[@id="submit_search"]
${Search_result_xpath}    xpath=(//div[@class='col-sm-4'])  
${product_list_front}    /html/body/section[2]/div/div/div[2]/div/div[
${product_list_back}      ]/div/div[1]/div[1]/p



*** Test Cases ***
Search product and check products are matching or not
    [Documentation]     Opens the website, open search page and search for product. Verify if the result has only the product 
    ...                    that matches the search text. This testcase assumes there will be atleast 1 result for searched text
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 
    
    Click Element    ${product_page}
    ${actual_text1}    Get Text    ${product_page_indicate}
    Should Be Equal As Strings   ${actual_text1}  ALL PRODUCTS

    Input Text    ${search_field}    ${search_text}
    Click Element    ${search_button}

    #this will count the number of result. the xpath 'search_result_xpath' is common div for the result
    ${count}=     Get Element Count      ${Search_result_xpath}       
  
    #Here For loop is used to check if the result only contains the item with searched text. 
    FOR  ${index}  IN RANGE  2  ${count}+1
        #the xpath is concatenated where 'product_list_front' and 'product_list_back' are the matching variable for xpath
        ${text1}    Get Text    xpath=${product_list_front}${index}${product_list_back}
        Log    text ss${index}: ${text1} 
        Should Contain   ${text1}    ${search_text}    ignore_case=${True}
    END
   


