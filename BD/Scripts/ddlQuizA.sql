-- Gerado por Oracle SQL Developer Data Modeler 18.1.0.082.1035
--   em:        2018-09-28 21:07:00 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE tatendentes (
    id_usuario     NUMERIC(28) NOT NULL,
    id_atendente   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tAtendentes ADD constraint tatendentes_pk PRIMARY KEY CLUSTERED (id_usuario, id_atendente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tcadastoquestionario (
    tliderequipe_id_usuario         NUMERIC(28) NOT NULL,
    tliderequipe_id_lidereq         NUMERIC(28) NOT NULL,
    tquestionario_id_questionario   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tcadastoQuestionario ADD constraint cadastrar2_pk PRIMARY KEY CLUSTERED (tLiderEquipe_id_usuario, tLiderEquipe_id_liderEq, tQuestionario_id_questionario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tconteudos (
    id_conteudo                     NUMERIC(28) NOT NULL,
    corpoconteudo                   ntext NOT NULL,
    imgconteudo                     image,
    tquestionario_id_questionario   NUMERIC(28) NOT NULL
)
    ON "default"
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    tConteudos__IDX ON tconteudos ( tquestionario_id_questionario ) 
    ON "default" go

ALTER TABLE tConteudos ADD constraint tconteudos_pk PRIMARY KEY CLUSTERED (id_conteudo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tfazsugestao (
    tatendentes_id_usuario     NUMERIC(28) NOT NULL,
    tatendentes_id_atendente   NUMERIC(28) NOT NULL,
    tsugestoes_id_sugestao     NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tFazSugestao ADD constraint faz_pk PRIMARY KEY CLUSTERED (tAtendentes_id_usuario, tAtendentes_id_atendente, tSugestoes_id_Sugestao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tgerarrespostas (
    tatendentes_id_usuario          NUMERIC(28) NOT NULL,
    tatendentes_id_atendente        NUMERIC(28) NOT NULL,
    trespostasusuario_id_respuser   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tGerarRespostas ADD constraint gerar_pk PRIMARY KEY CLUSTERED (tAtendentes_id_usuario, tAtendentes_id_atendente, tRespostasUsuario_id_respUser)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tinserirconteudos (
    tliderequipe_id_usuario   NUMERIC(28) NOT NULL,
    tliderequipe_id_lidereq   NUMERIC(28) NOT NULL,
    tconteudos_id_conteudo    NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tInserirConteudos ADD constraint inserir_pk PRIMARY KEY CLUSTERED (tLiderEquipe_id_usuario, tLiderEquipe_id_liderEq, tConteudos_id_conteudo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tliderequipe (
    id_usuario   NUMERIC(28) NOT NULL,
    id_lidereq   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tLiderEquipe ADD constraint tliderequipe_pk PRIMARY KEY CLUSTERED (id_usuario, id_liderEq)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tperguntas (
    id_pergunta                     NUMERIC(28) NOT NULL,
    enunciado                       VARCHAR(100) NOT NULL,
    ttipopergunta_id_tipoperg       NUMERIC(28),
    tquestionario_id_questionario   NUMERIC(28) NOT NULL,
    trespostas_id_resposta          NUMERIC(28) NOT NULL
)
    ON "default"
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    tPerguntas__IDX ON tperguntas ( trespostas_id_resposta ) 
    ON "default" go

ALTER TABLE tPerguntas ADD constraint tperguntas_pk PRIMARY KEY CLUSTERED (id_pergunta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tquestionario (
    id_questionario          NUMERIC(28) NOT NULL,
    qtde_perguntas           NUMERIC(28) NOT NULL,
    tconteudos_id_conteudo   NUMERIC(28) NOT NULL,
    titulo                   VARCHAR(50) NOT NULL
)
    ON "default"
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    tQuestionario__IDX ON tquestionario ( tconteudos_id_conteudo ) 
    ON "default" go

ALTER TABLE tQuestionario ADD constraint tquestionario_pk PRIMARY KEY CLUSTERED (id_questionario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tresponderquestionario (
    tatendentes_id_usuario          NUMERIC(28) NOT NULL,
    tatendentes_id_atendente        NUMERIC(28) NOT NULL,
    tquestionario_id_questionario   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tResponderQuestionario ADD constraint responder_pk PRIMARY KEY CLUSTERED (tAtendentes_id_usuario, tAtendentes_id_atendente, tQuestionario_id_questionario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE trespostas (
    id_resposta              NUMERIC(28) NOT NULL,
    corporesposta            VARCHAR(120) NOT NULL,
    tperguntas_id_pergunta   NUMERIC(28) NOT NULL
)
    ON "default"
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    tRespostas__IDX ON trespostas ( tperguntas_id_pergunta ) 
    ON "default" go

ALTER TABLE tRespostas ADD constraint trespostas_pk PRIMARY KEY CLUSTERED (id_resposta)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE trespostasusuario (
    id_respuser                     NUMERIC(28) NOT NULL,
    corporespuser                   VARCHAR(50) NOT NULL,
    tquestionario_id_questionario   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tRespostasUsuario ADD constraint trespostasusuario_pk PRIMARY KEY CLUSTERED (id_respUser)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE trh (
    id_usuario   NUMERIC(28) NOT NULL,
    id_rh        NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tRH ADD constraint trh_pk PRIMARY KEY CLUSTERED (id_usuario, id_rh)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tsugestoes (
    id_sugestao   NUMERIC(28) NOT NULL,
    descricao     VARCHAR(60) NOT NULL
)
    ON "default" go

ALTER TABLE tSugestoes ADD constraint tsugestoes_pk PRIMARY KEY CLUSTERED (id_Sugestao)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE ttipopergunta (
    id_tipoperg         NUMERIC(28) NOT NULL,
    descricaotipoperg   VARCHAR(65) NOT NULL
)
    ON "default" go

ALTER TABLE tTipoPergunta ADD constraint ttipopergunta_pk PRIMARY KEY CLUSTERED (id_tipoPerg)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tusuarios (
    id_usuario       NUMERIC(28) NOT NULL,
    nomeusuario      VARCHAR(120) NOT NULL,
    datanasc         DATE NOT NULL,
    login            VARCHAR(80) NOT NULL,
    equipe           VARCHAR(65),
    senha            VARCHAR(100) NOT NULL,
    trh_id_usuario   NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tUsuarios ADD constraint tusuarios_pk PRIMARY KEY CLUSTERED (id_usuario, tRH_id_usuario)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

CREATE TABLE tvisualizarconteudos (
    tatendentes_id_usuario     NUMERIC(28) NOT NULL,
    tatendentes_id_atendente   NUMERIC(28) NOT NULL,
    tconteudos_id_conteudo     NUMERIC(28) NOT NULL
)
    ON "default" go

ALTER TABLE tVisualizarConteudos ADD constraint visualizar_pk PRIMARY KEY CLUSTERED (tAtendentes_id_usuario, tAtendentes_id_atendente, tConteudos_id_conteudo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" go

ALTER TABLE tcadastoQuestionario
    ADD CONSTRAINT cadastrar2_tliderequipe_fk FOREIGN KEY ( tliderequipe_id_usuario,
                                                            tliderequipe_id_lidereq )
        REFERENCES tliderequipe ( id_usuario,
                                  id_lidereq )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tcadastoQuestionario
    ADD CONSTRAINT cadastrar2_tquestionario_fk FOREIGN KEY ( tquestionario_id_questionario )
        REFERENCES tquestionario ( id_questionario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tFazSugestao
    ADD CONSTRAINT faz_tatendentes_fk FOREIGN KEY ( tatendentes_id_usuario,
                                                    tatendentes_id_atendente )
        REFERENCES tatendentes ( id_usuario,
                                 id_atendente )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tFazSugestao
    ADD CONSTRAINT faz_tsugestoes_fk FOREIGN KEY ( tsugestoes_id_sugestao )
        REFERENCES tsugestoes ( id_sugestao )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tGerarRespostas
    ADD CONSTRAINT gerar_tatendentes_fk FOREIGN KEY ( tatendentes_id_usuario,
                                                      tatendentes_id_atendente )
        REFERENCES tatendentes ( id_usuario,
                                 id_atendente )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tGerarRespostas
    ADD CONSTRAINT gerar_trespostasusuario_fk FOREIGN KEY ( trespostasusuario_id_respuser )
        REFERENCES trespostasusuario ( id_respuser )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tInserirConteudos
    ADD CONSTRAINT inserir_tconteudos_fk FOREIGN KEY ( tconteudos_id_conteudo )
        REFERENCES tconteudos ( id_conteudo )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tInserirConteudos
    ADD CONSTRAINT inserir_tliderequipe_fk FOREIGN KEY ( tliderequipe_id_usuario,
                                                         tliderequipe_id_lidereq )
        REFERENCES tliderequipe ( id_usuario,
                                  id_lidereq )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tResponderQuestionario
    ADD CONSTRAINT responder_tatendentes_fk FOREIGN KEY ( tatendentes_id_usuario,
                                                          tatendentes_id_atendente )
        REFERENCES tatendentes ( id_usuario,
                                 id_atendente )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tResponderQuestionario
    ADD CONSTRAINT responder_tquestionario_fk FOREIGN KEY ( tquestionario_id_questionario )
        REFERENCES tquestionario ( id_questionario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tAtendentes
    ADD CONSTRAINT tatendentes_tusuarios_fk FOREIGN KEY ( id_usuario,
                                                          id_atendente )
        REFERENCES tusuarios ( id_usuario,
                               trh_id_usuario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tConteudos
    ADD CONSTRAINT tconteudos_tquestionario_fk FOREIGN KEY ( tquestionario_id_questionario )
        REFERENCES tquestionario ( id_questionario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tLiderEquipe
    ADD CONSTRAINT tliderequipe_tusuarios_fk FOREIGN KEY ( id_usuario,
                                                           id_lidereq )
        REFERENCES tusuarios ( id_usuario,
                               trh_id_usuario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tPerguntas
    ADD CONSTRAINT tperguntas_tquestionario_fk FOREIGN KEY ( tquestionario_id_questionario )
        REFERENCES tquestionario ( id_questionario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tPerguntas
    ADD CONSTRAINT tperguntas_trespostas_fk FOREIGN KEY ( trespostas_id_resposta )
        REFERENCES trespostas ( id_resposta )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tPerguntas
    ADD CONSTRAINT tperguntas_ttipopergunta_fk FOREIGN KEY ( ttipopergunta_id_tipoperg )
        REFERENCES ttipopergunta ( id_tipoperg )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tQuestionario
    ADD CONSTRAINT tquestionario_tconteudos_fk FOREIGN KEY ( tconteudos_id_conteudo )
        REFERENCES tconteudos ( id_conteudo )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tRespostas
    ADD CONSTRAINT trespostas_tperguntas_fk FOREIGN KEY ( tperguntas_id_pergunta )
        REFERENCES tperguntas ( id_pergunta )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tRespostasUsuario
    ADD CONSTRAINT trespostasusuario_tquestionario_fk FOREIGN KEY ( tquestionario_id_questionario )
        REFERENCES tquestionario ( id_questionario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tRH
    ADD CONSTRAINT trh_tusuarios_fk FOREIGN KEY ( id_usuario,
                                                  id_rh )
        REFERENCES tusuarios ( id_usuario,
                               trh_id_usuario )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tUsuarios
    ADD CONSTRAINT tusuarios_trh_fk FOREIGN KEY ( trh_id_usuario )
        REFERENCES trh ( id_usuario,
                         id_rh )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tVisualizarConteudos
    ADD CONSTRAINT visualizar_tatendentes_fk FOREIGN KEY ( tatendentes_id_usuario,
                                                           tatendentes_id_atendente )
        REFERENCES tatendentes ( id_usuario,
                                 id_atendente )
ON DELETE NO ACTION 
    ON UPDATE no action go

ALTER TABLE tVisualizarConteudos
    ADD CONSTRAINT visualizar_tconteudos_fk FOREIGN KEY ( tconteudos_id_conteudo )
        REFERENCES tconteudos ( id_conteudo )
ON DELETE NO ACTION 
    ON UPDATE no action go



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             4
-- ALTER TABLE                             40
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
