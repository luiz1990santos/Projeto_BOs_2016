


---------------------------------------------------------------------------
-- QUERY RELATORIO DE B.O. NO ESTADO DE SAO PAULO                         |
---------------------------------------------------------------------------


-- Configurando as permissoes de importacao de CSV

/*

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

*/

/*

EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

*/

-- DESCOBRIR O USUARIO
-- SELECT SYSTEM_USER AS Usuario_SQL, SUSER_NAME() AS Usuario_Servidor;

-- DESCOBRIR O NIVEL DE PERMISSAO NO SISTEMA
--SELECT USER_NAME() AS UsuarioSQL, IS_SRVROLEMEMBER('sysadmin') AS EhSysAdmin;

-- LISTAR OS USUARIOS DE SISTEMA
--SELECT name FROM sys.server_principals WHERE type IN ('S', 'U', 'G');


-- CONCEDENDO AS PERMISSOES
--GRANT SELECT ON SYS.SYSDATABASES TO [LUIZSANTOS\luiz_];

-- CRIANDO O BANCO DE DADOS
-- CREATE DATABASE BOs_SaoPaulo2016;

-- ENTRANDO NO BANCO 
-- USE BOs_SaoPaulo2016;


-- CREATE DATABASE BOs_SaoPaulo_2016


-- USE BOs_SaoPaulo_2016


