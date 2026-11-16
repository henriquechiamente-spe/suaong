SET NAMES utf8mb4;

DROP DATABASE IF EXISTS suaong_db;

CREATE DATABASE suaong_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE suaong_db;

CREATE TABLE candidato (
    id_candidato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    formacao VARCHAR(150) NOT NULL,
    experiencia_profissional TEXT
);

CREATE TABLE vaga (
    id_vaga INT AUTO_INCREMENT PRIMARY KEY,
    cargo VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    requisitos TEXT NOT NULL,
    salario DECIMAL(10,2) NOT NULL CHECK (salario >= 0),
    quantidade_vagas INT NOT NULL CHECK (quantidade_vagas > 0),
    data_publicacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('aberta', 'encerrada') NOT NULL DEFAULT 'aberta'
);

CREATE TABLE candidatura (
    id_candidato INT NOT NULL,
    id_vaga INT NOT NULL,
    data_candidatura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pendente', 'em_analise', 'aprovada', 'rejeitada')
        NOT NULL DEFAULT 'pendente',

    PRIMARY KEY (id_candidato, id_vaga),

    FOREIGN KEY (id_candidato)
        REFERENCES candidato (id_candidato)
        ON DELETE CASCADE,

    FOREIGN KEY (id_vaga)
        REFERENCES vaga (id_vaga)
        ON DELETE CASCADE
);