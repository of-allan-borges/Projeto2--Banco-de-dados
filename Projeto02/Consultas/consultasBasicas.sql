1. Inserir um novo livro na tabela:

INSERT INTO livro (titulo, editora, data_publicacao, quantidade_disponivel, id_local, quantidade_total) 
VALUES ('Dom Casmurro', 'Editora A', '1899-01-01', 5, 1, 10);

2. Alterar a quantidade disponível de um livro específico:

UPDATE livro 
SET quantidade_disponivel = 3 
WHERE id_livro = 1;

3. Excluir um livro da tabela livro:

DELETE FROM livro 
WHERE id_livro = 1;

4. Alterar o telefone de um usuário:

UPDATE usuario 
SET telefone = '(11) 99876-5432' 
WHERE id_usuario = 1;

5. Inserir um novo usuário:

INSERT INTO usuario (nome, email, telefone, data_registro, endereco, data_nascimento) 
VALUES ('Maria Silva', 'maria@example.com', '(11) 98765-4321', '2025-01-12', 'Rua das Flores, 123', '1995-02-25');

6. Excluir um usuário:

DELETE FROM usuario 
WHERE id_usuario = 1;

7. Inserir uma nova multa:

INSERT INTO multa (id_funcionario_responsavel, id_usuario, valor, data_multa, status_multa, descricao) 
VALUES (2, 3, 50.00, '2025-01-12', 'Pendente', 'Multa por atraso no retorno do livro');

8. Alterar o status de uma multa:

UPDATE multa 
SET status_multa = 'Pago', data_pagamento = '2025-01-13' 
WHERE id_multa = 1;

9. Excluir uma multa:

DELETE FROM multa 
WHERE id_multa = 1;

10. Inserir um novo funcionário:

INSERT INTO funcionario (nome, cargo, data_contratacao, salario, email, telefone, id_biblioteca) 
VALUES ('Carlos Oliveira', 'Assistente', '2025-01-01', 3000.00, 'carlos@biblioteca.com', '(11) 99876-5432', 1);

11. Alterar o salário de um funcionário:

UPDATE funcionario 
SET salario = 3200.00 
WHERE id_funcionario = 1;

12. Excluir um funcionário:

DELETE FROM funcionario 
WHERE id_funcionario = 1;