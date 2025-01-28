-- Buscar o total de livros emprestados por um usuário e o valor total das multas:
SELECT usuario.nome, COUNT(emprestimo.id_emprestimo) AS total_emprestimos, SUM(multa.valor) AS total_multas FROM usuario JOIN emprestimo ON usuario.id_usuario = emprestimo.id_usuario JOIN multa ON emprestimo.id_emprestimo = multa.id_emprestimo WHERE usuario.id_usuario = 1 GROUP BY usuario.nome;
-- Buscar o número de livros disponíveis em cada biblioteca, separados por tipo de local:
SELECT biblioteca.nome_biblioteca, local.tipo_local, SUM(livro.quantidade_disponivel) AS total_disponivel FROM livro JOIN local ON livro.id_local = local.id_local JOIN biblioteca ON local.fk_local_biblioteca = biblioteca.id_biblioteca GROUP BY biblioteca.nome_biblioteca, local.tipo_local ORDER BY biblioteca.nome_biblioteca, total_disponivel DESC;

-- Buscar todos os livros, seus autores e o número de empréstimos realizados:
SELECT livro.titulo, autor.nome_autor, COUNT(emprestimo.id_emprestimo) AS total_emprestimos FROM livro
JOIN livro_autor ON livro.id_livro = livro_autor.id_livro
JOIN autor ON livro_autor.id_autor = autor.id_autor
LEFT JOIN emprestimo ON livro.id_livro = emprestimo.id_livro
GROUP BY livro.titulo, autor.nome_autor
ORDER BY total_emprestimos DESC;
