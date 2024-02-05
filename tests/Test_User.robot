*** Settings ***
Resource            ../resource/User_Resources.robot
Resource            ../resource/Session_Resources.robot

Suite Setup         Criar Sessão    https://serverest.dev
Suite Teardown      Encerrar Sessão


*** Variables ***
# robot -d results -L trace tests
&{USER_CRUD}        nome=Guilherme    email=qa@qa.com.br    password=teste    administrador=true
&{USER_CRUD_2}      nome=Guilhermezin    email=qa@qa.com.br    password=teste    administrador=true


*** Test Cases ***
Teste - CRUD
    # CREATE
    ${USER_ID}    Criação de usuário    ${USER_CRUD}

    # READ
    Buscar usuário    USER_ID=${USER_ID}    expected_status=200    USER=${USER_CRUD}

    # UPDATE
    Atualizar usuário    USER_ID=${USER_ID}    USER=${USER_CRUD_2}
    Buscar usuário    USER_ID=${USER_ID}    expected_status=200    USER=${USER_CRUD_2}    # Mostra que houve alteração

    # DELETE
    Deletar usuário    USER_ID=${USER_ID}    USER=${USER_CRUD_2}
