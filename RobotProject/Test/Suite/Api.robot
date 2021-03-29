*** Settings ***
Library    RequestsLibrary    
Library   Collections    
*** Variables ***
${user}    
${base_url}    http://localhost:3000/
${responsecode}
*** Test Cases ***
# Venkatraman P

Testcase1
    Create Session    mysession    ${base_url}
    
   ${response}=   Get Request    mysession    /
   Log To Console    ${response.headers}
   ${respons_code}=   Convert To String   ${response.status_code}  
   Should Be Equal     ${respons_code}    200     
   ${body}=     Convert To String  ${response.content}
   Should Contain    ${body}    json-server    
   ${contentTypeValue}=    Get From Dictionary     ${response.headers}    Content-Type
   Should Be Equal    ${contentTypeValue}    text/html; charset=UTF-8
   Dictionary Should Contain Key    ${response.headers}    Content-Type  
                
   #Log To Console   ${response.status_code} 
   #Log To Console    ${response.content}
   #Log To Console    ${response.headers}
   
     
