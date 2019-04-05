*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections

Resource   ${EXECDIR}/Central/Common.robot
Resource   ${EXECDIR}/Central/Variables.robot




*** Variables ***


*** Keywords ***


Navigate_To_Page
    [Tags]  Go to BleacherReport url
    Log To Console  Navigating to BleacherReport.com
    go to  ${br_url}
    maximize browser window

Sign_Up/Login
    [Tags]  Sign Up
    [Documentation]  Creates a user and goes through the sign up workflow, Signs out of the application, and signs back in with the new user
    [Arguments]  ${FIRST_N}  ${LAST_N}  ${MONTH}  ${DAY}  ${YEAR}
    ${first_name}=  Set Variable  ${FIRST_N}
    ${last_name}=  Set Variable  ${LAST_N}
    ${birth_month}=  Set Variable  ${MONTH}
    ${birth_date}=  Set Variable  ${DAY}
    ${birth_year}=  Set Variable  ${YEAR}
    ${user_random_string}=    Generate Random String  8
    ${email_random_string}=   Generate Random String  8
    ${pw_random_string}=      Generate Random String  8
    Click Element  ${sign_up_button_header}
    Wait Until Element is Visible   ${sign_up_with_email_btn}  ${default_timeout}
    Click Element  ${sign_up_with_email_btn}
    Wait Until Element is Visible  ${email_signup_modal_header}  ${default_timeout}
    Click Element   ${first_name_field}
    Input Text      ${first_name_field}  ${first_name}
    Click Element   ${last_name_field}
    Input Text      ${last_name_field}  ${last_name}
    Click Element   ${continue_btn}
    Wait Until Element is Visible  ${username_modal_header}  ${default_timeout}
    Input Text  ${user_name_field}   ${user_random_string}
    Wait Until Element Is Visible   ${continue_btn}   ${default_timeout}
    Set Selenium Speed  0.2
    Click Button  ${continue_btn}
    Set Selenium Speed  0.0
    Click Button  ${continue_btn}
    Wait Until Element is Visible  ${signup_email_modal_header}  ${default_timeout}
    Input Text  ${email_field}  ${email_random_string}${gmail_email}
    Input Password  ${password_field}  ${pw_random_string}
    Click Button  ${continue_btn}
    Wait Until Element is Visible  ${bday_modal_header}  ${default_timeout}
    Input Text  ${birthday_month_field}  ${birth_month}
    Input Text  ${birthday_day_field}    ${birth_date}
    Input Text  ${birthday_year_field}   ${birth_year}
    Click Button  ${continue_btn}
    Wait Until Element is Visible  ${verification_email_sent}  ${default_timeout}
    Wait Until Element is Visible  ${new_user_loggedin}  ${default_timeout}
    Mouse Over  ${new_user_loggedin}
    Wait Until Element is Visible  ${logout_btn}  ${default_timeout}
    Click Element   ${logout_btn}
    Wait Until Element Is Not Visible  ${new_user_loggedin}
    Wait Until Element Is Visible  ${login_button_header}   ${default_timeout}
    Click Element   ${login_button_header}
    Wait Until Element is Visible  ${signin_with_email_btn}  ${default_timeout}
    Click Element   ${signin_with_email_btn}
    Input Text  ${email_field}  ${email_random_string}${gmail_email}
    Input Password  ${password_field}  ${pw_random_string}
    Click Button  ${signin_btn}
    Wait Until Element is Visible  ${new_user_loggedin}  ${default_timeout}


Existing_User_Login
    [Tags]  Login
    [Documentation]  Goes through the Login workflow with an existing user.
    [Arguments]  ${EMAIL}  ${PASSWORD}
    ${login_email}=  Set Variable  ${EMAIL}
    ${login_password}=  Set Variable  ${PASSWORD}
    Click Element   ${login_button_header}
    Wait Until Element is Visible  ${signin_with_email_btn}  ${default_timeout}
    Click Element   ${signin_with_email_btn}
    Input Text  ${email_field}  ${login_email}
    Input Password  ${password_field}  ${login_password}
    Click Button  ${signin_btn}
    Wait Until Element is Visible  ${existing_user_loggedin}  ${default_timeout}


