USE MASTER
GO
CREATE DATABASE Members
GO

USE [Members]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/13/2024 12:49:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Pass] [varchar](20) NOT NULL,
	[Firstname] [varchar](20) NOT NULL,
	[Lastname] [varchar](20) NOT NULL,
	[Visits] [int] NOT NULL,
	[LastVisit] [date] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([AccountID], [Username], [Pass], [Firstname], [Lastname], [Visits], [LastVisit]) VALUES (1, N'dhagen', N'CentraliaIT', N'Dan', N'Hagen', 1, CAST(N'2024-03-13' AS Date))
GO
INSERT [dbo].[Accounts] ([AccountID], [Username], [Pass], [Firstname], [Lastname], [Visits], [LastVisit]) VALUES (2, N'gjetson', N'C#Rocks!', N'George', N'Jetson', 0, CAST(N'2024-03-12' AS Date))
GO
INSERT [dbo].[Accounts] ([AccountID], [Username], [Pass], [Firstname], [Lastname], [Visits], [LastVisit]) VALUES (3, N'fflintstone', N'StoneAge!', N'Fred', N'Flintstone', 0, CAST(N'2024-03-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_Visits]  DEFAULT ((0)) FOR [Visits]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Accounts_LastVisit]  DEFAULT (getdate()) FOR [LastVisit]
GO
/****** Object:  StoredProcedure [dbo].[LogIn]    Script Date: 3/13/2024 12:49:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[LogIn]
@Username	VARCHAR(20),
@Password	VARCHAR(20),
@Visits		INT OUTPUT,
@LastVisit	DATE OUTPUT
AS
BEGIN
	DECLARE @Found	INT
	DECLARE @ID		INT
	SELECT @ID = AccountID FROM Accounts 
	WHERE Username=@Username AND Pass = @Password

	SELECT AccountID, Username, Pass FROM Accounts 
	WHERE Username=@Username AND Pass = @Password

	SET @Found = @@ROWCOUNT
	SELECT @Found

	UPDATE accounts set Visits = Visits+1, LastVisit= GETDATE() 
	WHERE AccountID=@ID

	SELECT @LastVisit= LastVisit, @Visits = Visits FROM Accounts
	WHERE AccountID=@ID

END
GO
