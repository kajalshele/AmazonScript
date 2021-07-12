*** Settings ***
Documentation    This is some basic info about the whole suite
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome

*** Test Cases ***
User must sign in to check out
    [Documentation]    This is some basic info about the test
    [Tags]    Smoke
    open browser    https://www.amazon.com/    ${BROWSER}
    wait until page contains element    nav-logo-sprites
    input text    xpath=//input[@id='twotabsearchtextbox']    Ferrari 458
    click button    id=nav-search-submit-button
    wait until page contains     results for "Ferrari 458"
    click element    xpath=//img[@alt='RASTAR Ferrari Remote Control Car, 1/24 Scale Ferrari 458 Italia Model Car, Red Ferrari Toy Car']
    wait until page contains    RASTAR Ferrari Remote Control Car, 1/24 Scale Ferrari 458 Italia Model Car, Red Ferrari Toy Car
    click element    xpath=//div[@id='contextualIngressPtLabel_deliveryShortLine']/span[last()]
    wait until page contains    Choose your location
    click element   id=GLUXCountryValue
    click element    xpath=//li[@aria-labelledby='GLUXCountryList_1']/a[text()='Canada']
    click button    xpath=//button[text()='Done']
    wait until element is enabled    add-to-cart-button
    click element    id=add-to-cart-button
    wait until page contains    Added to Cart
    click element    id=hlb-ptc-btn-native
    wait until page contains    Sign-In
    close browser

*** Keywords ***
