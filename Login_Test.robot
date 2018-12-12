*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Login
    Open Browser    https://jaas.wdf.sap.corp:49531/login?from=%2FuserContent%2Ftap%2Findex.html    chrome
    Maximize Browser Window
    Input Text    //input[@name="j_username"]    D071250
    Input Text    //input[@name="j_password"]    Virataksh17*
    Click Button    //input[@name="Submit"]
    Wait and Click    //bdi[text()='Dashboard']
    Wait and Click    //div[contains(@id,"__tile0-__layout0-2-__panel0-__layout0-2-1-title")]

Success_Rate
    Open Browser    https://jaas.wdf.sap.corp:49531/login?from=%2FuserContent%2Ftap%2Findex.html    chrome
    Maximize Browser Window
    Input Text    //input[@name="j_username"]    D071250
    Input Text    //input[@name="j_password"]    Virataksh17*
    Click Button    //input[@name="Submit"]
    Wait and Click    //span[text()="Administration"]
    Sleep    2s
    Click Button    Administration
    Click Button    //span[contains(@id,"tap-clone580-inner")]
    sleep    2s
    Input Text    //input[@name="t_text"]    Plaintext
    Click Button    2s
    Sleep    //span[text()="submit"]
    Close Browser

Test_lines
    ${expand}=    Run Keyword And Return Status    Element Should Not Be Visible    (//span[contains(@id,"ap---VJA--GOTOJR-__clone578-inner")])[1]
    Run Keyword If    '${expand}'=='True'    Wait and Click

*** Keywords ***
Wait and Click
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    8s    0.25s    Wait until element clickable and click    ${locator}

Wait until element visible and enabled
    Wait Until Element Is Visible    ${locator}    timeout=20s
    Wait Until Element Is Enabled    ${locator}    timeout=20s

Wait until element clickable and click
    [Arguments]    ${locator}    ${time_out}=90s
    Wait Until Element Is Visible    ${locator}    timeout=20s
    Wait Until Element Is Enabled    ${locator}    timeout=20s
    Click Element    ${locator}
