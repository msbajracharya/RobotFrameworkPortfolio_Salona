*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Open Browser Example
    Open Browser    https://www.example.com    Chrome    executable_path=./chromedriver
    # Add your test steps here
    Close Browser
