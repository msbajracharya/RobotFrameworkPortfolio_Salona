*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${product_page}    xpath=//a[@href="/products"]
${polo_category}    xpath=//a[@href="/brand_products/Polo"]
${subcategory_page}    xpath=//h2[@class="title text-center"]
${brand1_subcategory_chosen}    BRAND - POLO PRODUCTS
${hnm_category}    xpath=//a[@href="/brand_products/H&M"]
${brand2_subcategory_chosen}    BRAND - POLO PRODUCTS

*** Test Cases ***
Open brand categories 
    [Documentation]     Opens the website, open brand from categories and verify right page is opened
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 

    Click Element    ${product_page}

    #open first brand polo
    Click Element    ${polo_category}
    
    # verify the right page is opened
    ${actual_text}    Get Text    ${subcategory_page}
    Should Be Equal As Strings    ${actual_text}    ${brand1_subcategory_chosen}
    
    #open second brand H&M
    Click Element    ${hnm_category}
    
   #verify the right page is opened
    ${actual_text2}    Get Text    ${subcategory_page}
    Should Be Equal As Strings    ${actual_text2}    ${brand2_subcategory_chosen}