*** Settings ***
#Testi
Documentation     A simple web scraper robot.
Library        RPA.Browser.Selenium
Library        RPA.FileSystem
Library        RPA.PDF
Library        RPA.Desktop
Library        OperatingSystem
Library        RPA.Tables


*** Variables ***
${URL}=    https://verkkokauppa.com/fi/product/638239/    
${OUTPUT_DIR}=    /Users/aleksipullinen/vertailurobo
${xpath_hinta}=    /html/body/div[1]/div/div/div/main/section/aside/div[2]/div[1]/div[2]/div[1]/span[1]/data
${verkkokauppa}=    verkkokauppa



*** Tasks ***
Store Web Page Content
    Open Available Browser    ${URL}    headless=True
    ${hinta}    Get Text        xpath=${xpath_hinta}
    Run Keyword    write_variable    ${hinta}


*** Keywords ***
write_variable
    [Arguments]    ${variable}
    ${pohja}=    Read table from CSV    /Users/aleksipullinen/vertailurobo/pohja.csv    header=True
    
    Set Table Cell    ${pohja}    0    0    ${verkkokauppa}
    Set Table Cell    ${pohja}    0    1    ${variable}

    Write table to CSV        ${pohja}    path=/Users/aleksipullinen/vertailurobo/tiedot.csv    header=False    delimiter=; 


    

    