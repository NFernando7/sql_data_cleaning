 -- Primeiro importei o arquivo CSV utilizando o Table Data Import Wizard

-- Criei a nova coluna no formato DATE

ALTER TABLE produtos ADD COLUMN data_convertida DATE;

-- Converti as datas Obs. Tive que colocar crases `` no título da coluna porque o nome Data é uma palavra reservada no Mysql

UPDATE produtos
SET data_convertida = DATE_ADD('1899-12-30', INTERVAL CAST(`data` AS UNSIGNED) DAY);

-- Apaguei a coluna com os valores antigos e verifiquei os dados convertidos

ALTER TABLE produtos DROP COLUMN `data`;
SELECT * FROM produtos;
