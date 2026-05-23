*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_CHECK_BOX}        https://www.lambdatest.com/selenium-playground/checkbox-demo
${PRIMEIRO_CHECKBOX}    xpath=//input[@type='checkbox']
${MENSAGEM_CHECKBOX}    xpath=//div[@id='__next']/div/main/div/section/div/div/div/p


${URL_PESQUISA}           https://www.testmuai.com/selenium-playground/bootstrap-dual-list-box-demo/
${CAIXA_DE_TEXTO_DE_PESQUISA}    name=SearchDualList
${Kedungjenar}    xpath=//div[@id='__next']/div/main/section[2]/div/div/div/div/div/div/div/ul/li
${Mynamaki}    xpath=//div[@id='__next']/div/main/section[2]/div/div/div/div/div/div/div/ul/li[3]
${Danville}    xpath=//div[@id='__next']/div/main/section[2]/div/div/div/div/div/div/div/ul/li[2]
*** Test Cases ***
Teste se Kedungjenar some ao pesquisar Danville
    Open Browser    ${URL_PESQUISA}    chrome
    Sleep    2s
    Input Text    ${CAIXA_DE_TEXTO_DE_PESQUISA}    Danville
    Wait Until Element Is Not Visible    ${Kedungjenar}    3s
    Sleep    2s
    Close Browser

Teste se Mynamaki some ao pesquisar Danville
    Open Browser    ${URL_PESQUISA}    chrome
    Sleep    2s
    Input Text    ${CAIXA_DE_TEXTO_DE_PESQUISA}    Danville
    Wait Until Element Is Not Visible    ${Mynamaki}       3s
    Sleep    2s
    Close Browser

Teste se Danville continua visivel ao pesquisar Danville
    Open Browser    ${URL_PESQUISA}    chrome
    Sleep    2s
    Input Text    ${CAIXA_DE_TEXTO_DE_PESQUISA}    Danville
    Wait Until Element Is Visible    ${Danville}   3s
    Sleep    2s
    Close Browser    

Teste de apresentação da mensagem "Checked" ao clicar no primeiro checkbox
    Open Browser    ${URL_CHECK_BOX}    chrome
    Sleep    2s
    Click Element                ${PRIMEIRO_CHECKBOX}
    Checkbox Should Be Selected    ${PRIMEIRO_CHECKBOX}
    Element Text Should Be       ${MENSAGEM_CHECKBOX}    Checked!
    Sleep    2s
    Close Browser

Teste de acesso ao google.com
    Skip	
    Open Browser    https://www.google.com/   chrome
    Sleep           2s
    Title Should Contain   Google
    Close Browser    

*** Keywords ***
Title Should Contain
    [Arguments]    ${substr}
    ${title}=    Get Title
    Should Contain    ${title}    ${substr}