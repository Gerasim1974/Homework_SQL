--создаём бд
--CREATE DATABASE [LIBRARY]
--ALTER DATABASE LIBRARY
--      SET RECURSIVE_TRIGGERS OFF

USE [LIBRARY]



--CREATE TABLE [Authors]([id] BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--    [FirstName] NVARCHAR(150) NOT NULL, [LastName] NVARCHAR(150) NOT NULL, 
--    [Country] NVARCHAR(100) NOT NULL, [BirthDate] DATETIME  NOT NULL)

--CREATE TABLE [Books]([id] BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--          [Name] NVARCHAR(200) NOT NULL, [AuthorId] BIGINT NOT NULL, [Year] SMALLINT,
--          CONSTRAINT FK__Books__AuthorId FOREIGN KEY ([AuthorId]) REFERENCES [Authors](id))

--CREATE TABLE [Users]([Id] BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     [FirstName] NVARCHAR(150) NOT NULL,[LastName] NVARCHAR(150) NOT NULL, 
--     [Email] NVARCHAR(50) UNIQUE NOT NULL, [BirthDate] DATETIME NOT NULL,
--     [Age] SMALLINT, [Address] NVARCHAR(500) NOT NULL,
--     [ExpiredDate] DATETIME)

--CREATE TABLE [UserBooks]([Id] BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED,
--     [UserId] BIGINT NOT NULL, [BookId] BIGINT NOT NULL, [CreatedDate] DATETIME
--     CONSTRAINT FK__Users_Id FOREIGN KEY ([UserId]) REFERENCES [Users]([Id]) ON DELETE CASCADE,
--     CONSTRAINT FK__Books_Id FOREIGN KEY ([BookId]) REFERENCES [Books]([Id]) ON DELETE CASCADE)

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREATE TRIGGER [dbo].[TrgUserBooksInsert]
--   ON  [dbo].[UserBooks]
--   AFTER INSERT
--AS 
--BEGIN
--	SET NOCOUNT ON;
--    UPDATE [dbo].[UserBooks] SET [CreatedDate] = GETDATE() 
--      FROM INSERTED T 
--        WHERE  [dbo].[UserBooks].UserId = T.UserId  and
--               [dbo].[UserBooks].BookId = T.BookId
--END
--GO

--CREATE TRIGGER [dbo].[TrgUsersInsert]
--   ON  [dbo].[Users]
--   AFTER INSERT
--AS 
--BEGIN
--	SET NOCOUNT ON;
--    UPDATE [dbo].[Users] SET  [ExpiredDate] = DATEADD(YEAR, 1, GETDATE()) FROM INSERTED T
--      WHERE [dbo].[Users].[Email] = T.[Email]
--END
--GO

--CREATE TRIGGER [dbo].[TrgUsersInsertUpdate]
--   ON  [dbo].[Users]
--   AFTER INSERT
--AS 
--BEGIN
--	SET NOCOUNT ON;
	
--    UPDATE [dbo].[Users] SET  [Age] = DATEDIFF(YEAR, T.[BirthDate], GETDATE()) 
--           FROM INSERTED T
--            WHERE [dbo].[Users].[Email] = T.[Email]
--END

--GO
--CREATE UNIQUE NONCLUSTERED  INDEX IX_UserBooksID ON dbo.UserBooks ([UserId], [BookId])

--CREATE UNIQUE NONCLUSTERED INDEX IX_BooksID ON dbo.Books ([Name], [AuthorId])

--CREATE UNIQUE NONCLUSTERED INDEX IX_AuthorsID ON dbo.Authors ([FirstName], [LastName], [Country])
--SET DATEFORMAT YMD

