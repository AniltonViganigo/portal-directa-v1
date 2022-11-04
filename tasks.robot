*** Settings ***
Documentation       Template robot main suite.

Resource            main.resource

Suite Setup         Setup
Suite Teardown      Finaliza Processo

*** Tasks ***
Minimal task
    Log    Done.
    Log to Console    ${TODAY}

Move Files To Directory
    Move File Portal Directa 

Login Portal Directa
    Login Portal Directa

Acessa Operacoes e Baixa Notas Natalenses 
    Acessa Notas Natalense Download NFS-e
    Download NFS-e 

Acessa e Baixa Consultas NFS
    Acessa Notas Natalense Consultas NFS-e
    Download Consulta NFS-e Files - First Step
    Open Portal Directa
    Login Portal Directa
    Acessa Notas Natalense Consultas NFS-e
    Download Consulta NFS-e Files - Second Step
    Move File Portal Directa 