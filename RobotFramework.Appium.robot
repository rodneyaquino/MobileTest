*** Settings ***

Documentation   Mobile Automation Test using Android Virtual Device

Library     AppiumLibrary

Force Tags      demo

Suite Setup    Open Application  http://127.0.0.1:4723/wd/hub  platformName=Android  platformVersion=8.1.0  deviceName=emulator-5554  automationName=appium  appPackage=com.android.calculator2  appActivity=com.android.calculator2.Calculator

Suite Teardown	Close Application

*** Variables ***

# Define elements in Calculator application
${Display}     xpath=//*[contains(@resource-id,'id/result')]
${equals}  xpath=//*[contains(@text,'=')]
${DEL}  xpath=//*[contains(@text,'DEL')]
${CLR}  xpath=//*[contains(@text,'CLR')]
${decimal}  xpath=//*[contains(@text,'.')]


# Define Expected Results for Test Cases
${expected_test_case_1}  7
${expected_test_case_2}  17
${expected_test_case_3}  10
${expected_test_case_4}  7
${expected_test_case_5}  3
${expected_test_case_6}  1
${expected_test_case_7}  24
${expected_test_case_8}  2
${expected_test_case_9}  102

*** Keywords ***
Two Digits and Operator
    [Documentation]  Enter Two Digits and One Operator

    [Arguments]  ${key1}    ${operator}		${key2}
    click element  xpath=//*[contains(@text,'${key1}')]
    click element  xpath=//*[contains(@content-desc,'${operator}')]
	click element  xpath=//*[contains(@text,'${key2}')]

Three Digits Two Operators
    [Documentation]  Test 3 digits and 2 Operators

    [Arguments]  ${key1}    ${operator}		${key2}		${operator2}    ${key3}
    click element  xpath=//*[contains(@text,'${key1}')]
    click element  xpath=//*[contains(@content-desc,'${operator}')]
	click element  xpath=//*[contains(@text,'${key2}')]
	click element  ${equals}
	click element  xpath=//*[contains(@content-desc,'${operator2}')]
	click element  xpath=//*[contains(@text,'${key3}')]
	
	
View Result
    [Documentation]  Press EQUALS to see the RESULT
    click element  ${equals}

Verify Result
    [Documentation]  Compare Actual Result vs Expected Result
    [Arguments]  ${expected_result}
    ${displayed_result}     get element attribute   ${Display}     text
    should be equal  ${displayed_result}     ${expected_result}

Clear Display
	[Documentation]	Press CLR to clear display
	wait until element is visible  ${CLR}
	click element  ${CLR}
	wait until element is visible  ${DEL}
	

*** Test Cases ***

Test Case 1 : Addition : 5 plus 2
    [Documentation]  5 + 2 should equal 7
    [tags]  android     addition	2digits

    log     "STEP 1: Enter two digits to add"
    Two Digits And Operator   5    plus		2

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_1}

	log		"CLEAR DISPLAY"
	Clear Display


Test Case 2 : Addition : 9 plus 8
    [Documentation]  9 + 8 should equal 17
    [tags]  android     addition	2digits

    log     "STEP 1: Enter two digits to add"
    Two Digits And Operator   9    plus		8

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_2}

	log		"CLEAR DISPLAY"
	Clear Display

Test Case 3 : Addition : 4 plus 6
    [Documentation]  4 + 6 should equal 10
    [tags]  android     addition	2digits

    log     "STEP 1: Enter two digits to add"
    Two Digits And Operator   4    plus		6

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_3}

	log		"CLEAR DISPLAY"
	Clear Display

Test Case 4 : Subtraction : 8 minus 1
    [Documentation]  8 - 1 should equal 7
    [tags]  android		subtraction		2digits

    log     "STEP 1: Enter two digits to subtract"
    Two Digits And Operator   8    minus		1

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_4}

	log		"CLEAR DISPLAY"
	Clear Display

Test Case 5 : Subtraction : 9 minus 6
    [Documentation]  9 - 6 should equal 3
    [tags]  android		subtraction		2digits

    log     "STEP 1: Enter two digits to subtract"
    Two Digits And Operator   9    minus		6

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_5}

	log		"CLEAR DISPLAY"
	Clear Display

Test Case 6 : Subtraction : 4 minus 3
    [Documentation]  4 - 3 should equal 1
    [tags]  android		subtraction		2digits

    log     "STEP 1: Enter two digits to subtract"
    Two Digits And Operator   4    minus	3

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_6}

	log		"CLEAR DISPLAY"
	Clear Display


Test Case 7 : Multiplication & Division : 9 multiplied by 8 divided by 3
    [Documentation]  9 times 8 divided by 3 should equal 24
    [tags]  android		multiplication	division		3digits

    log     "STEP 1: Using 3 digits do Multiplication and Division"
    Three Digits Two Operators   9  multiply    8       divide	        3

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_7}

	log		"CLEAR DISPLAY"
	Clear Display

Test Case 8 : Subtraction & Division : 8 minus 2 divided by 3
    [Documentation]  8 minus 2 divided by 3 should equal 2
    [tags]  android		subtraction		division		3digits

    log     "STEP 1: Using 3 digits do Subtraction and Division"
    Three Digits Two Operators   8		minus		2		divide		3

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_8}

	log		"CLEAR DISPLAY"
	Clear Display
	
Test Case 9 : Addition & Multiplication : 8 plus 9 multiplied by 6
    [Documentation]  8 plus 9 multiplied by 6 should equal 102
    [tags]  android		addition	multiplication		3digits

    log     "STEP 1: Using 3 digits do Addition and Multiplication"
    Three Digits Two Operators   8		plus		9		multiply		6

    log     "STEP 2: View Result from Display"
    View Result

    log     "STEP 3: Compare ACTUAL result with EXPECTED result"
    verify result  ${expected_test_case_9}

	log		"CLEAR DISPLAY"
	Clear Display