--INSERT INTO dbo.Authors([FirstName], [LastName], [Country], [BirthDate])
--  VALUES('Иван','Иванов', 'Россия', '1940-01-01'), ('Сергей','Сергеев', 'Казахстан', '1992-03-07'), 
--        ('Елена','Ленина', 'Казахстан', '1984-07-08'), ('Светлана','Светина', 'Россия', '1976-12-30'), 
--        ('Петр','Петров', 'Республика Беларусь', '1996-05-07'), ('Егор','Егоров', 'Армения', '1914-05-25'),
--        ('Наталья','Наташина', 'Армения', '1981-07-29'), ('Ольга','Олина', 'Республика Беларусь', '2001-01-17'), 
--        ('Михаил','Мишин', 'Польша', '1998-09-14'), ('Альберт','Альберто', 'Франция', '1965-08-04'),
--        ('Ирина','Иринина', 'Франция', '1974-07-07'),('Августа','Август', 'Польша', '1976-09-17')

--INSERT INTO dbo.Books([Name], [AuthorId], [Year])
-- VALUES ('О Иване №1', (SELECT id FROM Authors WHERE FirstName = 'Иван' AND LastName = 'Иванов' AND Country =  'Россия'), 1960), 
--        ('О Иване №2', (SELECT id FROM Authors WHERE FirstName = 'Иван' AND LastName = 'Иванов' AND Country =  'Россия'), 1971), 
--        ('О Иване №3', (SELECT id FROM Authors WHERE FirstName = 'Иван' AND LastName = 'Иванов' AND Country =  'Россия'), 1972),
--        ('О Сергее №1',(SELECT id FROM Authors WHERE FirstName = 'Сергей' AND LastName = 'Сергеев' AND Country =  'Казахстан'), 2017), 
--        ('О Сергее №2', (SELECT id FROM Authors WHERE FirstName = 'Сергей' AND LastName = 'Сергеев' AND Country =  'Казахстан'), 2017), 
--        ('О Сергее №3', (SELECT id FROM Authors WHERE FirstName = 'Сергей' AND LastName = 'Сергеев' AND Country =  'Казахстан'), 2021),
--        ('О Елене №1', (SELECT id FROM Authors WHERE FirstName = 'Елена' AND LastName = 'Ленина' AND Country =  'Казахстан'), 2004), 
--        ('О Елене №2', (SELECT id FROM Authors WHERE FirstName = 'Елена' AND LastName = 'Ленина' AND Country =  'Казахстан'), 2005), 
--        ('О Елене №3', (SELECT id FROM Authors WHERE FirstName = 'Елена' AND LastName = 'Ленина' AND Country =  'Казахстан'), 2005),
--        ('О Светлане №1', (SELECT id FROM Authors WHERE FirstName = 'Светлана' AND LastName = 'Светина' AND Country =  'Россия'), 1998), 
--        ('О Светлане №2', (SELECT id FROM Authors WHERE FirstName = 'Светлана' AND LastName = 'Светина' AND Country =  'Россия'), 2008), 
--        ('О Светлане №3', (SELECT id FROM Authors WHERE FirstName = 'Светлана' AND LastName = 'Светина' AND Country =  'Россия'), 2009),
--        ('О Петре №1', (SELECT id FROM Authors WHERE FirstName = 'Петр' AND LastName = 'Петров' AND Country =  'Республика Беларусь'), 2017), 
--        ('О Петре №2', (SELECT id FROM Authors WHERE FirstName = 'Петр' AND LastName = 'Петров' AND Country =  'Республика Беларусь'), 2021), 
--        ('О Петре №3', (SELECT id FROM Authors WHERE FirstName = 'Петр' AND LastName = 'Петров' AND Country =  'Республика Беларусь'), 2022),
--        ('О Егоре №1', (SELECT id FROM Authors WHERE FirstName = 'Егор' AND LastName = 'Егоров' AND Country =  'Армения'), 1944), 
--        ('О Егоре №2', (SELECT id FROM Authors WHERE FirstName = 'Егор' AND LastName = 'Егоров' AND Country =  'Армения'), 1944), 
--        ('О Егоре №3', (SELECT id FROM Authors WHERE FirstName = 'Егор' AND LastName = 'Егоров' AND Country =  'Армения'), 1960),
--        ('О Наталье №1', (SELECT id FROM Authors WHERE FirstName = 'Наталья' AND LastName = 'Наташина' AND Country =  'Армения'), 2002), 
--        ('О Наталье №2',  (SELECT id FROM Authors WHERE FirstName = 'Наталья' AND LastName = 'Наташина' AND Country =  'Армения'), 2007), 
--        ('О Наталье №3',  (SELECT id FROM Authors WHERE FirstName = 'Наталья' AND LastName = 'Наташина' AND Country =  'Армения'), 2009),
--        ('О Ольге №1',  (SELECT id FROM Authors WHERE FirstName = 'Ольга' AND LastName = 'Олина' AND Country =  'Республика Беларусь'), 2022), 
--        ('О Ольге №2', (SELECT id FROM Authors WHERE FirstName = 'Ольга' AND LastName = 'Олина' AND Country =  'Республика Беларусь'), 2022), 
--        ('О Ольге №3', (SELECT id FROM Authors WHERE FirstName = 'Ольга' AND LastName = 'Олина' AND Country =  'Республика Беларусь'), 2022),
--        ('О Михаиле №1', (SELECT id FROM Authors WHERE FirstName = 'Михаил' AND LastName = 'Мишин' AND Country =  'Польша'), 2021), 
--        ('О Михаиле №2', (SELECT id FROM Authors WHERE FirstName = 'Михаил' AND LastName = 'Мишин' AND Country =  'Польша'), 2021), 
--        ('О Михаиле №3', (SELECT id FROM Authors WHERE FirstName = 'Михаил' AND LastName = 'Мишин' AND Country =  'Польша'), 2022),
--        ('О Альберте №1', (SELECT id FROM Authors WHERE FirstName = 'Альберт' AND LastName = 'Альберто' AND Country =  'Франция'), 2005), 
--        ('О Альберте №2', (SELECT id FROM Authors WHERE FirstName = 'Альберт' AND LastName = 'Альберто' AND Country =  'Франция'), 2008), 
--        ('О Альберте №3', (SELECT id FROM Authors WHERE FirstName = 'Альберт' AND LastName = 'Альберто' AND Country =  'Франция'), 2011),
--        ('О Ирине №1', (SELECT id FROM Authors WHERE FirstName = 'Ирина' AND LastName = 'Иринина' AND Country =  'Франция'), 1997), 
--        ('О Ирине №2', (SELECT id FROM Authors WHERE FirstName = 'Ирина' AND LastName = 'Иринина' AND Country =  'Франция'), 1999), 
--        ('О Ирине №3', (SELECT id FROM Authors WHERE FirstName = 'Ирина' AND LastName = 'Иринина' AND Country =  'Франция'), 2001),
--        ('О Августе №1', (SELECT id FROM Authors WHERE FirstName = 'Августа' AND LastName = 'Август' AND Country =  'Польша'), 2009), 
--        ('О Августе №2', (SELECT id FROM Authors WHERE FirstName = 'Августа' AND LastName = 'Август' AND Country =  'Польша'), 2010), 
--        ('О Августе №3', (SELECT id FROM Authors WHERE FirstName = 'Августа' AND LastName = 'Август' AND Country =  'Польша'), 2011)


