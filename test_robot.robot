*** Settings ***
Library           RequestsLibrary

*** Test Cases ***

GET /plus/10/20
    ${response}    GET    http://192.168.50.61:5000/plus/10/20
    Should Contain    ${response.content.decode('utf-8')}    10 + 20 = 30

GET /plus/0/20.5
    ${response}    GET    http://192.168.50.61:5000/plus/0/20
    Should Contain    ${response.content.decode('utf-8')}    0 + 20 = 20

GET /plus/-10/0
    ${response}    GET    http://192.168.50.61:5000/plus/-10/0
    Should Contain    ${response.content.decode('utf-8')}    -10 + 0 = -10

*** Keywords ***

Get On Session
    [Arguments]    ${url}
    ${response}    GET    ${url}
    RETURN    ${response}