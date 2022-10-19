--������ ��
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
--  VALUES('����','������', '������', '1940-01-01'), ('������','�������', '���������', '1992-03-07'), 
--        ('�����','������', '���������', '1984-07-08'), ('��������','�������', '������', '1976-12-30'), 
--        ('����','������', '���������� ��������', '1996-05-07'), ('����','������', '�������', '1914-05-25'),
--        ('�������','��������', '�������', '1981-07-29'), ('�����','�����', '���������� ��������', '2001-01-17'), 
--        ('������','�����', '������', '1998-09-14'), ('�������','��������', '�������', '1965-08-04'),
--        ('�����','�������', '�������', '1974-07-07'),('�������','������', '������', '1976-09-17')

--INSERT INTO dbo.Books([Name], [AuthorId], [Year])
-- VALUES ('� ����� �1', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '������'), 1960), 
--        ('� ����� �2', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '������'), 1971), 
--        ('� ����� �3', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '������'), 1972),
--        ('� ������ �1',(SELECT id FROM Authors WHERE FirstName = '������' AND LastName = '�������' AND Country =  '���������'), 2017), 
--        ('� ������ �2', (SELECT id FROM Authors WHERE FirstName = '������' AND LastName = '�������' AND Country =  '���������'), 2017), 
--        ('� ������ �3', (SELECT id FROM Authors WHERE FirstName = '������' AND LastName = '�������' AND Country =  '���������'), 2021),
--        ('� ����� �1', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '������' AND Country =  '���������'), 2004), 
--        ('� ����� �2', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '������' AND Country =  '���������'), 2005), 
--        ('� ����� �3', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '������' AND Country =  '���������'), 2005),
--        ('� �������� �1', (SELECT id FROM Authors WHERE FirstName = '��������' AND LastName = '�������' AND Country =  '������'), 1998), 
--        ('� �������� �2', (SELECT id FROM Authors WHERE FirstName = '��������' AND LastName = '�������' AND Country =  '������'), 2008), 
--        ('� �������� �3', (SELECT id FROM Authors WHERE FirstName = '��������' AND LastName = '�������' AND Country =  '������'), 2009),
--        ('� ����� �1', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '���������� ��������'), 2017), 
--        ('� ����� �2', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '���������� ��������'), 2021), 
--        ('� ����� �3', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '���������� ��������'), 2022),
--        ('� ����� �1', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '�������'), 1944), 
--        ('� ����� �2', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '�������'), 1944), 
--        ('� ����� �3', (SELECT id FROM Authors WHERE FirstName = '����' AND LastName = '������' AND Country =  '�������'), 1960),
--        ('� ������� �1', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '��������' AND Country =  '�������'), 2002), 
--        ('� ������� �2',  (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '��������' AND Country =  '�������'), 2007), 
--        ('� ������� �3',  (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '��������' AND Country =  '�������'), 2009),
--        ('� ����� �1',  (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '�����' AND Country =  '���������� ��������'), 2022), 
--        ('� ����� �2', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '�����' AND Country =  '���������� ��������'), 2022), 
--        ('� ����� �3', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '�����' AND Country =  '���������� ��������'), 2022),
--        ('� ������� �1', (SELECT id FROM Authors WHERE FirstName = '������' AND LastName = '�����' AND Country =  '������'), 2021), 
--        ('� ������� �2', (SELECT id FROM Authors WHERE FirstName = '������' AND LastName = '�����' AND Country =  '������'), 2021), 
--        ('� ������� �3', (SELECT id FROM Authors WHERE FirstName = '������' AND LastName = '�����' AND Country =  '������'), 2022),
--        ('� �������� �1', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '��������' AND Country =  '�������'), 2005), 
--        ('� �������� �2', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '��������' AND Country =  '�������'), 2008), 
--        ('� �������� �3', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '��������' AND Country =  '�������'), 2011),
--        ('� ����� �1', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '�������' AND Country =  '�������'), 1997), 
--        ('� ����� �2', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '�������' AND Country =  '�������'), 1999), 
--        ('� ����� �3', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '�������' AND Country =  '�������'), 2001),
--        ('� ������� �1', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '������' AND Country =  '������'), 2009), 
--        ('� ������� �2', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '������' AND Country =  '������'), 2010), 
--        ('� ������� �3', (SELECT id FROM Authors WHERE FirstName = '�������' AND LastName = '������' AND Country =  '������'), 2011)


