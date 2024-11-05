# Desafio de Engenharia de Analytics - Indicium 2024

## Introdução

Este projeto foi desenvolvido como parte do desafio de Engenharia de Analytics da **Indicium**. O objetivo principal foi construir uma infraestrutura moderna de analytics para a **Adventure Works**, uma empresa do setor de bicicletas, utilizando o **Modern Analytics Stack**. A solução abrangeu a modelagem de dados, implementação de ELT (Extract, Load, Transform), e criação de um dashboard de BI interativo para análises de vendas e clientes.

A solução envolveu o uso das ferramentas **Snowflake** para o Data Warehouse e **dbt** para a transformação de dados. O projeto também incluiu a criação de dashboards interativos para responder a perguntas de negócios específicas.

## Funcionalidades Implementadas

### **Modelagem de Dados - Data Warehouse**
- **Modelo Conceitual**: Criado um diagrama conceitual utilizando [draw.io](https://app.diagrams.net/), representando as tabelas de fatos e dimensões necessárias para responder às perguntas de negócios.
- **Dimensões Criadas**: Cliente, Produto, Motivo de Venda, Endereço, Cartão de Crédito, Data de Venda.
- **Tabela Fato**: A tabela de fatos foi construída para registrar as vendas, incluindo métricas como número de pedidos, quantidade comprada e valor total negociado.

### **Configuração do Data Warehouse e dbt**
- **Data Warehouse**: Configuração de um **Data Warehouse** na **nuvem** (usando o **Snowflake**).
- **dbt**: Configuração do dbt para realizar a transformação de dados e criar as tabelas dimensionais e a tabela de fatos.

### **Transformação de Dados**
  - **Processo ELT**: O processo de ingestão e transformação foi implementado utilizando dbt, com foco nas boas práticas de testes e documentação seguindo os padrões do curso.
  - **Testes de Sources**: Verificação de integridade nos dados brutos.
  - **Testes de Chaves Primárias**: Validação das chaves primárias nas tabelas de dimensões e fatos.
  - **Testes de Dados**: Realização de testes para garantir a veracidade dos dados.
  - **Documentação**: Todas as tabelas e colunas foram documentadas de forma detalhada.

### **Dashboard de BI**
As perguntas de negócios foram totalmente atendidas no dashboard, permitindo uma análise detalhada das vendas e clientes da Adventure Works. Foram respondidas questões como o número de pedidos, quantidade comprada e valor total negociado por diversos atributos, incluindo produto, tipo de cartão, motivo de venda, e localizações geográficas (cidade, estado e país). Além disso, o dashboard fornece insights sobre os produtos com maior ticket médio por diferentes períodos e regiões, identifica os 10 melhores clientes por valor total negociado, as 5 melhores cidades em termos de vendas, e analisa o número de pedidos e valores negociados ao longo do tempo. Também foi possível identificar o produto com maior quantidade de unidades compradas para o motivo de venda "Promotion".
  
- **Ferramenta Usada**: Foi criado um dashboard interativo no Power BI.
 
## Acessar o Dashboard
   - O dashboard pode ser acessado [aqui](url).
     
## Tecnologias Utilizadas

- **Data Warehouse**: Snowflake
- **Ferramenta de Transformação**: dbt
- **Dashboard de BI**: Power BI
- **Versionamento de Código**: GitHub

## Considerações Finais

Este projeto demonstrou a aplicação de boas práticas no processo de construção de uma infraestrutura de dados moderna, utilizando ferramentas do **Modern Data Stack**. A solução proposta para a **Adventure Works** permitirá à empresa tomar decisões baseadas em dados, com dashboards interativos e transformações de dados robustas que garantem a qualidade e veracidade das informações.

## Autor

Desenvolvido por [Eduardo Batista de Lima](https://www.linkedin.com/in/eduardobdlima/) - Data Analyst Intern @ Indicium  
[Formação de Engenharia de Analytics](https://academy.indicium.tech/course/formacao-engenharia-de-analytics) - TURMA 24_9  
[Indicium Tech](https://www.indicium.tech/)  
Novembro de 2024
