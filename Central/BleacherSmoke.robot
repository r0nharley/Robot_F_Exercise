*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Collections

Resource   ${EXECDIR}/Central/Common.robot





*** Variables ***

${br_url}                      https://bleacherreport.com/
${br_logo}                      //svg[@class='atom logo svg br'][contains(.,'Bleacher Report Logo')]
${sign_up_button_header}       //a[contains(@class,'sign-up')]
${sign_up_with_email_btn}      //button[contains(.,'Sign up with Email')]
${email_signup_modal_header}    //h2[contains(.,'What is your name?')]
${first_name_field}            //input[contains(@name,'first_name')]
${last_name_field}             //input[contains(@name,'last_name')]
${continue_btn}                //button[contains(.,'Continue')]
${username_modal_header}        //h2[contains(.,'Choose a Username')]
${user_name_field}             //input[contains(@name,'username')]
${signup_email_modal_header}    //h2[contains(.,'Sign Up with Email')]
${email_field}                 //input[contains(@name,'email')]
${password_field}               //input[contains(@name,'password')]
${bday_modal_header}            //h1[contains(.,'What’s Your Birthday?')]
${birthday_month_field}        //input[contains(@name,'birthmonth')]
${birthday_day_field}          //input[contains(@name,'birthday')]
${birthday_year_field}         //input[contains(@name,'birthyear')]
${verification_email_sent}     //h2[contains(.,'Verification email sent.')]
${existing_user_loggedin}       //li[contains(.,'RonProfileSettingsLogoutEdition')]
${new_user_loggedin}            //li[contains(.,'HelloProfileSettingsLogoutEdition')]
${login_button_header}         //a[contains(@class,'login')]
${signin_with_email_btn}        //button[contains(.,'Sign in with Email')]
${signin_btn}                   //button[contains(.,'Sign In')]
${login_signup_link}           //a[contains(.,'Don’t have an account? Sign Up')]
${signin_with_phone_header}    //h2[contains(.,'Sign In with Your Phone')]
${signin_with_phone_field}     //input[contains(@name,'telephone')]
${send_sms_button}             //button[contains(.,'Send SMS Verification')]
${signin_w_fb_email_btn}       //a[contains(.,'Sign In with Facebook or Email')]
${modal_back_btn}              //button[contains(.,'Left Arrow IconBack')]
${fb_signin_btn}               //button[contains(.,'Facebook LogoSign in with Facebook')]
${nfl_header}                  //a[contains(text(),'NFL')]
${nfl_logo}                    //div[@class='atom teamAvatar'][contains(.,'NFL')]
${cfb_header}                  //a[contains(text(),'CFB')]
${cfb_logo}                    //div[@class='atom teamAvatar'][contains(.,'College Football')]
${nba_header}                  //a[contains(text(),'NBA')]
${nba_logo}                    //div[@class='atom teamAvatar'][contains(.,'NBA')]
${world_fb_header}             //a[contains(text(),'World Football')]
${world_fb_logo}               //div[@class='atom teamAvatar'][contains(.,'World Football')]
${mlb_header}                  //a[contains(text(),'MLB')]
${mlb_logo}                    //div[@class='atom teamAvatar'][contains(.,'MLB')]
${nhl_header}                  //a[contains(text(),'NHL')]
${nhl_logo}                    //div[@class='atom teamAvatar'][contains(.,'NHL')]
${cbb_header}                  //a[contains(text(),'CBB')]
${cbb_logo}                    //div[@class='atom teamAvatar'][contains(.,'College Basketball')]
${mma_header}                  //a[contains(text(),'MMA')]
${mma_logo}                    //div[@class='atom teamAvatar'][contains(.,'MMA')]
${wwe_header}                  //a[contains(text(),'WWE')]
${wwe_logo}                    //div[@class='atom teamAvatar'][contains(.,'WWE')]
${golf_header}                 //a[contains(text(),'Golf')]
${golf_logo}                   //div[@class='atom teamAvatar'][contains(.,'Golf')]
${tennis_header}               //a[contains(text(),'Tennis')]
${tennis_logo}                 //div[@class='atom teamAvatar'][contains(.,'Tennis')]
${boxing_header}               //a[contains(text(),'Boxing')]
${boxing_logo}                 //div[@class='atom teamAvatar'][contains(.,'Boxing')]
${more_header}                 //a[contains(.,'More')]
${shows_header}                //a[contains(.,'Shows')]
${brlive_header}               //a[contains(.,'B/R Live')]
${mag_header}                  //a[contains(.,'Mag')]
${get_app_header}              //a[contains(.,'Get the App')]
${get_app_page_header}         //h1[contains(.,'Stay ahead of the game')]
${tickets_header}              //a[contains(.,'Tickets')]
${about_link}                  //a[@href='/about']
${advertise_link}              //a[contains(.,'Advertise')]
${contact_link}                //a[contains(.,'Contact Us')]
${careers_link}                //a[contains(.,'Careers')]
${community_guide_link}        //a[contains(.,'Community Guidelines')]
${privacy_link}                //a[contains(.,'Privacy')]
${terms_of_use_link}           //a[contains(.,'Terms Of Use')]
${tickets_link}                //a[@href='https://www.stubhub.com/?gcid=chAFF-_-geoUS-_-genAllTix-_-dt170312-_-cmpBR_footr-_-partBleacherReport'][contains(.,'Tickets')]
${add_choices_link}            (//a[@href='#'][contains(.,'AdChoices')])[1]
${gmail_email}                  @gmail.com
${nav_menu_2}                   //section/div/nav/ol/li/a
${nav_menu_items}               //div[2]/div/nav/ol/li/a
${default_timeout}              5
${br_live_page_confirm}         (//img[contains(@alt,'B/R Live')])[1]
${mag_page_confirm}             //p[@class='intro']
${get_app_page_confirm}         //h1[contains(.,'Stay ahead of the game')]
${tickets_page_confirm}         //h1[contains(.,'StubHub - Where Fans Buy & Sell Tickets')]
${category_css_header}          css=h1 span



*** Keywords ***


Navigate To Page
    [Tags]  Go to BleacherReport url
    Log To Console  Navigating to BleacherReport.com
    go to  ${br_url}
    maximize browser window

Sign Up
    [Tags]  Sign Up
    [Documentation]  Creates a user and goes through the sign up workflow.
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
    Set Selenium Speed  0.1
    Wait Until Element Is Enabled  ${continue_btn}
    Click Button  ${continue_btn}
    Wait Until Element is Visible  ${signup_email_modal_header}  ${default_timeout}
    Input Text  ${email_field}  ${email_random_string}${gmail_email}
    Input Text  ${password_field}  ${pw_random_string}
    Click Button  ${continue_btn}
    Wait Until Element is Visible  ${bday_modal_header}  ${default_timeout}
    Input Text  ${birthday_month_field}  ${birth_month}
    Input Text  ${birthday_day_field}    ${birth_date}
    Input Text  ${birthday_year_field}   ${birth_year}
    Click Button  ${continue_btn}
    Wait Until Element is Visible  ${verification_email_sent}  ${default_timeout}
    Wait Until Element is Visible  ${new_user_loggedin}  ${default_timeout}


Login
    [Tags]  Login
    [Documentation]  Goes through the Login workflow.
    [Arguments]  ${EMAIL}  ${PASSWORD}
    ${login_email}=  Set Variable  ${EMAIL}
    ${login_password}=  Set Variable  ${PASSWORD}
    Click Element   ${login_button_header}
    Wait Until Element is Visible  ${signin_with_email_btn}  ${default_timeout}
    Click Element   ${signin_with_email_btn}
    Input Text  ${email_field}  ${login_email}
    Input Text  ${password_field}  ${login_password}
    Click Button  ${signin_btn}
    Wait Until Element is Visible  ${existing_user_loggedin}  ${default_timeout}


Menu Item Count
    [Tags]  Sub Menu Count
    [Documentation]  Loops over all of the category menus, adds the number of menu items in each category to a list, and confirms that the number of menu items matches a known good list of menu items.
    @{ITEMS}  Create List  ${nfl_header}    ${cfb_header}    ${nba_header}    ${world_fb_header}    ${mlb_header}    ${nhl_header}    ${cbb_header}    ${more_header}
    @{ITEMS2}  Create List  ${mma_header}    ${wwe_header}    ${golf_header}    ${tennis_header}    ${boxing_header}    ${shows_header}
    ${Expected_Menu_Items_Num}=  Create List    ${32}    ${81}    ${30}    ${246}    ${30}    ${31}    ${89}    ${7}    ${2}    ${2}    ${0}    ${2}    ${2}    ${4}
    ${Actual_Menu_Items_Num}=   Create List
    :FOR   ${ELEMENT}    IN    @{ITEMS}
    \   Set Window Size  2000  800
    \    Log    ${ELEMENT}
    \    Mouse Over  ${ELEMENT}
    \    ${count}=  Get Element Count   ${nav_menu_items}
    \    Log to console   ${count}
    \    Append To List  ${Actual_Menu_Items_Num}  ${count}
    :FOR   ${ELEMENT}    IN    @{ITEMS2}
    \   Set Window Size  2000  800
    \    Log    ${ELEMENT}
    \    Mouse Over  ${ELEMENT}
    \    ${count}=  Get Element Count   ${nav_menu_2}
    \    Log to console   ${count}
    \    Append To List  ${Actual_Menu_Items_Num}  ${count}
    Log List  ${Actual_Menu_Items_Num}
    Log list  ${Expected_Menu_Items_Num}
    Lists Should Be Equal   ${Actual_Menu_Items_Num}   ${Expected_Menu_Items_Num}


League Category Landing Pages
    [Tags]  League Category Landing Pages
    [Documentation]  Uses a loop to clicks on each of the League Category Headers, confirms that the category landing page is displayed, writes category hearder name to a list, and compares that list to a know good list of category headers.
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


Non League Categories
    [Tags]  Non League Category Landing Pages
    [Documentation]  Clicks on each of the Non League Categories and confirms that the landing page is displayed.
    Set Window Size  2000  800
    Click Element   ${brlive_header}
    Wait Until Element is Visible   ${br_live_page_confirm}   10
    Go Back
    Wait Until Element is Visible  ${mag_header}
    Click Element   ${mag_header}
    Wait Until Element is Visible   ${mag_page_confirm}  ${default_timeout}
    Go Back
    Wait Until Element is Visible   ${get_app_header}  ${default_timeout}
    Click Element  ${get_app_header}
    Wait Until Element is Visible   ${get_app_page_confirm}  ${default_timeout}
    Click Element  ${tickets_header}
    Wait Until Element is Visible   ${tickets_page_confirm}  ${default_timeout}
