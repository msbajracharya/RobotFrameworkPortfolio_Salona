*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot

*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${women_category}    xpath=//a[@href="#Women"]
${women_subcategory}    xpath=//a[@href="/category_products/1"]
${subcategory_page}    xpath=//h2[@class="title text-center"]
${women_subcategory_chosen}    WOMEN - DRESS PRODUCTS
${men_category}    xpath=//a[@href="#Men"]
${men_subcategory}    xpath=//a[@href="/category_products/3"]
${men_subcategory_chosen}    MEN - TSHIRTS PRODUCTS

*** Test Cases ***
Verify the product category page 
    [Documentation]     Opens the website, open Mens and Women's category and verify the right page is opened
      
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 

    Click Element    ${women_category}
    Click Element    ${women_subcategory}
    
    # After women subcategory is opened, verify the right page is opened
    ${actual_text}    Get Text    ${subcategory_page}
    Should Be Equal As Strings    ${actual_text}    ${women_subcategory_chosen}
    
    Click Element    ${men_category}
    Click Element    ${men_subcategory}
    
   # After men subcategory is opened, verify the right page is opened
    ${actual_text2}    Get Text    ${subcategory_page}
    Should Be Equal As Strings    ${actual_text2}    ${men_subcategory_chosen}