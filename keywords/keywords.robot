*** Settings ***
Documentation       Template keyword resource.

Resource            main.resource
Library    RPA.PDF
Library    ../libraries/SavePDFFile.py
Library    RPA.HTTP
Library    RPA.Windows
Library    RPA.Browser.Selenium
Library    RPA.RobotLogListener
Library    String

*** Variables ***
${URL_PORTAL_DIRECTA}    %{URL}
${USER_PORTAL_DIRECTA}    %{USER}
${PASSWORD_PORTAL_DIRECTA}    %{PASSWORD}
${File_Directory}=    ${OUTPUT_DIR}/Arquivos_Portal_Directa
${count}=    0


*** Keywords ***
Open Portal Directa
    Open Available Browser    ${URL_PORTAL_DIRECTA}    maximized=True    alias=FirstBrowser

Login Portal Directa
    Select Frame    //frame[@name='mainsystem']
    Sleep    1
    Input Text When Element Is Visible    //input[@id='usuario']    ${USER_PORTAL_DIRECTA}
    Input Text    //input[@id='senha']    ${PASSWORD_PORTAL_DIRECTA}
    Click Button When Visible    //button[@id='acessar']

Acessa Notas Natalense Download NFS-e
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Click Element When Visible    //li[@id='limenu9']
    Sleep    0.5
    Click Element When Visible    //a[@value='formsmenu14']
    Sleep    0.5
    Click Element When Visible    //li[@onclick="itemSelecionado(this,578,489,'Nota Natalense - Operações - Download de NFS-e',112)"]

Download NFS-e
    Sleep    0.5
    Select Frame    //*[@id="iframe0"]
    Select Frame    //frame[@name='mainform']
    Execute Javascript    
    ...    document.querySelector('#lay > div:nth-child(3) > div.tabArea > div:nth-child(10) > div:nth-child(2) > div > div > table > tbody > tr > td').click()
    Sleep    0.5  
    Click Element When Visible    //*[@id="lookupInput"]/option[2]
    Input Text    //input[@name='WFRInput668292']    01/07/2022
    Input Text    //input[@name='WFRInput668291']    31/07/2022
    Click Element When Visible    //*[@id="HTMLGroupBox668289"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5  
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[22]/div/table/tbody/tr/td
    Sleep    10  
    Click Element When Visible    //*[@id="HTMLGroupBox668289"]/table/tbody/tr[3]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[23]/div/table/tbody/tr/td  
    Sleep    10
    Unselect Frame
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Select Frame    //frame[@name='mainsystem']
    Execute Javascript    document.getElementsByTagName('a')[158].click()
    Sleep    1

Acessa Notas Natalense Consultas NFS-e
    Unselect Frame
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Select Frame    //frame[@name='mainsystem']
    ${Element_ConsultaNFS}=    Is Element Visible    //a[@value='formsmenu12']

    IF    ${Element_ConsultaNFS} 
        Click Element When Visible    //a[@value='formsmenu12']    
        Click Element When Visible    //li[@onclick="itemSelecionado(this,800,541,'Nota Natalense - Consultas - Consulta NFS-e',50)"] 
    ELSE
        Click Element When Visible    //li[@id='limenu9']
        Sleep    0.5        
        Click Element When Visible    //a[@value='formsmenu12'] 
        Click Element When Visible    //li[@onclick="itemSelecionado(this,800,541,'Nota Natalense - Consultas - Consulta NFS-e',50)"] 
    END

Download Consulta NFS-e Files - First Step
    Create Directory    ${File_Directory}
    Sleep    0.5
    Select Frame    //*[@id="iframe1"]
    Select Frame    //frame[@name='mainform']
    Execute Javascript   document.querySelector('#lay > div:nth-child(3) > div:nth-child(2) > div:nth-child(7) > div:nth-child(2) > div > div > table > tbody > tr > td').click()
    Sleep    0.5  
    Click Element When Visible    //*[@id="lookupInput"]/option[6]
    Sleep    0.5  
    Click Element When Visible    //*[@id="HTMLGroupBox628126"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5 
    Execute Javascript    document.querySelector('#lay > div:nth-child(3) > div:nth-child(2) > div:nth-child(14) > div:nth-child(2) > div > div > table > tbody > tr > td').click() 
    Sleep    0.5  
    Click Element When Visible    //*[@id="lookupInput"]/option[1]
    Sleep    0.5  
    Input Text    //input[@name="WFRInput628128"]    01/07/2022
    Sleep    0.5  
    Input Text    //input[@name="WFRInput628127"]    31/07/2022
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[21]/div/table/tbody/tr/td  
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[3]/div[5]/div/table/tbody/tr/td
    
    #Início da Rotina para Salvar o Primeiro PDF Gerado.
    ${handles}=    Get Window Handles    
    
    WHILE    ${count} < 2
        ${count}    Get Length    ${handles}
        ${handles}=    Get Window Handles    
    END  
    
    Switch Window    ${handles}[1]    browser=CURRENT
    ${url} =  Execute Javascript  return window.location.href
    Download    ${url}    ${File_Directory}/Relatorio1.pdf
    Close Browser
    

