create TABLE aluno(

id_aluno integer PRIMARY KEY AUTOINCREMENT,
nome_aluno text,
idade integer NOT NULL,
curso text not NULL
);

/*aletrando o nome curso para estudante*/
ALTER TABLE aluno RENAME COLUMN alunos TO estudantes;

/*adicionando uma coluna na tabela*/
ALTER TABLE estudantes add COLUMN email text varchar (100) not NULL;
ALTER TABLE estudantes add COLUMN cpf text;

/* alterando a tabela aluno para estudante*/
ALTER TABLE aluno  RENAME to estudantes;

/*deletando a coluna curso*/
ALTER TABLE estudantes DROP COLUMN curso;


 
 SELECT *FROM aluno;
 
 SELECT *from estudantes;
 
 drop table aluno;
 
 drop table estudantes;