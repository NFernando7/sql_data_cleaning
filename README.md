# 🗃️ SQL Data Cleaning - Corrigindo Datas do Excel

### 📌 Sobre o Projeto  
Este projeto demonstra como corrigir datas importadas de arquivos CSV que aparecem como números (serial date do Excel).  

### ⚡ Tecnologias Usadas  
- MySQL  
- SQL (UPDATE, DATE_ADD, ALTER TABLE)  

### 🚀 Problema  
Ao importar um CSV para o banco de dados, as datas estavam em formato numérico, como `42736`, em vez do formato correto `YYYY-MM-DD`. Isso ocorre porque o Excel armazena datas como o número de dias desde **1º de janeiro de 1900**.  

### 🔧 Solução  
1️⃣ Criei uma nova coluna para armazenar a data corrigida.  
2️⃣ Converti os valores numéricos para datas legíveis no MySQL.  

### 📜 Código SQL  
-- Primeiro importei o arquivo CSV utilizando o Table Data Import Wizard

-- Criei a nova coluna no formato DATE

ALTER TABLE produtos ADD COLUMN data_convertida DATE;

-- Converti as datas Obs. Tive que colocar crases `` no título da coluna porque o nome Data é uma palavra reservada no Mysql

UPDATE produtos
SET data_convertida = DATE_ADD('1899-12-30', INTERVAL CAST(`data` AS UNSIGNED) DAY);

-- Apaguei a coluna com os valores antigos e verifiquei os dados convertidos

ALTER TABLE produtos DROP COLUMN `data`;
SELECT * FROM produtos;
