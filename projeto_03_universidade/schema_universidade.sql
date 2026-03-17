-- Criaçã de star schema

create table dim_aluno (
	id_Aluno int generated always as identity primary key,
	PNome varchar (20),
	Sobrenome varchar (20)
);

create table dim_disciplinas (
	id_Disciplina int generated always as identity,
	id_Curso int,
	id_Requisitos int,
	constraint disciplina_pk
	primary key (id_Disciplina, id_Curso)
);

create table dim_professores (
	id_Professor int generated always as identity,
	id_Disciplina int unique,
	id_Departamento int,
	constraint prof_pk
	primary key (id_Professor,id_Disciplina)
);

create table dim_cursos (
	id_Curso int generated always as identity primary key,
	id_Departamento int,
	Departamento varchar (45),
	Campus varchar (45),
	Coordenador int
);

create table fact_matricula (
	id_Aluno int,
	id_Disciplina int,
	id_Curso int,
	constraint aluno_fk
	foreign key (id_Aluno)
	references dim_Aluno(id_Aluno),
	constraint disciplinas_fk
	foreign key (id_Disciplina,id_Curso)
	references dim_disciplinas(id_Disciplina,id_Curso),
	constraint professor_fk
	foreign key (id_Disciplina)
	references dim_professores(id_Disciplina),
	constraint curso_fk
	foreign key (id_Curso)
	references dim_cursos(id_Curso),
	constraint pk_matricula
	primary key (id_Aluno,id_Disciplina)
);