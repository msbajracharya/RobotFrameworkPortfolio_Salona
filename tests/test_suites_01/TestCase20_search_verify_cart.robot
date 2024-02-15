*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource       ../../resources/config.robot
Resource       ../../resources/disableAds.robot
Resource       ../../resources/new_user_creation.robot
Resource       ../../resources/login_user.robot
Resource       ../../resources/delete_account.robot


*** Variables ***
${page_indicate}   xpath=//*[contains(text(),'Full-Fledged practice website for Automation Engineers')]
${product_page}    xpath=//a[@href="/products"]
${search_field}    xpath=//input[@id="search_product"]
${search_text}    Blue Top
${search_button}    xpath=//button[@id="submit_search"]
${product_name}    xpath=/html/body/section[2]/div[1]/div/div[2]/div/div[2]/div/div[1]/div[1]/p
${subcategory_page}    xpath=//h2[@class="title text-center"]
${search_page}    SEARCHED PRODUCTS
${first_product}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/p
${first_product_cart}    xpath=/html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[2]/div/a
${modal_box}    xpath=//*[@id="cartModal"]/div/div
${view_cart}    xpath=//*[@id="cartModal"]/div/div/div[2]/p[2]/a/u
${first_product_verify}    xpath=//tr[@id="product-1"]/td[2]/h4/a
${cart_page}    xpath=//div/ul/li[3]/a


*** Test Cases ***
Search products and add to cart 
    [Documentation]     Opens the website, search for a product and add it to cart. Login and verify if the products still there after login
    
    #Since this test case require an existing user, we create a new user in new window
    Open Website and sign up page 

    #Continuing the testcase in a new window
    Open browser and install add_extension to block the ads
    Wait Until Page Contains Element    ${page_indicate}    timeout=10s
    Element Should Be Visible   ${page_indicate} 

    Click Element    ${product_page}

    #search product 
    Input Text    ${search_field}    ${search_text}
    Click Element    ${search_button}
    
    #Verify the search page is opened
    ${actual_text}    Get Text    ${subcategory_page}
    Should Be Equal As Strings    ${actual_text}    ${search_page}

    #Verify the search result matching
    ${actual_text1}    Get Text    ${product_name}
    Should Be Equal As Strings    ${actual_text1}    ${search_text}
    
    #Add product to cart
    Mouse Over    ${first_product} 
    Click Element    ${first_product_cart}
    Wait Until Element Is Visible    ${modal_box}

    #Open the cart
    Click Element    ${view_cart}

    #Verify the product in the cart
    ${actual_text2}    Get Text    ${first_product_verify}
    Should Be Equal As Strings    ${actual_text2}    ${search_text}

    #Open login page and sign in with the user created in the beginning of this test case
    Continue from signin page 
    Click Element    ${cart_page}
    
    #verifying again if the product is still there
    ${actual_text3}    Get Text    ${product_name}
    Should Be Equal As Strings    ${actual_text3}    ${search_text}

    #Deleting the account to prevent dublication in the future
    Delete account after logging in