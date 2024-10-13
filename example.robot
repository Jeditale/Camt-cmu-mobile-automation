*** Settings ***
Library    AppiumLibrary
Variables    ${CURDIR}/device.yml

*** Variables ***
${REMOTE_URL}    http://127.0.0.1:4723
${login.txt_username}    accessibility_id=test-Username
${login.txt_password}    accessibility_id=test-Password
${login.btn_login}    accessibility_id=test-LOGIN

${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Open CAMT APPLICATION
    Input Username    ${USERNAME}
    Input Password    ${PASSWORD}
    Click Login button
    Wait Until Element Is Visible    locator=android=new UiSelector().description("test-Cart drop zone").childSelector(new UiSelector().text("PRODUCTS"))    timeout=5s
    Wait Until Element Is Visible    locator=accessibility_id=test-Menu    timeout=5s
    Click Element    locator=accessibility_id=test-Menu
    Wait Until Element Is Visible    locator=accessibility_id=test-WEBVIEW    timeout=5s
    Click Element    locator=accessibility_id=test-WEBVIEW
    Wait Until Element Is Visible    locator=accessibility_id=test-enter a https url here...    timeout=5s
    Input Text    locator=accessibility_id=test-enter a https url here...    text=https://google.com
    
    Sleep    5s

*** Keywords ***
Input Username
    [Arguments]    ${USER}
     Open Application    ${REMOTE_URL}    &{ANDROID_DEVICE}
    Wait Until Element Is Visible    locator=${login.txt_username}    timeout=5s
    Input Text    locator=${login.txt_username}    text=${USER}

Input Password
    [Arguments]    ${PASS}
    Wait Until Element Is Visible    locator=${login.txt_password}  timeout=5s
    Input Text    locator=${login.txt_password}    text=${PASS}

Click Login button
    Wait Until Element Is Visible    locator=${login.btn_login}  timeout=5s
    Click Element    locator=${login.btn_login}
    