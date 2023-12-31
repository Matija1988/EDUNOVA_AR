use master;
go
drop database arproject;
go
create database arproject;
go
use arproject;

create table apps(
id int primary key not null identity(1,1), 
name varchar(50) not null, -- ime aplikacije AR Drnis, AR Biokovo
version decimal(3,2), -- ako ikad dode do v 999.99 castim suicidalnim tjednom na Ibizi
url varchar(50) -- link gdje se nalazi najnovija verzija mobilne aplikacije
); 

create table users(
id int primary key not null identity (1,1),
userName varchar(50) not null, 
password varchar(50) not null,
appUsed int, -- mo�e se registrirati prije downloada aplikacije
highscore int, -- mo�e koristiti aplikaciju prije koristenja prvog kviza
lastLogIn datetime,
email varchar(100)
);
create table appsUsedList(
userID int,
appID int
);
create table leaderboards(
id int primary key not null identity(1,1),
userID int not null, 
score int not null
);

create table questions(
id int primary key not null identity(1,1),
question varchar(100) not null, -- pitanje mora postojat 
points int not null -- sva pitanja tocno odgovorena donose odredeni broj bodova 
);

create table answers(
id int primary key not null identity(1,1),
answer varchar(50) not null,
isCorrect bit not null -- unosenje laznih odgovora 
);

create table questionsAnswers(
questionID int primary key not null, -- jedno pitanje moze imati vise odgovra, ne moraju svi biti tocni
answersID int not null
);

create table quizzes(
id int primary key not null identity(1,1),
name varchar(50) not null,
questionAnswer int,
leaderboard int not null
);

alter table leaderboards add foreign key (userID) references users(id);
alter table questionsAnswers add foreign key(questionID) references questions(id);
alter table questionsAnswers add foreign key(answersID) references answers(id);
alter table quizzes add foreign key (leaderboard) references leaderboards(id);
alter table quizzes add foreign key (questionAnswer) references questionsAnswers(questionID);
alter table appsUsedList add foreign key (userID) references users(id);
alter table appsUsedList add foreign key (appID) references apps(id);