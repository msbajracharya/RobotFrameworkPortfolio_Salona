*** settings ***
Library        SeleniumLibrary
Resource       config.robot


*** Keywords ***
Open browser and install add_extension to block the ads
    [Documentation]        Since we are automating a website which is published in the internet, and the website contains ads
    ...                    like in any normal websites. The ads blocks the flow of automation. So to avoid this, a browser extension
    ...                    is used which blocks the ads in the website. crx file is used here that installs the adblock extension
    ...                    on every browser opened.


    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
12    Call Method    ${chrome_options}    add_argument    --load-extension=${adblocker_crx_path}
13    Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${CHROMEDRIVER_PATH}

    #It takes some time for the adblocker to get installed so have put a hard sleep here for now.
    #Need to figure out how to use explicit wait here
    Sleep     10s
    Go To    ${BASE_URL}
