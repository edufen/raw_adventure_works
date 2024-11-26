
# Relatório Consolidado e Estratégico  

**Empresa**: AdventureWorks  

## Tópicos  
1. [Introdução ao Projeto](#1-introdução-ao-projeto)  
2. [Diagnóstico Inicial e Planejamento](#2-diagnóstico-inicial-e-planejamento)  
3. [Design do Data Warehouse](#3-design-do-data-warehouse)  
4. [Documentação e Testes de Qualidade dos Dados](#4-documentação-e-testes-de-qualidade-dos-dados)  
5. [Conclusão e Próximos Passos](#5-conclusão-e-próximos-passos)  
6. [Dashboard no Power BI: Estrutura e Funcionalidades](#6-dashboard-no-power-bi-estrutura-e-funcionalidades)  
7. [Desempenho de Vendas: Análise Consolidada (2011-2014)](#7-desempenho-de-vendas-análise-consolidada-2011-2014)  

---

## 1. Introdução ao Projeto  

### Objetivo do Projeto  
Transformar a AdventureWorks em uma empresa data-driven, através da criação de uma infraestrutura moderna de dados. O projeto inclui a construção de um Data Warehouse para responder a perguntas estratégicas, gerar insights valiosos e apoiar decisões com alta confiabilidade.  

### Importância das Perguntas de Negócio  
As perguntas de negócio são fundamentais para:  
- Identificar tendências de consumo.  
- Avaliar a eficácia das campanhas promocionais.  
- Direcionar estratégias de marketing e logística.  

---

## 2. Diagnóstico Inicial e Planejamento  

### Visão das Partes Interessadas  
- **João Muller (Diretor de Inovação)**: Lidera o projeto com foco no longo prazo.  
- **Carlos Silveira (CEO)**: Prioriza o retorno sobre o investimento e a confiabilidade dos dados.  
- **Silvana Teixeira (Diretora Comercial)**: Questiona a relação custo-benefício, preferindo ações com impacto imediato.  
- **Nilson Ramos (Diretor de TI)**: Responsável por garantir acesso aos dados.  
- **Gabriel Santos (Analista de TI)**: Auxilia na administração e integração dos dados.  

### Riscos e Desafios Identificados  
- **Resistência ao projeto**: Históricos de promessas não cumpridas em soluções anteriores como CRM e Web Analytics.  
- **Coordenação entre equipes**: Necessidade de processos ágeis e comunicação clara entre a equipe técnica e áreas de negócios.  

---

## 3. Design do Data Warehouse  

### Modelagem de Dados  
O Data Warehouse foi projetado com as seguintes tabelas:  
- **Dimensão Address**: Dados de endereços para análises regionais.  
- **Dimensão Customer**: Informações sobre clientes, facilitando a segmentação.  
- **Dimensão SalesReason**: Registra os motivos das vendas (ex.: promoções).  
- **Dimensão Products**: Dados sobre produtos (nome, categoria, preço).  
- **Dimensão CreditCard**: Informações sobre cartões de crédito.  
- **Tabela Fato**: Integra métricas como faturamento bruto, descontos, status de compras e datas.  

### Fonte de Dados e Transformações  
Os dados foram extraídos do **Snowflake** e transformados com **dbt**, em três camadas:  
1. **Staging**: Extração inicial com renomeações e correções básicas.  
2. **Intermediate**: Junção de dados para formar dimensões e tabelas fato.  
3. **Marts**: Dados finais organizados para análises estratégicas.  

---

## 4. Documentação e Testes de Qualidade dos Dados  

### Documentação  
Cada arquivo SQL foi acompanhado de um arquivo YML com:  
- Descrição das tabelas e colunas.  
- Informações detalhadas para análises operacionais e estratégicas.  

### Testes de Qualidade  
- **Sources**: Validação da consistência dos dados extraídos.  
- **Primary Keys**: Verificação de unicidade e preenchimento.  
- **Teste Específico**: Validação das vendas brutas de 2011, conforme solicitado pelo CEO.  

Resultados: **100% de sucesso nos testes** com o **dbt**.  

---

## 5. Conclusão e Próximos Passos  

A implementação do Data Warehouse oferece uma base sólida para análises estratégicas. **A empresa está pronta para**:  
- Replicar o sucesso de 2013, otimizando campanhas vencedoras.  
- Expandir operações regionais com estratégias baseadas em dados.  
- Consolidar a governança de dados e a competitividade no mercado.  

Com investimentos contínuos em **BI**, a AdventureWorks poderá transformar dados em vantagem competitiva.  

---

## 6. Dashboard no Power BI: Estrutura e Funcionalidades  

### 6.1 Página de Visão Geral  
- Faturamento por Produto  
- Total de Produtos Vendidos  
- Total de Pedidos e Clientes  
- Clientes com Maior Faturamento  
- Faturamento por País  
- Tendência de Pedidos e Clientes por Período  

### 6.2 Página de Análise de Produtos  
- Ticket Médio por Produto  
- Produtos Mais Vendidos por Unidade  
- Produtos com Maior Ticket Médio  

### 6.3 Página de Análise de Região  
- Cidades com Maior Valor Negociado  
- Estados com Maior Valor Negociado  
- Distribuição de Clientes por País  

**Interatividade**: Navegação intuitiva com filtros dinâmicos.  

---

## 7. Desempenho de Vendas: Análise Consolidada (2011-2014)  

### Resultados Gerais  
- **Pedidos realizados**: 31,47 mil  
- **Produtos vendidos**: 274,91 mil  
- **Faturamento bruto**: $110,37 milhões  

### Desempenho Anual  
- **2011**: $12,65 milhões (1.607 pedidos)  
- **2012**: $33,73 milhões (3.915 pedidos)  
- **2013**: $43,93 milhões (14,18 mil pedidos)  
- **2014**: $20 milhões (11,76 mil pedidos)  

### Principais Insights  
- **Produtos com maior ticket médio**: Road 150 Red, Mountain-100 Silver.  
- **Top 5 cidades**: Toronto (Canadá), London (Reino Unido), Paris (França), Seattle (EUA), Burnaby (Canadá).  

### Recomendações  
- Investigar o sucesso de 2013 e replicar estratégias vencedoras.  
- Focar em promoções para produtos de maior ticket médio.  