ALTER VIEW Tb_Relatorio_BO_SaoPaulo AS
 
 With base_BOs as (
 
 SELECT 
    
    NUM_BO	
    ,ANO_BO	
    ,ID_DELEGACIA	
    ,NOME_DEPARTAMENTO	
    ,NOME_SECCIONAL	
    ,DELEGACIA	
    ,NOME_DEPARTAMENTO_CIRC	
    ,NOME_SECCIONAL_CIRC	
    ,NOME_DELEGACIA_CIRC	
    ,ANO	
    ,MES
    ,CASE 
        WHEN MES = 1 THEN 01
        WHEN MES = 2 THEN 02	
        WHEN MES = '' THEN 03
        WHEN MES = 4 THEN 04
        WHEN MES = 5 THEN 05
        WHEN MES = 6 THEN 06
        WHEN MES = 7 THEN 07
        WHEN MES = 8 THEN 08
        WHEN MES = 9 THEN 09
        WHEN MES = 10 THEN 10
        WHEN MES = 11 THEN 11
        WHEN MES = 12 THEN 12
    END AS FLAG_MES_01
    ,CASE 
        WHEN MES = 1 THEN '01 - Janeiro'	
        WHEN MES = 2 THEN '02 - Fevereiro'	
        WHEN MES = '' THEN '03 - Março'
        WHEN MES = 4 THEN '04 - Abril'
        WHEN MES = 5 THEN '05 - Maio'
        WHEN MES = 6 THEN '06 - Junho'
        WHEN MES = 7 THEN '07 - Julho'
        WHEN MES = 8 THEN '08 - Agosto'
        WHEN MES = 9 THEN '09 - Setembro'
        WHEN MES = 10 THEN '10 - Outubro'
        WHEN MES = 11 THEN '11 - Novembro'
        WHEN MES = 12 THEN '12 - Dezembro'
    END AS FLAG_MES
    ,COD_MOTIVO	
    ,CASE 
        WHEN COD_MOTIVO = 1 THEN 'Drogas sem autorizacao ou em desacordo'
        WHEN COD_MOTIVO = 2 THEN 'Estupro'
        WHEN COD_MOTIVO = 3 THEN 'Estupro de vulneravel'
        WHEN COD_MOTIVO = 4 THEN 'Furto'
        WHEN COD_MOTIVO = 5 THEN 'Furto de coisa comum'
        WHEN COD_MOTIVO = 6 THEN 'Furto qualificado'
        WHEN COD_MOTIVO = 7 THEN 'Homicidio culposo'
        WHEN COD_MOTIVO = 8 THEN 'Homicidio culposo na direcao de veiculo automotor'
        WHEN COD_MOTIVO = 9 THEN 'Homicidio qualificado'
        WHEN COD_MOTIVO = 10 THEN 'Homicidio simples'
        WHEN COD_MOTIVO = 11 THEN 'Induzir instigar ou auxiliar alguem ao uso indevido de droga'
        WHEN COD_MOTIVO = 12 THEN 'Lesao corporal'
        WHEN COD_MOTIVO = 13 THEN 'Lesao corporal  de natureza GRAViSSIMA'
        WHEN COD_MOTIVO = 14 THEN 'Lesao corporal culposa'
        WHEN COD_MOTIVO = 15 THEN 'Lesao corporal culposa na direcao de veiculo automotor'
        WHEN COD_MOTIVO = 16 THEN 'Lesao corporal de natureza GRAVE'
        WHEN COD_MOTIVO = 17 THEN 'Lesao corporal seguida de morte'
        WHEN COD_MOTIVO = 18 THEN 'Oferecer droga a pessoa de seu relacionamento'
        WHEN COD_MOTIVO = 19 THEN 'Porte de entorpecente'
        WHEN COD_MOTIVO = 20 THEN 'Roubo'
        WHEN COD_MOTIVO = 21 THEN 'Trafico de entorpecente'
    END FLAG_SUBMOTIVO
    ,CONDUTA	LATITUDE	
    ,LONGITUDE	
    ,CIDADE	
    ,ENDERECO	
    ,LOGRADOURO	
    ,FLAG_STATUS
    ,CASE 
            WHEN cidade IN ('S.PAULO', 'SAO PAULO') THEN 'Brasil - SP - São Paulo'
            WHEN cidade IN ('S.ANDRE', 'SANTO ANDRE') THEN 'Brasil - SP - Santo André'
            WHEN cidade IN ('S.BERNARDO DO CAMPO', 'SÃO BERNARDO DO CAMPO') THEN 'Brasil - SP - São Bernardo do Campo'
            WHEN cidade = 'GUARULHOS' THEN 'Brasil - SP - Guarulhos'
            WHEN cidade = 'OSASCO' THEN 'Brasil - SP - Osasco'
            WHEN cidade = 'DIADEMA' THEN 'Brasil - SP - Diadema'
            WHEN cidade = 'MAUA' THEN 'Brasil - SP - Mauá'
            WHEN cidade = 'CARAPICUIBA' THEN 'Brasil - SP - Carapicuíba'
            WHEN cidade = 'ITAQUAQUECETUBA' THEN 'Brasil - SP - Itaquaquecetuba'
            WHEN cidade = 'MOGI DAS CRUZES' THEN 'Brasil - SP - Mogi das Cruzes'
            WHEN cidade = 'SUZANO' THEN 'Brasil - SP - Suzano'
            WHEN cidade = 'TABOAO DA SERRA' THEN 'Brasil - SP - Taboão da Serra'
            WHEN cidade = 'BARUERI' THEN 'Brasil - SP - Barueri'
            WHEN cidade = 'COTIA' THEN 'Brasil - SP - Cotia'
            WHEN cidade = 'FERRAZ DE VASCONCELOS' THEN 'Brasil - SP - Ferraz de Vasconcelos'
            WHEN cidade = 'ITAPEVI' THEN 'Brasil - SP - Itapevi'
            WHEN cidade = 'EMBU' THEN 'Brasil - SP - Embu'
            WHEN cidade = 'S.CAETANO DO SUL' THEN 'Brasil - SP - São Caetano do Sul'
            WHEN cidade = 'ITAPECERICA DA SERRA' THEN 'Brasil - SP - Itapecerica da Serra'
            WHEN cidade = 'POA' THEN 'Brasil - SP - Poá'
            WHEN cidade = 'FRANCO DA ROCHA' THEN 'Brasil - SP - Franco da Rocha'
            WHEN cidade = 'FRANCISCO MORATO' THEN 'Brasil - SP - Francisco Morato'
            WHEN cidade = 'RIBEIRAO PIRES' THEN 'Brasil - SP - Ribeirão Pires'
            WHEN cidade = 'JANDIRA' THEN 'Brasil - SP - Jandira'
            WHEN cidade = 'MAIRIPORA' THEN 'Brasil - SP - Mairiporã'
            WHEN cidade = 'ARUJA' THEN 'Brasil - SP - Arujá'
            WHEN cidade = 'CAIEIRAS' THEN 'Brasil - SP - Caieiras'
            WHEN cidade = 'CAJAMAR' THEN 'Brasil - SP - Cajamar'
            WHEN cidade = 'SANTANA DE PARNAIBA' THEN 'Brasil - SP - Santana de Parnaíba'
            WHEN cidade = 'EMBU DAS ARTES' THEN 'Brasil - SP - Embu das Artes'
            WHEN cidade = 'EMBU-GUACU' THEN 'Brasil - SP - Embu-Guaçu'
            WHEN cidade = 'S.ISABEL' THEN 'Brasil - SP - Santa Isabel'
            WHEN cidade = 'VARGEM GRANDE PAULISTA' THEN 'Brasil - SP - Vargem Grande Paulista'
            WHEN cidade = 'JUQUITIBA' THEN 'Brasil - SP - Juquitiba'
            WHEN cidade = 'RIO GRANDE DA SERRA' THEN 'Brasil - SP - Rio Grande da Serra'
            WHEN cidade = 'GUARAREMA' THEN 'Brasil - SP - Guararema'
            WHEN cidade = 'BIRITIBA-MIRIM' THEN 'Brasil - SP - Biritiba-Mirim'
            WHEN cidade = 'PIRAPORA BOM JESUS' THEN 'Brasil - SP - Pirapora do Bom Jesus'
            WHEN cidade = 'S.LOURENCO DA SERRA' THEN 'Brasil - SP - São Lourenço da Serra'
            WHEN cidade = 'SALESOPOLIS' THEN 'Brasil - SP - Salesópolis'
            ELSE 'Brasil - SP - ' + cidade  -- Para outros casos, adiciona o formato automaticamente
      END as REGIAO
  

 FROM BO_2016


 )    SELECT 
            *
            ,CASE 
                WHEN FLAG_SUBMOTIVO LIKE 'Estupro%' THEN 'Estupro'
                WHEN FLAG_SUBMOTIVO LIKE 'Furto%' THEN 'Furto'
                WHEN FLAG_SUBMOTIVO LIKE 'Homicidio%' THEN 'Homicidio'
                WHEN FLAG_SUBMOTIVO LIKE 'Induzir instigar%' 
                     OR FLAG_SUBMOTIVO LIKE 'Drogas%'
                     OR FLAG_SUBMOTIVO LIKE'%Porte de entorpecente%' THEN 'Uso de Drogas'
                WHEN FLAG_SUBMOTIVO LIKE 'Lesao corporal%' THEN 'Lesao corporal'
                WHEN FLAG_SUBMOTIVO LIKE 'Roubo%' THEN 'Roubo'
                WHEN FLAG_SUBMOTIVO LIKE 'Trafico%' 
                     OR FLAG_SUBMOTIVO LIKE 'Oferecer droga%' THEN 'Trafico'
            END FLAG_MOTIVO
     FROM base_BOs


;