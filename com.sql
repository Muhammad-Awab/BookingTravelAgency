USE [master]
GO
/****** Object:  Database [competetion]    Script Date: 12/9/2023 9:28:27 PM ******/
CREATE DATABASE [competetion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'competetion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\competetion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'competetion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\competetion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [competetion] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [competetion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [competetion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [competetion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [competetion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [competetion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [competetion] SET ARITHABORT OFF 
GO
ALTER DATABASE [competetion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [competetion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [competetion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [competetion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [competetion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [competetion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [competetion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [competetion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [competetion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [competetion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [competetion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [competetion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [competetion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [competetion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [competetion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [competetion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [competetion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [competetion] SET RECOVERY FULL 
GO
ALTER DATABASE [competetion] SET  MULTI_USER 
GO
ALTER DATABASE [competetion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [competetion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [competetion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [competetion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [competetion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [competetion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'competetion', N'ON'
GO
ALTER DATABASE [competetion] SET QUERY_STORE = ON
GO
ALTER DATABASE [competetion] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [competetion]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[Shipment_From] [nvarchar](50) NULL,
	[Shipment_To] [nvarchar](50) NULL,
	[Company_Name] [nvarchar](50) NULL,
	[Shipment_Weight] [int] NULL,
	[Shipment_Date] [date] NULL,
	[UserID] [int] NULL,
	[ShipmentStatus] [bit] NULL,
 CONSTRAINT [PK__Shipment__5CAD378D2FD9600C] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteShipment]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeleteShipment]
    @ShipmentID INT
AS
BEGIN
    DELETE FROM Shipment WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllShipments]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetAllShipments]
AS
BEGIN
    SELECT * FROM Shipment;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_GetShipmentByID]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetShipmentByID]
    @ShipmentID INT
AS
BEGIN
    SELECT * FROM Shipment WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertShipment]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertShipment]
    @Shipment_From NVARCHAR(50) ,
	@Shipment_To NVARCHAR(50),
	@Company_Name NVARCHAR(50),
	@Shipment_Weight INT ,
	@Shipment_Date nvarchar(50),
	@UserID INT
AS
BEGIN
    INSERT INTO Shipment (Shipment_From, Shipment_To, Company_Name,Shipment_Weight,Shipment_Date,UserID,ShipmentStatus)
    VALUES (@Shipment_From, @Shipment_To, @Company_Name,@Shipment_Weight,@Shipment_Date,@UserID,0);
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateShipment]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateShipment]
    @ShipmentID INT,
    @Shipment_From NVARCHAR(50) ,
	@Shipment_To NVARCHAR(50),
	@Company_Name NVARCHAR(50),
	@Shipment_Weight INT ,
	@Shipment_Date nvarchar(50),
	@UserID INT
AS
BEGIN
    UPDATE Shipment
    SET Shipment_From = @Shipment_From, Shipment_To = @Shipment_To, Company_Name = @Company_Name,Shipment_Weight = @Shipment_Weight, Shipment_Date = @Shipment_Date, UserID = @UserID
    WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStatus]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_UpdateStatus]
    @ShipmentID INT,
    @ShipmentStatus bit 

AS
BEGIN
    UPDATE Shipment
    SET ShipmentStatus = @ShipmentStatus
    WHERE ShipmentID = @ShipmentID;
END;
GO
/****** Object:  StoredProcedure [dbo].[U_SP_GetUserByName]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[U_SP_GetUserByName]
@Email nvarchar(50)
as
begin
select * from UserInfo
where 
Email =@Email
end
GO
/****** Object:  StoredProcedure [dbo].[U_SP_SaveSignUp]    Script Date: 12/9/2023 9:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[U_SP_SaveSignUp]
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50),
@Password nvarchar(50),
@ContactNo nvarchar(50),
@City nvarchar(50),
@Gender nvarchar(50),
@Role nvarchar(50)
as
begin
Insert into UserInfo (FirstName,LastName,Email,Password,ContactNo,City,Gender,Role) values (@FirstName,@LastName,@Email,@Password,@ContactNo,@City,@Gender,@Role)
end
GO
USE [master]
GO
ALTER DATABASE [competetion] SET  READ_WRITE 
GO
