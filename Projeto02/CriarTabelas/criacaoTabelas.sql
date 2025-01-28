-- Tabela no Duckdb: autor
CREATE TABLE autor (
    id_autor INTEGER PRIMARY KEY,  -- Não precisa do AUTOINCREMENT
    nome_autor VARCHAR(100) NOT NULL,
    biografia TEXT,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

-- Tabela no Duckdb: biblioteca
CREATE TABLE biblioteca (
    id_biblioteca INTEGER PRIMARY KEY,  -- Não precisa do AUTOINCREMENT
    nome_biblioteca VARCHAR(100) NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    horario_abertura TIME NOT NULL,
    horario_fechamento TIME NOT NULL,
    quantidade_funcionarios INTEGER NOT NULL
);


-- Tabela no Duckdb: funcionario
CREATE TABLE funcionario (
    id_funcionario INTEGER PRIMARY KEY,  -- Não precisa do AUTOINCREMENT
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DOUBLE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    id_biblioteca INTEGER NOT NULL
);

-- Tabela no Duckdb: genero
CREATE TABLE genero (
    id_genero INTEGER PRIMARY KEY,  -- Não precisa do AUTOINCREMENT
    nome_genero VARCHAR(50) NOT NULL,
    tipo_genero VARCHAR(50),
    data_criacao DATE NOT NULL
);


-- Tabela no Duckdb: livro
CREATE TABLE livro (
    id_livro INTEGER PRIMARY KEY,  -- Não precisa do AUTOINCREMENT
    titulo VARCHAR(200) NOT NULL,
    editora VARCHAR(100) NOT NULL,
    data_publicacao DATE NOT NULL,
    quantidade_disponivel INTEGER NOT NULL,
    id_local INTEGER NOT NULL,
    quantidade_total INTEGER NOT NULL
);


-- Tabela no Duckdb: usuario
CREATE TABLE usuario (
    id_usuario INTEGER PRIMARY KEY,  -- Não precisa do AUTOINCREMENT
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15) NOT NULL,
    data_registro DATE NOT NULL,
    endereco TEXT NOT NULL,
    data_nascimento DATE NOT NULL
);

-- Tabela no Duckdb reserva com restrição UNIQUE
CREATE TABLE reserva (
    id_reserva INTEGER PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_livro INTEGER NOT NULL,
    data_reserva DATE NOT NULL,
    status_reserva VARCHAR(20) NOT NULL,
    data_validade DATE NOT NULL,
    tipo_reserva VARCHAR(50) NOT NULL,
    id_funcionario_responsavel INTEGER NOT NULL,
    fk_reserva_usuario INTEGER REFERENCES usuario(id_usuario),
    fk_reserva_livro INTEGER REFERENCES livro(id_livro),
    fk_reserva_funcionario INTEGER REFERENCES funcionario(id_funcionario),
    UNIQUE (id_usuario, id_livro)
);

-- Tabela no Duckdb multa com restrição UNIQUE
CREATE TABLE multa (
    id_multa INTEGER PRIMARY KEY,
    id_funcionario_responsavel INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_multa DATE NOT NULL,
    status_multa VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    data_pagamento DATE,
    id_emprestimo INTEGER,
    fk_multa_funcionario INTEGER REFERENCES funcionario(id_funcionario),
    fk_multa_usuario INTEGER REFERENCES usuario(id_usuario),
    fk_multa_emprestimo INTEGER REFERENCES emprestimo(id_emprestimo),
    UNIQUE (id_funcionario_responsavel, id_multa)
);

-- Tabela no Duckdb livro_genero com restrição UNIQUE
CREATE TABLE livro_genero (
    id_livro INTEGER NOT NULL,
    id_genero INTEGER NOT NULL,
    PRIMARY KEY (id_livro, id_genero),
    fk_livro_genero_livro INTEGER REFERENCES livro(id_livro),
    fk_livro_genero_genero INTEGER REFERENCES genero(id_genero),
    UNIQUE (id_livro, id_genero)
);

-- Tabela no Duckdb livro_autor com restrição UNIQUE
CREATE TABLE livro_autor (
    id_livro INTEGER NOT NULL,
    id_autor INTEGER NOT NULL,
    PRIMARY KEY (id_livro, id_autor),
    fk_livro_autor_livro INTEGER REFERENCES livro(id_livro),
    fk_livro_autor_autor INTEGER REFERENCES autor(id_autor),
    UNIQUE (id_livro, id_autor)
);

-- Tabela no Duckdb emprestimo com restrição UNIQUE
CREATE TABLE emprestimo (
    id_emprestimo INTEGER PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_livro INTEGER NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status VARCHAR(20) NOT NULL,
    tipo_emprestimo VARCHAR(50) NOT NULL,
    id_funcionario_responsavel INTEGER NOT NULL,
    fk_emprestimo_usuario INTEGER REFERENCES usuario(id_usuario),
    fk_emprestimo_livro INTEGER REFERENCES livro(id_livro),
    fk_emprestimo_funcionario INTEGER REFERENCES funcionario(id_funcionario),
    UNIQUE (id_usuario, id_livro)
);

-- Tabela no Duckdb local com chave estrangeira de biblioteca

CREATE TABLE local (
    id_local INTEGER PRIMARY KEY,
    descricao TEXT NOT NULL,
    andar VARCHAR(50) NOT NULL,
    prateleira VARCHAR(20) NOT NULL,
    tipo_local VARCHAR(50) NOT NULL,
    capacidade INTEGER NOT NULL,
    fk_local_biblioteca INTEGER REFERENCES biblioteca(id_biblioteca)
);