Menu_Item_Count
    [Tags]  Sub Menu Count
    [Documentation]  Loops over all of the category menus, adds the number of menu items in each category to a list, and confirms that the number of menu items matches a known good list of menu items.
    @{ITEMS}  Create List  ${nfl_header}    ${cfb_header}    ${nba_header}    ${world_fb_header}    ${mlb_header}    ${nhl_header}    ${cbb_header}    ${more_header}
    @{ITEMS2}  Create List  ${mma_header}    ${wwe_header}    ${golf_header}    ${tennis_header}    ${boxing_header}    ${shows_header}
    ${Expected_Menu_Items_Num}=  Create List    ${32}    ${81}    ${30}    ${247}    ${30}    ${31}    ${89}    ${7}    ${2}    ${1}    ${1}    ${0}    ${2}    ${4}
    ${Actual_Menu_Items_Num}=   Create List
    :FOR   ${ELEMENT}    IN    @{ITEMS}
    \    Set Window Size  2000  800
    \    Log    ${ELEMENT}
    \    Mouse Over  ${ELEMENT}
    \    ${count}=  Get Element Count   ${nav_menu_items}
    \    Log to console   ${count}
    \    Append To List  ${Actual_Menu_Items_Num}  ${count}
    :FOR   ${ELEMENT}    IN    @{ITEMS2}
    \    Set Window Size  2000  800
    \    Log    ${ELEMENT}
    \    Mouse Over  ${ELEMENT}
    \    ${count}=  Get Element Count   ${nav_menu_2}
    \    Log to console   ${count}
    \    Append To List  ${Actual_Menu_Items_Num}  ${count}
    Log List  ${Actual_Menu_Items_Num}
    Log list  ${Expected_Menu_Items_Num}
    Lists Should Be Equal   ${Actual_Menu_Items_Num}   ${Expected_Menu_Items_Num}


League_Category_Landing_Pages
    [Tags]  League Category Landing Pages
    [Documentation]  Uses a loop to clicks on each of the League Categories in the menu and confirms that the category landing page is displayed. Writes each category header name to a list, and compares that list to a know good list of landing page category headers.
    @{ITEMS}  Create List  ${nfl_header}    ${cfb_header}    ${nba_header}    ${world_fb_header}    ${mlb_header}    ${nhl_header}    ${cbb_header}    ${mma_header}    ${wwe_header}    ${golf_header}    ${tennis_header}    ${boxing_header}
    ${Expected_Headers}  Create List    NFL    COLLEGE FOOTBALL    NBA    WORLD FOOTBALL    MLB    NHL    COLLEGE BASKETBALL    MMA    WWE    GOLF    TENNIS    BOXING
    ${Actual_Headers}=   Create List
    :FOR   ${ELEMENT}    IN    @{ITEMS}
    \    Set Window Size  2000  800
    \    Log    ${ELEMENT}
    \    Click Element  ${ELEMENT}
    \    Wait Until Element is Visible  ${category_css_header}
    \    ${header_text}=  Get Text  ${category_css_header}
    \    Log to console  ${header_text}
    \    Append To List   ${Actual_Headers}   ${header_text}
    Log List  ${Actual_Headers}
    Lists Should Be Equal   ${Expected_Headers}   ${Actual_Headers}


Non_League_Category_Landing_Pages
    [Tags]  Non League Category Landing Pages
    [Documentation]  Clicks on each of the Non League Categories in the menu and confirms that the landing page is displayed.
    Set Window Size  2000  800
    ${Browser_Back}=  run keyword and return status   Wait Until Element is Visible  ${brlive_header}    ${default_timeout}
    Click Element   ${brlive_header}
    Wait Until Element is Visible   ${br_live_page_confirm}   10
    Run Keyword If   ${Browser_Back}   Go Back
    Wait Until Element is Visible  ${mag_header}  8
    Click Element   ${mag_header}
    Wait Until Element is Visible   ${mag_page_confirm}  ${default_timeout}
    Run Keyword If   ${Browser_Back}   Go Back
    Wait Until Element is Visible   ${get_app_header}  ${default_timeout}
    Click Element  ${get_app_header}
    Wait Until Element is Visible   ${get_app_page_confirm}  ${default_timeout}
    Click Element  ${tickets_header}
    Wait Until Element is Visible   ${tickets_page_confirm}  ${default_timeout}
