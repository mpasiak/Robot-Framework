*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN URL}            https://www.phptravels.net/login
${BROWSER}              Chrome
@{list}                 Invalid Email or Password

*** Test Cases ***
Valid Login
    Open main page
    Input Username
    Input Password
    Login button
    Assert Demo User
    [Teardown]  Close Browser

Invalid Login
    Open main page
    Input invalid login
    Input invalid password
    Login button
    Assert invalid
    [Teardown]  Close Browser

***Keywords***
Open main page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title should be  Login
Input Username
    Input Text  name=username   user@phptravels.com
Input Password
    Input Text  name=password    demouser
Login button
    click element  class=loginbtn
Assert Demo User
    wait until element is visible   class=text-align-left
    Title should be  My Account
Input invalid login
    Input Text  name=username   user@phptravels.co
Input invalid password
    Input Text  name=password    demouse
Assert invalid
    wait until element is visible   class=resultlogin
    get text  class=resultlogin
    Should Contain Any  ${list}     Invalid Email or Password

