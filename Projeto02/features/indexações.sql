
CREATE INDEX idx_livro_titulo ON livro(titulo); -- Índice em titulo
SELECT titulo, editora, quantidade_disponivel FROM livro WHERE titulo = 'Livro 1'; -- Exemplo de consulta


CREATE INDEX idx_livro_local ON livro(id_local); -- Índice em id_local na tabela livro
CREATE INDEX idx_local_biblioteca ON local(id_local, fk_local_biblioteca); -- Índice em id_local e id_biblioteca na tabela local 
SELECT livro.titulo, local.andar, local.prateleira, biblioteca.nome_biblioteca 
FROM livro 
JOIN local ON livro.id_local = local.id_local 
JOIN biblioteca ON local.fk_local_biblioteca = biblioteca.id_biblioteca 
WHERE livro.id_livro = 2;


CREATE INDEX idx_livro_quantidades ON livro(quantidade_total, quantidade_disponivel); -- Índice para Busca de Livros com Base em Quantidade Total e Quantidade Disponível 
SELECT titulo, quantidade_total, quantidade_disponivel FROM livro WHERE quantidade_disponivel > 0; -- Exemplo de consulta

