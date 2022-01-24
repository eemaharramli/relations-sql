create database Library
use Library

create table Authors
(
    author_id int primary key identity ,
    author_name nvarchar(20) not null,
    author_surname nvarchar(30) not null,
    dead bit default 0 not null
)

insert into Authors (author_name, author_surname, dead)
values ('Fedor', 'Dostoyevskiy', 0),
       ('Lev', 'Tolstoy', 1),
       ('Fedor', 'Dostoyevskiy', 0),
       ('Mixail', 'Bulqakov', 1),
       ('Nikolay', 'Qoqol', 0),
       ('Aleksandr', 'Pushkin', 1)

update Authors
set dead = 0
where author_id % 2 = 0

update Authors
set dead = 1
where author_id % 2 != 0

select *
from Authors;

create table Genres
(
    genre_id int primary key identity ,
    genre_name nvarchar(30) not null
)

insert into Genres(genre_name)
values ('Novel'),
       ('Romance'),
       ('Fantasy'),
       ('Modern');

insert into Genres(genre_name)
values ('Historical Romance'),
       ('Philosophical fiction'),
       ('Suspense'),
       ('Crime fiction'),
       ('War story');

select *
from Genres;

create table AuthorsGenres
(
    author_id int references Authors(author_id),
    genre_id int references Genres(genre_id)
)

select author_name, author_surname, genre_name from Authors A
inner join Genres G
on A.author_id = G.genre_id

create table Book_detail
(
    book_detail_id int primary key identity ,
    sheet_count int not null ,
    color nvarchar(15) default 'black',
    writing_year date,
    author_id int references Authors(author_id),
    genre_id int references Genres(genre_id),
    count int not null
)

insert into Book_detail(sheet_count, color, writing_year, count)
values (608, 'dark-green', '1886', 2),
       (864, 'dark-blue', '1877', 5),
       (840, 'black', '1880', 7),
       (1225, 'red', '1869', 1),
       (504, 'black', '1967', 10),
       (352, 'black', '1994', 6),
       (1833, 'dark-green', '1833', 4);

select sheet_count, color, writing_year, author_name, author_surname, genre_name from Book_detail B
full join Authors A
on A.author_id = b.author_id
full join Genres G
on B.genre_id = G.genre_id