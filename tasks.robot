*** Settings ***
#Testi
Documentation     A simple web scraper robot.
Library        RPA.Browser.Selenium
Library        RPA.FileSystem
Library        RPA.PDF
Library        RPA.Desktop
Library        OperatingSystem


*** Variables ***
${URL}=    https://verkkokauppa.com/fi/product/638239/
${OUTPUT_DIR}=    /Users/aleksipullinen/vertailurobo
${xpath_hinta}=    /html/body/div[1]/div/div/div/main/section/aside/div[2]/div[1]/div[2]/div[1]/span[1]/data


*** Tasks ***
Store Web Page Content
    Open Available Browser    ${URL}
    ${hinta}    Get Text        xpath=${xpath_hinta}
    Run Keyword    write_variable    ${hinta}


*** Keywords ***
write_variable
    [Arguments]    ${variable}
    Append To File    path=/Users/aleksipullinen/vertailuRobo/tiedot.txt    content=${variable}




    

    