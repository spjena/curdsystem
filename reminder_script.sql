USE [master]
GO
/****** Object:  Database [Reminder]    Script Date: 09/13/2018 19:47:41 ******/
CREATE DATABASE [Reminder] ON  PRIMARY 
( NAME = N'Reminder', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Reminder.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Reminder_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Reminder_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Reminder] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reminder].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Reminder] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Reminder] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Reminder] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Reminder] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Reminder] SET ARITHABORT OFF
GO
ALTER DATABASE [Reminder] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Reminder] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Reminder] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Reminder] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Reminder] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Reminder] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Reminder] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Reminder] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Reminder] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Reminder] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Reminder] SET  DISABLE_BROKER
GO
ALTER DATABASE [Reminder] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Reminder] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Reminder] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Reminder] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Reminder] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Reminder] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Reminder] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Reminder] SET  READ_WRITE
GO
ALTER DATABASE [Reminder] SET RECOVERY FULL
GO
ALTER DATABASE [Reminder] SET  MULTI_USER
GO
ALTER DATABASE [Reminder] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Reminder] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Reminder', N'ON'
GO
USE [Reminder]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/13/2018 19:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1000,1) NOT NULL,
	[Username] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (1000, N'Admin', N'admin123')
INSERT [dbo].[Users] ([Id], [Username], [Password]) VALUES (1001, N'Company', N'admin123')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[ReminderData]    Script Date: 09/13/2018 19:47:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReminderData](
	[RemId] [bigint] IDENTITY(1000,1) NOT NULL,
	[ReminderText] [nvarchar](max) NULL,
	[UserId] [bigint] NULL,
	[ReminderDate] [datetime] NULL,
 CONSTRAINT [PK_ReminderData] PRIMARY KEY CLUSTERED 
(
	[RemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ReminderData] ON
INSERT [dbo].[ReminderData] ([RemId], [ReminderText], [UserId], [ReminderDate]) VALUES (1007, N'Test Reminder edited', 1000, CAST(0x0000A95A00000000 AS DateTime))
INSERT [dbo].[ReminderData] ([RemId], [ReminderText], [UserId], [ReminderDate]) VALUES (1008, N'Test Reminder', 1000, CAST(0x0000A95A00000000 AS DateTime))
INSERT [dbo].[ReminderData] ([RemId], [ReminderText], [UserId], [ReminderDate]) VALUES (1009, N'Test Reminder', 1000, CAST(0x0000A95A00000000 AS DateTime))
INSERT [dbo].[ReminderData] ([RemId], [ReminderText], [UserId], [ReminderDate]) VALUES (1010, N'Test tomorrow', 1000, CAST(0x0000A95B00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[ReminderData] OFF
/****** Object:  ForeignKey [FK_ReminderData_ReminderData]    Script Date: 09/13/2018 19:47:42 ******/
ALTER TABLE [dbo].[ReminderData]  WITH CHECK ADD  CONSTRAINT [FK_ReminderData_ReminderData] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReminderData] CHECK CONSTRAINT [FK_ReminderData_ReminderData]
GO
