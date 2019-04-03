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

Signup Test
    Log To Console  Sign up for Bleacher Report
    BleacherSmoke.Navigate to Page
    BleacherSmoke.Sign Up  Hello  World  11  12   1985

Login Test
    Log To Console  Log into Bleacher Report
    BleacherSmoke.Navigate To Page
    BleacherSmoke.Login  rharley77@gmail.com   test1234

Nav Menu Item Test
    Log To Console  Sub menu item count
    BleacherSmoke.Navigate To Page
    BleacherSmoke.Menu Item Count

League Category Landing Page Test
    Log To Console  League Category Landing
    BleacherSmoke.Navigate To Page
    BleacherSmoke.League Category Landing Pages

Non League Categories Landing Page Test
    Log To Console  Non League Category Landing
    BleacherSmoke.Navigate To Page
    BleacherSmoke.Non League Categories