--INSERT INTO USERS([FirstName], [LastName], [Email], [BirthDate], [Address])
--  VALUES ('Иван','Петров','Petrov@mail.ru','2001-03-11','г. Минск, ул.Ародромная, д.5 - кв.7'),
--         ('Елизар','Сильвестров','Silva@mail.ru','1951-08-01','г. Минск, ул.Красная, д.35 - кв.27'),
--         ('Елена','Сидорова','Elena@mail.com','1984-07-17','г. Дзержинск, Минский район, ул.Полевая, д.14 - кв.77'),
--         ('Светлана','Светличная', 'Svet@mail.ru','1998-07-07','пос. Ждановичи, улЦветочная, д.99 - кв.2')

----ЧТОБЫ НЕ ЗАПОЛНЯТЬ ВРУЧНУЮ, СЧИТАЕМ, ЧТО ПРОПУСКОВ ПО ID В ТАБЛИЦАХ НЕТ
--DECLARE @CountBooks SMALLINT = (SELECT COUNT(id) FROM dbo.Books)
--DECLARE @CountUsers SMALLINT = (SELECT COUNT(id) FROM dbo.USERS)
--DECLARE @NumbUser SMALLINT = 1
--WHILE @CountBooks > 0 
-- BEGIN
--   INSERT INTO dbo.UserBooks(UserId, BookId)
--    VALUES (@NumbUser, @CountBooks)
--   SET @CountBooks = @CountBooks - 1
--   SET @NumbUser = @NumbUser+1
--   IF @NumbUser > @CountUsers SET @NumbUser = 1
-- END

 ----Помните, что юзер может и не иметь книг, но он тоже должен быть включён в выборку.
 --INSERT INTO USERS([FirstName], [LastName], [Email], [BirthDate], [Address])
 -- VALUES ('Иоан','Ионов','Ionov@mail.ru','2002-05-17','г. Минск, ул.Пушкина, д.12 - кв.23'),
 --        ('Илона','Красивая','Krasa@mail.com','1997-11-09','г. Минск, ул.Красная, д.35 - кв.27'),
 --        ('Яков','Яковлев','Jiakov@mail.com','1993-03-03','г. Минск, ул.Зеленая, д.7 - кв.35'),
 --        ('Семен','Горбунков','Gorb@mail.com','1987-12-17','г. Минск, ул.Красноармейцев, д.35 - кв.27')
 
 
 ----CONCAT(T4.FirstName,' ',T4.LastName) AS AuthorFullName НА 2008 НЕ РАБОТАЕТ. ТОЛЬКО С 2012
 --GO
 --CREATE VIEW dbo.UsersInfo AS
 --  SELECT T1.[Id] as [UserId], T1.[FirstName]+' '+T1.[LastName] AS [UserFullName],
 --         T1.[Age] AS [UserAge], T1.Email,
 --         T4.FirstName+' '+T4.LastName AS [AuthorFullName],         
 --         T3.id AS BooksId, T3.[Name] AS [BookName], T3.[Year] AS [Year]
 --    FROM dbo.[Users] T1
 --     LEFT JOIN dbo.[UserBooks] T2 ON
 --             T2.[UserId] = T1.[Id]
 --     LEFT JOIN dbo.[Books] T3 ON
 --             T3.[id] = T2.[BookId]
 --     LEFT JOIN dbo.Authors T4 ON
 --             T4.id = T3.AuthorId
 --GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

