*** Settings ***
Resource    main.resource


*** Keywords ***
Setup
    [Documentation]    Função que será iniciada no inicio do robô
    Log    Iniciando robô

    ${status}    Open Portal Directa    
    IF    ${status}
        Log    Site Abriu com sucesso
    ELSE
        Log    Finalizando robô
    END

Finaliza Processo
    [Documentation]    Função que é executada no fim do robô
    Close All Browsers
