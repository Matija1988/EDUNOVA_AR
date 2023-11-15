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
appUsed int, -- može se registrirati prije downloada aplikacije
highscore int -- može koristiti aplikaciju prije koristenja prvog kviza
);

create table leaderboard(
id int primary key not null identity(1,1),
userID int not null, 
gameID int not null,
score int not null
);

create table questions(
id int primary key not null identity(1,1),
question varchar(100) not null, -- pitanje mora postojat
answer int not null, -- sva pitanja moraju imati odgovor 
points int not null -- sva pitanja tocno odgovorena donose odredeni broj bodova 
);

create table answers(
id int primary key not null identity(1,1),
answer varchar(50) not null,
isCorrect bit not null -- unosenje laznih odgovora 
);

create table questionsAnswers(
questionID int not null, -- jedno pitanje moze imati vise odgovra, ne moraju svi biti tocni
answersID int not null
);

create table quizzes(
id int primary key not null identity(1,1),
name varchar(50) not null,
questionAnswer int,
leaderboard int
);

alter table leaderboard add foreign key (userID) references users(id);
alter table questionsAnswers add foreign key(questionID) references questions(id);
alter table questionsAnswers add foreign key(answersID) references answers(id);