--CREATE  PROCEDURE DBO.DeleteUsersByExpiredDate
--AS
--BEGIN
--  DELETE FROM dbo.Users
--    WHERE CAST(CONVERT(VARCHAR(10), ExpiredDate, 23) AS DATETIME) < 
--          CAST(CONVERT(VARCHAR(10), GETDATE(), 23) AS DATETIME) AND
--          (SELECT COUNT(T2.id) FROM dbo.UserBooks T2 
--            WHERE T2.UserId = dbo.Users.Id)=0
  
--  DECLARE @Message VARCHAR(500)
--  DECLARE @Fio VARCHAR(150)
--  DECLARE UsersWithBook CURSOR FOR 
--  SELECT DISTINCT V1.UserFullName
--   FROM dbo.UsersInfo V1
--    WHERE V1.Email IN (SELECT T1.Email 
--                         FROM dbo.Users T1 
--                         WHERE CAST(CONVERT(VARCHAR(10), ExpiredDate, 23) AS DATETIME) < 
--                               CAST(CONVERT(VARCHAR(10), GETDATE(), 23) AS DATETIME) AND
--                               (SELECT COUNT(T2.id) FROM dbo.UserBooks T2 
--                                WHERE T2.UserId = T1.Id)>0)
   
--   OPEN UsersWithBook  
--   FETCH NEXT FROM UsersWithBook INTO @Fio  
--   WHILE @@FETCH_STATUS = 0  
--    BEGIN  
  
