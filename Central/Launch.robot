*** Settings ***
Documentation  Bleacher Report Smoke Test

Resource   ${EXECDIR}/Central/Common.robot
Resource   ${EXECDIR}/Central/BleacherSmoke.robot



Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***

${BROWSER}   chrome


*** Test Cases ***


Navigate to Page
    Log To Console  Navigating to Bleacher Report
    BleacherSmoke.Navigate to Page

New User Signup/Login Test
    Log To Console  Sign up for Bleacher Report
    BleacherSmoke.Navigate_To_Page
    BleacherSmoke.Sign_Up/Login  Hello  World  11  12  1985

Existing User Login Test
    Log To Console  Log into Bleacher Report
    BleacherSmoke.Navigate_To_Page
    BleacherSmoke.Existing_User_Login  Yl4BGztY@gmail.com   tknbip0R

Nav Menu Item Test
    Log To Console  Sub menu item count
    BleacherSmoke.Navigate_To_Page
    BleacherSmoke.Menu_Item_Count

League Category Landing Page Test
    Log To Console  League Category Landing
    BleacherSmoke.Navigate_To_Page
    BleacherSmoke.League_Category_Landing_Pages

Non League Category Landing Page Test
    Log To Console  Non League Category Landing
    BleacherSmoke.Navigate_To_Page
    BleacherSmoke.Non_League_Category_Landing_Pages


API Tests
    BleacherSmoke.API_Tests