*** Settings ***
Library  SeleniumLibrary
Resource    new_user_creation.robot


*** Variables ***


#Field values
${name_value}    xpath=//*[@id="address_delivery"]/li[2]
${company_name_value}    xpath=//*[@id="address_delivery"]/li[3]
${address1_name_value}    xpath=//*[@id="address_delivery"]/li[4]
${address2_name_value}    xpath=//*[@id="address_delivery"]/li[5]
${country_name_value}    xpath=//*[@id="address_delivery"]/li[7]
${city_state_zip}    xpath=//*[@id="address_delivery"]/li[6]
${mobile_number_value}    xpath=//*[@id="address_delivery"]/li[8]

*** Keywords ***
Verify the delivery address is matching the address given while registering
    [Documentation]    Address details were given while registering the user, On checkout we varify if the address details are matching

    ${actual_name}    Get Text    ${name_value}
    Should Be Equal As Strings    ${actual_name}    .${first_name} ${last_name} 

    ${actual_comapny}    Get Text    ${company_name_value}
    Should Be Equal As Strings    ${actual_comapny}    ${company_name}

    ${actual_address1}    Get Text    ${address1_name_value}
    Should Be Equal As Strings    ${actual_address1}    ${address1_name}

    ${actual_addess2}    Get Text    ${address2_name_value}
    Should Be Equal As Strings    ${actual_addess2}    ${address2_name}

    ${actual_state}    Get Text    ${country_name_value}
    Should Be Equal As Strings    ${actual_state}    ${city} ${state} ${zipcode}

    ${actual_country}    Get Text    ${country_name_value}
    Should Be Equal As Strings    ${actual_country}    ${country_name}

    ${actual_mobile}    Get Text    ${mobile_number_value}
    Should Be Equal As Strings    ${actual_mobile}    ${mobile_number}