Download Consulta NFS-e Files - Second Step
    Unselect Frame
    Sleep    0.5
    Select Frame    //*[@name="mainsystem"]
    Sleep    0.5
    Select Frame    //*[@name="mainsystem"]
    Sleep    0.5
    Select Frame    //*[@id="iframe0"]
    Select Frame    //frame[@name='mainform']
    Sleep    0.5 
    Execute Javascript   document.querySelector('#lay > div:nth-child(3) > div:nth-child(2) > div:nth-child(7) > div:nth-child(2) > div > div > table > tbody > tr > td').click()
    Sleep    0.5  
    Click Element When Visible    //*[@id="lookupInput"]/option[6]
    Sleep    0.5  
    Click Element When Visible    //*[@id="HTMLGroupBox628126"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5 
    Execute Javascript    document.querySelector('#lay > div:nth-child(3) > div:nth-child(2) > div:nth-child(14) > div:nth-child(2) > div > div > table > tbody > tr > td').click() 
    Sleep    0.5  
    Click Element When Visible    //*[@id="lookupInput"]/option[1]
    Sleep    0.5  
    Input Text    //input[@name="WFRInput628128"]    01/07/2022
    Sleep    0.5  
    Input Text    //input[@name="WFRInput628127"]    31/07/2022
    Sleep    0.5    
    Click Element When Visible    //*[@id="HTMLGroupBox628126"]/table/tbody/tr[3]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5
    Click Element When Visible    //*[@id="HTMLGroupBox628123"]/table/tbody/tr[1]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[21]/div/table/tbody/tr/td
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[3]/div[5]/div/table/tbody/tr/td
    Sleep    0.5    
    #Início da Rotina para Salvar o Segundo PDF Gerado.
    ${count}    Set Variable    0    
    ${handles}=    Get Window Handles    
    
    WHILE    ${count} < 2
        ${count}    Get Length    ${handles}
        ${handles}=    Get Window Handles    
    END  
    
    Switch Window    ${handles}[1]    browser=CURRENT
    ${url} =  Execute Javascript  return window.location.href
    Download    ${url}    ${File_Directory}/Relatorio2.pdf
    #Fim da Rotina para Salvar o Segundo PDF Gerado.

Example keyword
    Log    Today is ${TODAY}

Open Browser To Website
    [Documentation]    Abre Pagina e retorna se carregou com succeso ou não
    [Arguments]    ${URL}
    Open Available Browser    ${URL}
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Element    ${LOGIN.user}
    RETURN    ${status}

Faz Login no Site
    [Documentation]    Realiza Login no Suite
    Input Text    ${LOGIN.user}    %{USER}
    #Input Text    ${LOGIN.pwd}    %{PWD}
    Click Button    ${LOGIN.login}
    Wait Until Page Contains Element    ${FORM.first_name}
#Screenshot    filename=screenshot01.png

Move File Portal Directa
    ${Regex_Pattern}=    Set Variable    (.zip)|(NFSe)
    ${Download_Directory_PATH}=    Set Variable    #Path Do Diretótio Download da Máquina 
    ${List_Files}=    List Files In Directory    ${Download_Directory_PATH}
    FOR    ${file}    IN    @{List_Files}
        ${return_response}=    Get Regexp Matches    ${file}    ${Regex_Pattern}
        ${matches}=    Get Length    ${return_response}
        IF    ${matches} == 2
            Move File    ${Download_Directory_PATH}/${file}    ${File_Directory}
        END
        Log    ${file}        
    END
    