--        SET @message = @Fio + ' на руках имеются книги'  
--        PRINT @message  
--        FETCH NEXT FROM UsersWithBook INTO @Fio 
--        END  
  
--    CLOSE UsersWithBook 
--    DEALLOCATE UsersWithBook 
--END
--GO

   
 --CREATE PROCEDURE dbo.GiveBookToUser
 --  @Email NVARCHAR(50), 
 --  @FirstName NVARCHAR(150), 
 --  @LastName NVARCHAR(150), 
 --  @BookName NVARCHAR(200)
 -- AS                                   
 --BEGIN
 --  DECLARE @sError NVARCHAR(500) = ''
 --  --В 2008 НЕТ ЕЩЕ EXISTS
 --  DECLARE @CountToUser SMALLINT  = (
 --       SELECT COUNT(T1.[UserId]) 
 --         FROM dbo.UsersInfo T1
 --          WHERE T1.Email = @Email AND UPPER(T1.BookName) = UPPER(@BookName) AND
 --                REPLACE(UPPER(T1.AuthorFullName), ' ', '') = UPPER(@FirstName+@LastName)
 --                                    )
 --  IF @CountToUser >0
 --   SET @sError = 'ТАКАЯ КНИГА УЖЕ ВЫДАНА ДАННОМУ ПОЛЬЗОВАТЕЛЮ' 
 --  IF LEN(@sError) = 0 
 --   BEGIN                   
 --     DECLARE @CountToOtherUser SMALLINT = (
 --       SELECT COUNT(T1.[UserId]) 
 --         FROM dbo.UsersInfo T1
 --          WHERE T1.Email <> @Email AND UPPER(T1.BookName) = UPPER(@BookName) AND
 --                REPLACE(UPPER(T1.AuthorFullName), ' ', '') = UPPER(@FirstName+@LastName)
 --                                           )  
 --       IF @CountToOtherUser > 0                                     
 --         SET @sError = 'ТАКАЯ КНИГА УЖЕ ВЫДАНА ДРУГОМУ ПОЛЬЗОВАТЕЛЮ' 
 --   END
 --   IF  LEN(@sError) = 0
 --    BEGIN
 --      DECLARE @CountBook SMALLINT = (
 --        SELECT COUNT(T1.id) 
 --          FROM dbo.Books T1
 --           LEFT JOIN dbo.Authors T2 ON
 --                 T2.id = T1.AuthorId
 --           WHERE UPPER(T1.Name) = UPPER(@BookName) AND
 --                 T2.FirstName = @FirstName AND T2.LastName = @LastName
 --                                    )
 --        IF @CountBook = 0
 --          SET @sError = 'ИСКОМОЙ КНИГИ НЕ СУЩЕСТВУЕТ'
 --    END
 --    IF LEN(@sError) = 0
 --     BEGIN
 --      DECLARE @idUser BIGINT = (SELECT id FROM dbo.Users WHERE Email = @Email)
 --      DECLARE @idAuthor BIGINT = (SELECT T1.id 
 --                                    FROM dbo.Books T1
 --                                       LEFT JOIN dbo.Authors T2 ON
 --                                          T2.id = T1.AuthorId
 --                                   WHERE UPPER(T1.Name) = UPPER(@BookName) AND
 --                                         UPPER(T2.FirstName) = UPPER(@FirstName) AND
 --                                         UPPER(T2.LastName) = UPPER(@LastName)
 --                                  )
 --      INSERT INTO dbo.UserBooks(UserId, BookId)
 --        VALUES(@idUser, @idAuthor)  
 --     END
 --     ELSE PRINT @sError
 --END


--ALTER TABLE dbo.[UserBooks] ADD ToCharge NUMERIC(20,2)

--CREATE FUNCTION DBO.GetCharge(
--    @DateCreateUserBooks DATETIME,
--    @DateNow DATETIME, 
--    @CountDay SMALLINT)
--RETURNS NUMERIC(20,2)
--BEGIN
--    DECLARE @Peni NUMERIC(20,2)
    
