*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Headless Browser Example
    Open Browser    https://www.example.com    Chrome    executable_path=./chromedriver    options=add_argument("--headless")
    # Add your test steps here
    Close Browser
