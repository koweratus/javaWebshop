USE [master]
GO
/****** Object:  Database [WebShop]    Script Date: 4/17/2020 10:21:17 PM ******/
CREATE DATABASE [WebShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WebShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WebShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebShop] SET  MULTI_USER 
GO
ALTER DATABASE [WebShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebShop] SET QUERY_STORE = OFF
GO
USE [WebShop]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[IDBill] [int] IDENTITY(1,1) NOT NULL,
	[BillDate] [nvarchar](50) NULL,
	[CustomerID] [int] NULL,
	[PaymentMethodID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[IDCategory] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[IDCustomer] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Adress] [nvarchar](100) NULL,
	[Email] [nvarchar](30) NULL,
	[CustomerPassword] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[IDItem] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[BillID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogInfo]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogInfo](
	[IDLogInfo] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[LogDate] [nvarchar](50) NULL,
	[IPAdress] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDLogInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[IDPaymentMethod] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPaymentMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IDProduct] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[Brand] [nvarchar](40) NULL,
	[About] [nvarchar](300) NULL,
	[Price] [float] NULL,
	[Img] [nvarchar](200) NULL,
	[CatgoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([IDCustomer])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethod] ([IDPaymentMethod])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([BillID])
REFERENCES [dbo].[Bill] ([IDBill])
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([IDProduct])
GO
ALTER TABLE [dbo].[LogInfo]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([IDCustomer])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CatgoryID])
REFERENCES [dbo].[Category] ([IDCategory])
GO
/****** Object:  StoredProcedure [dbo].[CHECK_CUSTOMER]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CHECK_CUSTOMER]
@email nvarchar(50)
as
select count(*) from Customer
where  Email =@email
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_BILLS]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************/
/**********************B I L L**********************/
/***************************************************/
CREATE PROC [dbo].[GET_ALL_BILLS]
as
select*from Bill
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_CATEGORY]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************/
/*****************C A T E G O R Y*******************/
/***************************************************/
CREATE PROC [dbo].[GET_ALL_CATEGORY]
as
select*from Category
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_CUSTOMERS]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GET_ALL_CUSTOMERS]
as
select IDCustomer,FirstName,LastName,Adress,Email,CustomerPassword from Customer
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_LOGINFO]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***************************************************/
/*****************L O G   I N F O*******************/
/***************************************************/
CREATE PROC [dbo].[GET_ALL_LOGINFO]
as
select*from LogInfo
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_PAYMENT_METHODS]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************/
/******************P A Y M E N T********************/
/*******************M E T H O D*********************/
/***************************************************/
CREATE PROC [dbo].[GET_ALL_PAYMENT_METHODS]
as
select*from PaymentMethod
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_PRODUCTS]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************/
/******************P R O D U C T********************/
/***************************************************/
CREATE PROC [dbo].[GET_ALL_PRODUCTS]
as
select*from Product
GO
/****** Object:  StoredProcedure [dbo].[GET_BILL]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_BILL]
@id int
as
select*from Bill
where IDBill=@id
GO
/****** Object:  StoredProcedure [dbo].[GET_BILLS_FOR_CUSTOMER]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_BILLS_FOR_CUSTOMER]
@id int
as
select*from Bill
where CustomerID=@id
GO
/****** Object:  StoredProcedure [dbo].[GET_CUSTOMER]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GET_CUSTOMER]
@id int
as
select*from Customer
where IDCustomer=@id
GO
/****** Object:  StoredProcedure [dbo].[GET_ITEMS_FOR_BILL]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***************************************************/
/**********************I T E M**********************/
/***************************************************/
CREATE PROC [dbo].[GET_ITEMS_FOR_BILL]
@billID int
as
select*from Item
where BillID=@billID
GO
/****** Object:  StoredProcedure [dbo].[GET_PRODUCT]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
CREATE PROC INSERT_PRODUCT
@Title nvarchar(30),
@Brand nvarchar(40),
@About nvarchar(300),
@Price float,
@Img nvarchar(200),
@CatgoryID int
as
Insert into Product(Title,Brand,About,Price,Img,CatgoryID)
Value(@Title,@Brand,@About,@Price,@Img,@CatgoryID)
go
*/

CREATE PROC [dbo].[GET_PRODUCT]
@id int
as
select IDProduct, Title, Brand, About, Price, Img, CatgoryID from Product
where IDProduct=@id
GO
/****** Object:  StoredProcedure [dbo].[INSERT_BILL]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[INSERT_BILL]
@BillDate date,
@CustomerID int,
@PaymentMethodID int,
@id int output
as
Insert into Bill(BillDate,CustomerID,PaymentMethodID)
Values(@BillDate,@CustomerID,@PaymentMethodID);
select @id=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[INSERT_CUSTOMER]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*******   P R O C E D U R E S   ********/
/*
CUSTOMER
	INSERT_CUSTOMER
	GET_ALL_CUSTOMERS
	GET_CUSTOMER
CATEGORY
	GET_ALL_CATEGORY
PRODUCT
	GET_ALL_PRODUCTS
	GET_PRODUCT
PAYMENT METHOD
	GET_ALL_PAYMENT_METHODS
BILL
	GET_ALL_BILLS
	INSERT_BILL
	GET_BILL
	GET_BILLS_FOR_CUSTOMER
ITEM
	GET_ITEMS_FOR_BILL
	INSERT_ITEM
LOG INFO
	GET_ALL_LOGINFO
	INSERT_LOGINFO
*/

/***************************************************/
/*****************C U S T O M E R*******************/
/***************************************************/

CREATE PROC [dbo].[INSERT_CUSTOMER]
@FirstName nvarchar(30),
@LastName nvarchar(30),
@Adress nvarchar(100),
@Email nvarchar(30),
@CustomerPassword nvarchar(30)
as
Insert into Customer(FirstName,LastName,Adress,Email,CustomerPassword)
Values(@FirstName,@LastName,@Adress,@Email,@CustomerPassword)
GO
/****** Object:  StoredProcedure [dbo].[INSERT_ITEM]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[INSERT_ITEM]
@ProductID int,
@BillID int,
@Quantity int
as
Insert into Item(ProductID,BillID,Quantity)
Values(@ProductID,@BillID,@Quantity)
GO
/****** Object:  StoredProcedure [dbo].[INSERT_LOGINFO]    Script Date: 4/17/2020 10:21:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[INSERT_LOGINFO]
@CustomerID int,
@LogDate nvarchar(50),
@IPAdress nvarchar(300)
as
Insert into LogInfo(CustomerID,LogDate,IPAdress)
Values(@CustomerID,@LogDate,@IPAdress)
GO
USE [master]
GO
ALTER DATABASE [WebShop] SET  READ_WRITE 
GO
