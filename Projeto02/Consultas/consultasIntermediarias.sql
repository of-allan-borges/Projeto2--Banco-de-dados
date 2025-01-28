1. Buscar os livros disponíveis para empréstimo de uma biblioteca específica:

SELECT livro.titulo, livro.quantidade_disponivel, biblioteca.nome_biblioteca
FROM livro
JOIN local ON livro.id_local = local.id_local
JOIN biblioteca ON local.fk_local_biblioteca = biblioteca.id_biblioteca
WHERE biblioteca.id_biblioteca = 1
AND livro.quantidade_disponivel > 0;

2. Buscar todos os empréstimos de um usuário específico:

SELECT emprestimo.id_emprestimo, livro.titulo, emprestimo.data_emprestimo, emprestimo.data_devolucao, emprestimo.status
FROM emprestimo
JOIN livro ON emprestimo.id_livro = livro.id_livro
WHERE emprestimo.id_usuario = 1;

3. Buscar livros e seus autores:

SELECT livro.titulo, autor.nome_autor
FROM livro
JOIN livro_autor ON livro.id_livro = livro_autor.id_livro
JOIN autor ON livro_autor.id_autor = autor.id_autor;