--    SELECT @DateCreateUserBooks = CAST(CONVERT(VARCHAR(10), @DateCreateUserBooks, 23) AS DATETIME)
--    SELECT @DateNow = CAST(CONVERT(VARCHAR(10), @DateNow, 23) AS DATETIME)
--    SET @Peni =(DATEDIFF(DAY,@DateCreateUserBooks,@DateNow) - @CountDay)*2.7
--    IF @Peni<0 SET @Peni = 0
    
--    RETURN @Peni
--END
--GO


--CREATE PROCEDURE dbo.ChargeUser
--    @EmailUser VARCHAR(50),
--    @BookId BIGINT
--AS
--BEGIN
--   DECLARE @dStart DATETIME
--   DECLARE @dNow DATETIME = GETDATE()

--   UPDATE DBO.UserBooks
--    SET DBO.UserBooks.ToCharge = (SELECT LIBRARY.DBO.GetCharge(A.CreatedDate, @dNow, 60))
--     FROM
--        (
--        SELECT T.CreatedDate, T.BookId, T.UserId 
--         FROM dbo.UserBooks T
--          WHERE BookId = @BookId AND
--                UserId = (SELECT T1.Id FROM dbo.Users T1
--                       WHERE UPPER(T1.Email)=UPPER(@EmailUser))
--        ) A
--       WHERE DBO.UserBooks.UserId = A.UserId AND DBO.UserBooks.BookId = A.BookId
--END


--CREATE PROCEDURE dbo.ReturnBook
--  @EmailUser VARCHAR(50),
--  @FirstNameAuthor VARCHAR(150),
--  @LastNameAuthor VARCHAR(150),
--  @BookName VARCHAR(200)
--AS
--BEGIN
--  DECLARE @BookId BIGINT 
--  SET @BookId = (SELECT T2.id
--                    FROM dbo.Authors T1,
--                         dbo.Books T2
--                    WHERE T1.FirstName = @FirstNameAuthor AND
--                          T1.LastName = @LastNameAuthor AND
--                          T2.AuthorId = T1.id AND T2.Name = @BookName)
--  EXEC dbo.ChargeUser @EmailUser, @BookId
--  DECLARE @UserId BIGINT = (SELECT id FROM dbo.Users WHERE Email = @EmailUser)
--  DECLARE @Penia NUMERIC(20,2) = (SELECT ToCharge FROM dbo.UserBooks WHERE UserId = @UserId AND BookId = @BookId)
  
--  PRINT 'ПЕНЯ СОСТАВЛЯЕТ '+CAST(@Penia AS VARCHAR(20))
  
--  DELETE FROM dbo.UserBooks WHERE UserId = @UserId AND BookId = @BookId
  
--END
--GO


--SELECT * FROM dbo.UsersInfo
--ExpiredDate меньше текущей даты
--UPDATE dbo.Users SET ExpiredDate = GETDATE()-20 WHERE Id % 2 = 0
--SELECT * FROM dbo.UsersInfo
--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', 'Наталья', 'Наташина', 'О Наталье №2'
--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', 'Петр', 'Петров', 'О Петре №3'
--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', 'Петр', 'Петров', 'О GGG №3'
--INSERT INTO dbo.Authors([FirstName], [LastName], [Country], [BirthDate])
--  VALUES('Клоун','Цирковой', 'Россия', '1901-01-01')
--INSERT INTO dbo.Books([Name], [AuthorId], [Year])
-- VALUES ('В цирке', (SELECT id FROM Authors WHERE FirstName = 'Клоун' AND LastName = 'Цирковой' AND Country =  'Россия'), 1930)

--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', 'Клоун', 'Цирковой', 'В цирке'

--DECLARE @D1 DATETIME = GETDATE()-10
--DECLARE @D2 DATETIME = GETDATE()
--DECLARE @DayCount SMALLINT = 60
--SELECT LIBRARY.DBO.GetCharge(@D1, @D2, @DayCount)
--EXEC dbo.ChargeUser 'Petrov@mail.ru', 24
--EXEC dbo.DeleteUsersByExpiredDate 