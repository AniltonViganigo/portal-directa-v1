*** Settings ***
Documentation       Template keyword resource.

Resource            main.resource

*** Variables ***
${URL_PORTAL_DIRECTA}    %{URL}
${USER_PORTAL_DIRECTA}    %{USER}
${PASSWORD_PORTAL_DIRECTA}    %{PASSWORD}


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
    Click Element When Visible    //li[@id='limenu9']
    Sleep    0.5       
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

Download Consulta NFS-e Files 
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
    #Falta Desenvolver a rotina para salvar o PDF gerado.
    Execute Javascript    document.querySelector('#lay > div:nth-child(3) > div:nth-child(3) > div:nth-child(7) > div > table > tbody > tr > td').click()
    Sleep    0.5
    Click Element When Visible    //*[@id="HTMLGroupBox628126"]/table/tbody/tr[3]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5
    Click Element When Visible    //*[@id="HTMLGroupBox628123"]/table/tbody/tr[1]/td/table/tbody/tr/td[1]/a/img
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[2]/div[21]/div/table/tbody/tr/td
    Sleep    0.5
    Click Element When Visible    //*[@id="lay"]/div[2]/div[3]/div[5]/div/table/tbody/tr/td
    Sleep    0.5
    #Falta Desenvolver a rotina para salvar o PDF gerado.
    Unselect Frame
    Select Frame    //frame[@name='mainsystem']
    Sleep    0.5
    Select Frame    //frame[@name='mainsystem']
    Execute Javascript    document.getElementsByTagName('a')[158].click()

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
    Screenshot    filename=screenshot01.png