--INSERT INTO USERS([FirstName], [LastName], [Email], [BirthDate], [Address])
--  VALUES ('����','������','Petrov@mail.ru','2001-03-11','�. �����, ��.����������, �.5 - ��.7'),
--         ('������','�����������','Silva@mail.ru','1951-08-01','�. �����, ��.�������, �.35 - ��.27'),
--         ('�����','��������','Elena@mail.com','1984-07-17','�. ���������, ������� �����, ��.�������, �.14 - ��.77'),
--         ('��������','����������', 'Svet@mail.ru','1998-07-07','���. ���������, �����������, �.99 - ��.2')

----����� �� ��������� �������, �������, ��� ��������� �� ID � �������� ���
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

 ----�������, ��� ���� ����� � �� ����� ����, �� �� ���� ������ ���� ������� � �������.
 --INSERT INTO USERS([FirstName], [LastName], [Email], [BirthDate], [Address])
 -- VALUES ('����','�����','Ionov@mail.ru','2002-05-17','�. �����, ��.�������, �.12 - ��.23'),
 --        ('�����','��������','Krasa@mail.com','1997-11-09','�. �����, ��.�������, �.35 - ��.27'),
 --        ('����','�������','Jiakov@mail.com','1993-03-03','�. �����, ��.�������, �.7 - ��.35'),
 --        ('�����','���������','Gorb@mail.com','1987-12-17','�. �����, ��.��������������, �.35 - ��.27')
 
 
 ----CONCAT(T4.FirstName,' ',T4.LastName) AS AuthorFullName �� 2008 �� ��������. ������ � 2012
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
  
--        SET @message = @Fio + ' �� ����� ������� �����'  
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
 --  --� 2008 ��� ��� EXISTS
 --  DECLARE @CountToUser SMALLINT  = (
 --       SELECT COUNT(T1.[UserId]) 
 --         FROM dbo.UsersInfo T1
 --          WHERE T1.Email = @Email AND UPPER(T1.BookName) = UPPER(@BookName) AND
 --                REPLACE(UPPER(T1.AuthorFullName), ' ', '') = UPPER(@FirstName+@LastName)
 --                                    )
 --  IF @CountToUser >0
 --   SET @sError = '����� ����� ��� ������ ������� ������������' 
 --  IF LEN(@sError) = 0 
 --   BEGIN                   
 --     DECLARE @CountToOtherUser SMALLINT = (
 --       SELECT COUNT(T1.[UserId]) 
 --         FROM dbo.UsersInfo T1
 --          WHERE T1.Email <> @Email AND UPPER(T1.BookName) = UPPER(@BookName) AND
 --                REPLACE(UPPER(T1.AuthorFullName), ' ', '') = UPPER(@FirstName+@LastName)
 --                                           )  
 --       IF @CountToOtherUser > 0                                     
 --         SET @sError = '����� ����� ��� ������ ������� ������������' 
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
 --          SET @sError = '������� ����� �� ����������'
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
  
--  PRINT '���� ���������� '+CAST(@Penia AS VARCHAR(20))
  
--  DELETE FROM dbo.UserBooks WHERE UserId = @UserId AND BookId = @BookId
  
--END
--GO


--SELECT * FROM dbo.UsersInfo
--ExpiredDate ������ ������� ����
--UPDATE dbo.Users SET ExpiredDate = GETDATE()-20 WHERE Id % 2 = 0
--SELECT * FROM dbo.UsersInfo
--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', '�������', '��������', '� ������� �2'
--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', '����', '������', '� ����� �3'
--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', '����', '������', '� GGG �3'
--INSERT INTO dbo.Authors([FirstName], [LastName], [Country], [BirthDate])
--  VALUES('�����','��������', '������', '1901-01-01')
--INSERT INTO dbo.Books([Name], [AuthorId], [Year])
-- VALUES ('� �����', (SELECT id FROM Authors WHERE FirstName = '�����' AND LastName = '��������' AND Country =  '������'), 1930)

--EXEC dbo.GiveBookToUser 'Petrov@mail.ru', '�����', '��������', '� �����'

--DECLARE @D1 DATETIME = GETDATE()-10
--DECLARE @D2 DATETIME = GETDATE()
--DECLARE @DayCount SMALLINT = 60
--SELECT LIBRARY.DBO.GetCharge(@D1, @D2, @DayCount)
--EXEC dbo.ChargeUser 'Petrov@mail.ru', 24
--EXEC dbo.DeleteUsersByExpiredDate 