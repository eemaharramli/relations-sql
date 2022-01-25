									/* creating Library database and start using it */
--create database Library
--use Library

									/* creating AUTHORS table */

--create table Authors
--(
--    author_id int primary key identity,
--    author_name nvarchar(20) not null,
--    author_surname nvarchar(30) not null,
--    dead bit default 0 not null
--)

									/* creating GENRES table */


--create table Genres
--(
--    genre_id int primary key identity,
--    genre_name nvarchar(30) not null
--)

									/* creating AUTHORSGENRES table To connect two table */

--create table AuthorsGenres
--(
--    author_id int references Authors(author_id),
--    genre_id int references Genres(genre_id)
--)

									/* insert data to table AUTHORS */


--insert into Authors(author_name, author_surname, dead)
--values ('Fedor', 'Dostoyevskiy', 1),
--       ('Lev', 'Tolstoy', 0),
--       ('Fedor', 'Dostoyevskiy', 1),
--       ('Mixail', 'Bulqakov', 0),
--       ('Nikolay', 'Qoqol', 1),
--       ('Aleksandr', 'Pushkin', 0);

									/* insert data to table GENRES */

--insert into Genres(genre_name)
--values ('Novel'),
--       ('Romance'),
--       ('Fantasy'),
--       ('Modern'),
--	   ('Historical Romance'),
--       ('Philosophical fiction'),
--       ('Suspense'),
--       ('Crime fiction'),
--       ('War story');

--select author_id, author_name from Authors
--union
--select genre_id, genre_name from Genres


									/* insert data to table AUTHORSGENRES unique values from AUTHORS and GENRES */

--insert into AuthorsGenres values
--(2, 9),
--(2, 5),
--(1, 3),
--(1, 4),
--(4, 3),
--(5, 5),
--(3, 2),
--(6, 1),
--(6, 7),
--(2, 8),
--(3, 6)

									/* Showing data about AUTHORS and GENRES */

--select A.author_name, A.author_surname, G.genre_name from AuthorsGenres AG
--inner join Authors A
--on A.author_id = AG.author_id
--inner join Genres G
--on G.genre_id = AG.genre_id

									/* create table Book_detail */

--create table Book_detail
--(
--	book_detail_id int primary key identity,
--	sheet_count int,
--	color nvarchar(20) default 'black',
--	writing_year date,
--	author_id int references Authors(author_id),
--	genre_id int references Genres(genre_id),
--	count int not null
--)

									/* insert data to table Book_detail */

--insert into Book_detail(sheet_count, color, writing_year, author_id, genre_id, count)
--values
--(1225, 'black', '1869', 2, 9, 1231),
--(864,'dark green', '1877', 2, 2, 744),
--(840, 'dark blue', '1880', 1, 3, 527),
--(352, 'red', '1835', 5, 5, 311),
--(504, 'green', '1940', 4, 3, 402),
--(480, 'gold', '1836', 6, 5, 125)


									/* Showing detailed data about Books in Library */

--select * from Book_detail B
--join Authors A
--on A.author_id = B.author_id
--join Genres G
--on A.author_id = G.genre_id


									/* create table Book_info */

--create table Book_info(
--	book_info_id int primary key identity,
--	book_name nvarchar(50) not null,
--	book_price int not null,
--	book_detail_id int references Book_detail(book_detail_id)
--)

									/* insert data into table Book_info */

--insert into Book_info(book_name, book_price, book_detail_id)
--values
--('Капитанская дочка', 12, 6),
--('Мертвые души', 13, 4),
--('Анна Каренина', 14, 2),
--('Война и мир', 21, 1),
--('Братья Карамазовы', 18, 3),
--('Мастер и Маргарита', 24, 5)

									/* Show all data from table Book_info in detailed form*/

--select * from Book_detail BD
--join Book_info BI
--on BD.book_detail_id = BI.book_info_id


									/* create table Customers */

--create table Customers(
--	customer_id int primary key identity,
--	customer_name nvarchar(50) not null,
--	wallet_capacity int,
--	already_read int references Book_detail(book_detail_id),
--	phone_number nvarchar(15) not null,
--	address nvarchar(40),
--	customer_age int not null
--)

									/* insert data into table Customers */

--insert into Customers(customer_name, wallet_capacity, already_read, phone_number, address, customer_age)
--values
--('Xeyali', 135, 2, '055-111-11-11', 'neftchiler', 21),
--('Elnur', 89, 1, '051-222-22-22', 'yasamal', 28),
--('Akif', 183, 3, '055-333-33-33', 'baku', 34),
--('Orxan', 240, 5, '051-444-44-44', 'ahmadli', 29),
--('Sabir', 143, 1, '055-555-55-55', 'yasamal', 25),
--('Madat', 213, 4, '077-666-66-66', 'sumqayit', 31)

									/* create table Loan Info */

--create table Loan_info(
--	customer_id int references Customers(customer_id),
--	book_id int references Book_detail(book_detail_id),
--	loan_date date default getdate(),
--	due_date date default dateadd(day, 10, getdate()),
--	count_of_book int default 1
--)

									/* insert date to table Loan Info */


--insert into Loan_info(customer_id, book_id)
--values
--(1, 3),
--(2, 1),
--(3, 4),
--(4, 2),
--(6, 5),
--(5, 6)

									/* show all loan books */

--select BI.book_name, BI.book_price, C.customer_name from Loan_info LI
--join Book_info BI
--on LI.book_id = BI.book_info_id
--join Customers C
--on C.customer_id = LI.customer_id
--order by C.customer_name


-------------------------------------------------Tasks----------------------------------------------------------------

/* Task 1. Show books by genres */

--select * from Book_info BI
--join Book_detail BD
--on BI.book_info_id = BD.book_detail_id
--join Genres G
--on BD.genre_id = G.genre_id

/* Task 2. Show Author Books */

--select BI.book_name, A.author_name, A.author_surname from Book_info BI
--join Book_detail BD
--on BI.book_info_id = BD.book_detail_id
--join Authors A
--on BD.author_id = A.author_id

/* Task 3. Show Author Genres */

--select A.author_name, A.author_surname, G.genre_name from AuthorsGenres AG
--join Authors A
--on AG.author_id = A.author_id
--join Genres G
--on AG.genre_id = G.genre_id
--order by A.author_name, A.Author_surname

/* Task 4. Show Books that customers has been read */

--select C.customer_name, BI.book_name from Loan_info LI
--join Customers C
--on LI.customer_id = C.customer_id
--join Book_info BI
--on LI.book_id = BI.book_info_id
