USE [master]
GO
/****** Object:  Database [Quiz System]    Script Date: 3/13/2023 6:33:40 PM ******/
CREATE DATABASE [Quiz System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quiz System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.GIABAO\MSSQL\DATA\Quiz System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quiz System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.GIABAO\MSSQL\DATA\Quiz System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Quiz System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quiz System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quiz System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quiz System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quiz System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quiz System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quiz System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quiz System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quiz System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quiz System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quiz System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quiz System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quiz System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quiz System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quiz System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quiz System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quiz System] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Quiz System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quiz System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quiz System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quiz System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quiz System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quiz System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quiz System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quiz System] SET RECOVERY FULL 
GO
ALTER DATABASE [Quiz System] SET  MULTI_USER 
GO
ALTER DATABASE [Quiz System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quiz System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quiz System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quiz System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quiz System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Quiz System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Quiz System', N'ON'
GO
ALTER DATABASE [Quiz System] SET QUERY_STORE = OFF
GO
USE [Quiz System]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[gmail] [varchar](30) NOT NULL,
	[phone] [varchar](15) NULL,
	[role] [int] NOT NULL,
	[address] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
	[img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[idAns] [int] IDENTITY(1,1) NOT NULL,
	[idQues] [int] NOT NULL,
	[isCorrect] [bit] NOT NULL,
	[answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Answer_1] PRIMARY KEY CLUSTERED 
(
	[idAns] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[userName] [varchar](50) NOT NULL,
	[idSub] [int] NOT NULL,
 CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[userName] ASC,
	[idSub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[publicDate] [date] NULL,
	[img] [nvarchar](max) NULL,
	[details] [nvarchar](max) NULL,
	[idAuthor] [varchar](50) NULL,
	[numberAccess] [int] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idSub] [int] NOT NULL,
	[question] [nvarchar](max) NOT NULL,
	[isPublic] [bit] NULL,
 CONSTRAINT [PK_Question_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](max) NOT NULL,
	[hyperlink] [nvarchar](max) NULL,
	[idAuthor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[img] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[publicDate] [date] NULL,
	[idAuthor] [varchar](50) NULL,
	[isPublic] [bit] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubType]    Script Date: 3/13/2023 6:33:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubType](
	[idSub] [int] NOT NULL,
	[idCate] [int] NOT NULL,
 CONSTRAINT [PK_SubType] PRIMARY KEY CLUSTERED 
(
	[idSub] ASC,
	[idCate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'admin', N'202cb962ac59075b964b07152d234b70', NULL, NULL, N'admin@gmail.com', NULL, 0, NULL, 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'dinhson133323', N'1234567', NULL, NULL, N'dinhson123@gmail.com', NULL, 1, NULL, 0, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'dinson', N'202cb962ac59075b964b07152d234b70', N'Dinh', N'Son', N'mm@gmail.com', N'', 1, N'123123', 1, N'mm')
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'expert', N'202cb962ac59075b964b07152d234b70', NULL, NULL, N'expert@gmail.com', NULL, 2, NULL, 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'linhchi', N'123', N'linh', N'chi', N'linhchi123@gmail.com', N'0123456', 1, NULL, 1, N'ffd')
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'maibui', N'1234', N'bui', N'mai', N'buimai910@gmail.com', N'0366585841', 1, NULL, 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'marketing', N'202cb962ac59075b964b07152d234b70', NULL, NULL, N'marketing@gmail.com', NULL, 3, NULL, 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'MhO2X4MM', N'k2p5gN5V', NULL, NULL, N'x5xWKCP8', N'1531970319', 2, N'GH6VDtLb', 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'qung', N'123', NULL, NULL, N'buimai91230@gmail.com', N'1234567890', 1, N'hanai', 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'student', N'202cb962ac59075b964b07152d234b70', N'Stu', N'Dent', N'student@gmail.com', N'', 1, N'Phu Tho', 1, N'http://drive.google.com/uc?export=view&id=1gkAgMT0C8g8JQgWqQp-pkjDPFySgLvJW')
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'Test123', N'Test123', NULL, NULL, N'Test123', N'Test123', 1, N'Test123', 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'trangiabao5102', N'202cb962ac59075b964b07152d234b70', NULL, NULL, N'trangiabao5102@gmail.com', NULL, 0, NULL, 1, NULL)
INSERT [dbo].[Account] ([userName], [password], [firstName], [lastName], [gmail], [phone], [role], [address], [isActive], [img]) VALUES (N'truongson ', N'12345', N'son', N'trung', N'truongson@gmail.com', N'02584625', 1, NULL, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (1, 1, 1, N'A. True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (2, 1, 0, N'B. Flase ')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (3, 2, 0, N'A. A user shall be able to use the online banking system securely')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (4, 2, 1, N'B. Activate a login session when a user logs in, and maintain the session for 60 minutes unless the user who logged in has been inactive for more than 120 seconds.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (5, 2, 1, N'C. At the time a query is made to check the current balance of a checking account, the owner of the checking account shall be logged in.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (6, 2, 0, N'D. The user shall be able to check the current balance of the checking accounts that he/she own.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (7, 3, 0, N'A. Requirement specification is a process to design the solution to the problem')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (8, 3, 0, N'B. Requirement specification is a process that identifies and specifies the problem and possible solutions to the problem.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (9, 3, 1, N'C. Requirement specification is a process to identify and specify the problem to solve.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (10, 3, 0, N'D. Requirement specification is a process of solving the requirements.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (11, 4, 0, N'A. Agile models')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (12, 4, 1, N'B. The Waterfall model')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (13, 5, 0, N'A. The V-model')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (14, 5, 0, N'B. The Waterfall model')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (15, 5, 1, N'C. Agile models')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (16, 6, 0, N'A. Wide, Requirement, Software, Planning and Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (17, 6, 1, N'B. World, Requirement, Specification, Program and Machine.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (18, 6, 0, N'C. None of the above.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (19, 7, 1, N'A. True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (20, 7, 0, N'B. False ')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (21, 8, 1, N'A. Specifications meet the requirements.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (22, 8, 0, N'B. Requirements meet specifications.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (23, 8, 0, N'C. None of the above.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (24, 10, 0, N'A. be created separately and can operate individually.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (25, 10, 0, N'B. have business value.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (26, 10, 0, N'C. be integrated with one another or with existing subsystems.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (27, 11, 1, N'A.True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (28, 11, 0, N'B.False')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (29, 12, 1, N'A. It helps organize the workforce and resources.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (30, 12, 0, N'B. It allows for parallelization in development.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (31, 12, 0, N'C. It helps build-or-buy decisions.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (32, 12, 0, N'D. It helps with funding decisions.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (33, 13, 1, N'A. Pipe-and-Filter Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (34, 13, 0, N'B. Event-based Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (35, 13, 0, N'C. Layered Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (36, 13, 0, N'D. Client-Server Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (37, 14, 0, N'A. Pipe-and-Filter Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (38, 14, 0, N'B. Blackboard Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (39, 14, 1, N'C. Client-Server Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (40, 14, 0, N'D. Event-based Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (41, 15, 0, N'A. Pipe-and-Filter Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (42, 15, 1, N'B. Blackboard Model.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (43, 16, 1, N'A. Subsystems can independently comprise the business logic by itself while modules can''t.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (44, 16, 0, N'B. Subsystems can communicate with other subsystems while modules cannot communicate with other modules.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (45, 16, 0, N'C. All of the above.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (46, 17, 0, N'A. Performance.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (47, 17, 0, N'B. Reliability.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (48, 17, 1, N'C. Testability.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (49, 17, 0, N'D. Security.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (50, 19, 0, N'A.True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (51, 19, 1, N'B.False')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (52, 20, 1, N'A. Accurately identifying user needs')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (53, 20, 0, N'B. Developing a Java program to meet the designed solution')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (54, 20, 0, N'C. Determining the accurate market price for the finished product')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (55, 20, 0, N'D. Testing the solution with users')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (56, 21, 0, N'A. A process, how the requirements are written (specified)')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (57, 21, 0, N'B. A product, a written specification of the requirements')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (58, 21, 1, N'C. Both')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (59, 22, 0, N'A. 0% of the total time spent on the project')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (60, 22, 1, N'B. 5-10% of the total time spent on the project')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (61, 22, 0, N'C. 20% of the total time spent on the project')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (62, 22, 0, N'D. The same amount as you expect to spend on testing')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (63, 23, 1, N'A. Requirements - user needs in user language; Specification - solution properties designed to solve problem')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (64, 23, 0, N'B. Requirements - solution properties designed to solve problem; Specification - user needs in user language')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (65, 24, 0, N'A. Allow an authorized user to post a message of no more than 136 characters to the Facebook POST API')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (66, 24, 0, N'B. Use the MariaDB database for internal data persistance')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (67, 24, 0, N'C. Retry posting the message up to 3 times every 5 minutes if the post is rejected by the server')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (68, 24, 0, N'D. Allow the user to post a message to Facebook')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (69, 25, 0, N'A. The messages between the client and server shall be in YAML 1.2 format.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (70, 25, 1, N'B. The user shall be able to select the course number.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (71, 25, 0, N'C. Communication between the client and server will be expressed in EBCDIC endoding.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (72, 25, 0, N'D. The developing team shall use the spiral model of software development lifecycle.')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (73, 26, 0, N'A. pipe-and-filter')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (74, 26, 0, N'B. layered')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (75, 26, 1, N'C. blackboard')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (76, 26, 0, N'D. event-based')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (77, 27, 0, N'A. client-server')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (78, 27, 0, N'B. event-based')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (79, 27, 1, N'C. pipe-and-filter')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (80, 27, 0, N'D. blackboard')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (81, 28, 0, N'A. layered')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (82, 28, 0, N'B. pipe-and-filter')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (83, 28, 1, N'C. client-server')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (84, 28, 0, N'D. blackboard')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (85, 29, 0, N'A. A set of classes which convert various values based on environment or parameter information')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (86, 29, 0, N'B. A class which represents the paying customer')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (87, 29, 1, N'C. A set of classes which generates reports')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (88, 29, 0, N'D. A class which provides a service (e.g. AccountCreationService)')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (89, 30, 1, N'A.False')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (90, 30, 0, N'B.True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (91, 31, 1, N'A.False')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (92, 31, 0, N'B.True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (93, 32, 1, N'A.True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (94, 32, 0, N'B.False')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (95, 33, 0, N'A.Fasle ')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (96, 33, 1, N'B.True')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (98, 1, 0, N'')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (99, 184, 0, N'á;dkjf')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (100, 184, 0, N'laksjdf')
GO
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (101, 184, 1, N'aklsjfd ')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (102, 184, 0, N'lkajsdf')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (103, 185, 1, N'update')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (104, 186, 0, N'lkasjdflk')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (105, 186, 1, N'laksdjfljkasd')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (106, 187, 1, N'updafs')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (107, 187, 0, N'lakjsdfjlks')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (108, 188, 0, N'lakdsjf')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (109, 188, 1, N'alksdfjkljaf')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (110, 188, 0, N'lkajsfd')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (111, 188, 0, N'kladsjflksdaf')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (112, 189, 1, N'wer')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (113, 189, 0, N'wrwq')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (114, 190, 1, N'afwerq')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (115, 190, 0, N'qwerqwe')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (116, 191, 0, N'1')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (117, 191, 1, N'2')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (118, 192, 0, N'1')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (119, 192, 0, N'2')
INSERT [dbo].[Answer] ([idAns], [idQues], [isCorrect], [answer]) VALUES (120, 192, 1, N'3')
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Công nghệ thông tin')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Kinh Doanh Quốc Tế')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Đồ Họa')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'AI')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'linhchi', 1)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'linhchi', 2)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'linhchi', 3)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'linhchi', 4)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'maibui', 2)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'maibui', 3)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'student', 1)
INSERT [dbo].[Enroll] ([userName], [idSub]) VALUES (N'student', 11)
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([id], [title], [publicDate], [img], [details], [idAuthor], [numberAccess]) VALUES (1, N'Luyện tập', CAST(N'2023-01-01' AS Date), NULL, N'Làm bài tập chăm chỉ mỗi ngày, bạn sẽ tiếp thu nhiều kiến thức mơi', N'maibui', 6)
INSERT [dbo].[Post] ([id], [title], [publicDate], [img], [details], [idAuthor], [numberAccess]) VALUES (2, N'Câu hỏi', CAST(N'2022-01-02' AS Date), N'https://play-lh.googleusercontent.com/2y0nslmQeGxBzCTcoaEZPSGkbAqWD4-5ESGUKAFSGatlNlVX1wL6aasMGCPEys_gRpw', N'Which of the following is NOT a good characteristic well written of a software requirements specification?

A. Ranked

B. Redundant

C. Consistent

D. Verifiable  . Có thể giải thích rõ giúp tôi câu này được không', N'linhchi', 3)
INSERT [dbo].[Post] ([id], [title], [publicDate], [img], [details], [idAuthor], [numberAccess]) VALUES (3, N'Thắc mắc', CAST(N'2022-03-04' AS Date), NULL, N'Name and explain types of testing.', N'truongson ', 2)
INSERT [dbo].[Post] ([id], [title], [publicDate], [img], [details], [idAuthor], [numberAccess]) VALUES (4, N'Thắc mắc', CAST(N'2022-05-06' AS Date), N'https://topicanative.edu.vn/wp-content/uploads/2020/08/nang-cap-von-tu-vung-tieng-anh-cuc-dinh-thong-qua-quiz-kiem-tra-2.jpg', N'What are components of a test case?', N'truongson', 4)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (1, 1, N'A constraint to only use Microsoft Project during the system development is a non-functional requirement.
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (2, 1, N'The following are requirements and specifications of an online banking service. Which of the following can be categorized as system specifications?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (3, 1, N'Which is the right description about the requirement specification process?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (4, 2, N'In which of the following software development models are the software development activities performed sequentially rather than in iterations?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (5, 2, N'Which of the following software development models can best respond to requirements changes?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (6, 2, N'WRSPM stands for:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (7, 2, N'Looking at the difference between user requirements and system specifications in the ATM example, we know that swiping the card and prompting for a PIN are requirements, while reading the card details and a 4-digit PIN are specifications.
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (8, 1, N'The purpose of the WRSPM model is to ensure that:
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (10, 1, N'A subsystem in an architecture must:
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (11, 1, N'Partitioning of a large system into smaller subsystems helps the buy-or-build decision because we can examine each subsystem and reason about possible buy-or-build options for each.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (12, 2, N'A good software architecture is important because:
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (13, 1, N'A UNIX program where the output of one program is the input of another, is an example of which of the software architecture models below:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (14, 3, N'An online banking system is best modeled by:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (15, 3, N'A vehicle identification and tracking system, where each moving vehicle is tracked and monitored through a shared program, is best modeled by:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (16, 3, N'The difference between subsystems and modules are:
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (17, 1, N'Software quality attributes that we care about during software architecture are:
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (19, 6, N'Software architecture concerns itself with both estimation and quality but not partitioning.
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (20, 6, N'Which of the following is considered the most difficult in the software development process?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (21, 1, N'What is a Requirements Specification?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (22, 6, N'Based on the NASA statistics on budget and schedule overrun vs. time spent on requirements process, what is the recommended amount of time to spend on the requirements stage?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (23, 6, N'Which of the following matches the terms to the correct definition?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (24, 6, N'Which of these is a user requirement?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (25, 6, N'Which of the following is NOT an example of a non-functional requirement.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (26, 1, N'Which of the following models is best suited for a system with significant shared data that needs to be shared across a variety of components or sub-systems, somewhat like global variables, but with better data integrity?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (27, 6, N'Which of the following models is best suited for a system that includes several subsets of functionality that are used in more than one area of the system?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (28, 1, N'Which of the following models is best suited for a system that benefits from the separation of complexity and processing between work which can be done locally and that which should be completed on a shared, remote service?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (29, 3, N'Which of the following would be considered a sub-system, rather than a module?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (30, 3, N'Software design is the process of transforming the stated problem into a ready-to-use implementation.
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (31, 3, N'Abstract solutions do not require extensive domain knowledge and effectively reduce the costs during the software design phase.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (32, 1, N'It is often advised that abstract solutions do not provide optimization details regarding the implementation.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (33, 4, N'When it comes to software design, it is always best to follow a solution that is widely popular in the industry', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (34, 4, N'While a solution coming from software design does not include implementation details, there are still common cases where pseudocode may be provided to correctly capture the sense of a complex algorithm.
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (35, 4, N'Which of the four aspects of modularity is defined as: How well modules work together.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (36, 4, N'Which of the four aspects of modularity can be described as: Abstracting away implementation details.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (37, 1, N'Which of the four aspects of modularity can be described as: Abstracting away implementation details.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (38, 4, N'Which of the four aspects of modularity can be described as: How well a module meets a single well-defined goal.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (39, 1, N'Which of the four aspects of modularity can be described as: Containment of constructs and concepts within a module.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (40, 1, N'Three goals of ______ can be described as (1) Decomposability, (2) Composability, and (3) Ease of Understanding.
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (41, 2, N'DBMS is a collection of .............. that enables user to create and maintain a database.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (42, 2, N'In a relational schema, each tuple is divided into fields called', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (43, 2, N'In an ER model, ................ is described in the database by storing its data.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (44, 2, N'DFD stands for', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (45, 2, N'A top-to-bottom relationship among the items in a database is established by a', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (46, 2, N'.................. table store information about database or about the system.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (47, 2, N'..............defines the structure of a relation which consists of a fixed set of attribute-domain pairs.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (48, 2, N'.................. clause is an additional filter that is applied', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (49, 2, N'.................. clause is an additional filter that is applied', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (50, 2, N'A logical schema', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (51, 2, N'..................... is a full form of SQL.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (52, 2, N'A relational database developer refers to a record as', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (53, 2, N'.......... keyword is used to find the number of values in a column.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (54, 2, N'An advantage of the database management approach is', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (55, 2, N'The collection of information stored in a database at a particular moment is called as ...', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (56, 2, N'The collection of information stored in a database at a particular moment is called as ...', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (57, 2, N'Data independence means', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (58, 2, N'Grant and revoke are ....... statements.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (59, 2, N'DBMS helps achieve', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (60, 2, N'......... command can be used to modify a column in a table', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (61, 2, N'The candidate key is that you choose to identify each row uniquely is called .................', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (62, 2, N'................. is used to determine whether of a table contains duplicate rows.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (63, 2, N'To eliminate duplicate rows .................. is used', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (64, 2, N'An advantage of the database management approach is', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (65, 2, N'DCL stands for', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (66, 2, N'........................ is the process of organizing data into related tables.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (67, 2, N'A ................... does not have a distinguishing attribute if its own and mostly are dependent entities, which are part of some another entity.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (68, 2, N'................. is the complex search criteria in the where clause.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (69, 2, N'..................... is preferred method for enforcing data integrity', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (70, 2, N'The number of tuples in a relation is called its ............. While the number of attributes in a relation is called it''s ....................', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (71, 2, N'The language that requires a user to specify the data to be retrieved without specifying exactly how to get it is', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (72, 2, N'Which two files are used during operation of the DBMS?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (73, 2, N'The database schema is written in', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (74, 2, N'The way a particular application views the data from the database that the application uses is a', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (75, 2, N'The relational model feature is that there', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (76, 2, N'Which one of the following statements is false?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (77, 2, N'Which database level is closest to the users?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (78, 2, N'Which are the two ways in which entities can participate in a relationship?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (79, 2, N'........ data type can store unstructured data', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (80, 2, N' ............... database is used as template for all databases created.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (81, 3, N'Which of the following is NOT a good characteristic well written of a software requirements specification?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (82, 3, N'Which is NOT the most important characteristics of product backlog?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (83, 3, N'A key tool for software designer, developer and their test team is to cany out their respective tasks is defined by:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (84, 3, N'As requirements are elicited, what source is most likely to impose previously unidentified user processes?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (85, 3, N'What is a software requirements specification (SRS) document?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (86, 3, N'Requirement elicitation is communication intensive and should be aligned with:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (87, 3, N'Giving an example of quality requirements: "After performing a file backup, the system shall verify the backup copy against the original and report any discrepancies". This is a (an) ______', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (88, 3, N'Which is not a reuse success factor?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (89, 3, N'If requirements are easily understandable and defined then which software process model is best suited?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (90, 3, N'Which is NOT a technique to find missing requirements?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (91, 3, N'Which is NOT the helpful of product backlog?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (92, 3, N'Which activities are NOT belong to requirements status tracking?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (93, 3, N'To depict the complex logic, which representation technique should be used?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (94, 3, N'To express the user task descriptions, which representation technique is NOT suitable?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (95, 3, N'Which of the following is most true about a non-functional requirement?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (96, 3, N'To understand user tasks and goals and the business objectives with which those tasks align, the Business Analysis should discuss with users at which stage(s):
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (97, 3, N'Requirement baselines are:', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (98, 3, N'Which adverbs are the causes of requirements ambiguity in documenting Software Requirement Specification?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (99, 3, N'The voice of the customers may be derived from?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (100, 3, N'Why is Requirements Management important? It is due to the changes', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (101, 3, N'Which technique overtaps for use in requirements elicitation and requirements validation?
', 1)
GO
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (102, 3, N'Which requirements should NOT be reused in the scope of cross an enterprise?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (103, 3, N'The software requirements specification should NOT be called ___', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (104, 3, N'If a requirements status is proposed then it', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (105, 3, N'Which of the following you should be based on when you estimate the projectsize and effort?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (106, 3, N'Due to the iterative nature of the requirements process, change has to be managed through the review and approval process. Which of the following is likely to require the least amount of management?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (107, 3, N'In order to determine solutions to business problems, the business analyst applies a set of:
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (108, 3, N'In the V model, the user requirements are detected by', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (109, 3, N'Which is the benefits of the reuse requirements technique?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (110, 3, N'The system users have stated their needs for revised online order entry system capabilities.
Her team needs the ability to perform online, remote order entry when they are traveling
worldwide. What class or type of requirements best describe this need?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (111, 3, N'Which is NOT the advantage of Agile methods?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (112, 3, N'Which requirements should NOT be reused within an operating environment or platform?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (113, 3, N'Which is NOT a purpose ofthe software prototype technique?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (114, 3, N'Why is base-lining project?
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (115, 3, N'The business analysis team has put together the elicitation results documenting their
understanding of the user needs. What types of requirements have they developed at this
point in time?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (116, 3, N'A listed acceptance criteria to fulfil certain requirements of a user and normally written from the perspective of an end~user. This is a
', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (117, 3, N'Why is Requirements Management important? It is due to the changes', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (118, 3, N'What is a best practice for change control?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (119, 3, N'Which of the following property is least critical to the interaction between process actors and the requirements process?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (120, 3, N'Which is NOT the reuse barrier?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (121, 4, N'There is a tremendous variety of products, from single-chip microcomputers costing a few dollars to supercomputers costing tens of millions of dollars that can rightly claim the name "computer".', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (122, 4, N'The variety of computer products is exhibited only in cost.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (123, 4, N'Changes in computer technology are finally slowing down.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (124, 4, N'The textbook for this course is about the structure and function of computers.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (125, 4, N'The number of bits used to represent various data types is an example of an architectural attribute.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (126, 4, N'Interfaces between the computer and peripherals is an example of an organizational attribute.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (127, 4, N'Historically the distinction between architecture and organization has not been an important one.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (128, 4, N'A particular architecture may span many years and encompass a number of different computer models, its organization changing with changing technology.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (129, 4, N'A microcomputer architecture and organization relationship is not very close.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (130, 4, N'Changes in technology not only influence organization but also result in the introduction of more powerful and more complex architectures.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (131, 4, N'Both the structure and functioning of a computer are, in essence, simple.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (132, 4, N'A computer must be able to process, store, move, and control data.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (133, 4, N'When data are moved over longer distances, to or from a remote device, the process is known as data transport.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (134, 4, N'Computer technology is changing at a __________ pace.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (135, 4, N'Computer _________ refers to those attributes that have a direct impact on the logical execution of a', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (136, 4, N'Architectural attributes include __________ .', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (137, 4, N'_________ attributes include hardware details transparent to the programmer.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (138, 4, N'It is a(n) _________ design issue whether a computer will have a multiply instruction.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (139, 4, N'A __________ system is a set of interrelated subsystems.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (140, 4, N'An I/O device is referred to as a __________.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (141, 4, N'When data are moved over longer distances, to or from a remote device, the process is known as __________.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (142, 4, N'The _________ stores data.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (143, 4, N'The __________ moves data between the computer and its external environment.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (144, 4, N'A _________ is a mechanism that provides for communication among CPU, main memory, and I/O.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (145, 4, N'A common example of system interconnection is by means of a __________.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (146, 4, N'_________ provide storage internal to the CPU.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (147, 4, N'The __________ performs the computer''s data', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (148, 4, N'The world''s first general-purpose electronic digital computer was designed and constructed at The Ohio State University.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (149, 4, N'John Mauchly and John Eckert designed the ENIAC.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (150, 4, N'The major drawback of the EDVAC was that it had to be programmed manually by setting switches and plugging and unplugging cables.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (151, 4, N'The IAS is the prototype of all subsequent general-purpose computers.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (152, 4, N'The IAS operates by repetitively performing an instruction cycle.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (153, 4, N'Backward compatible means that the programs written for the older machines can be executed on the new machine.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (154, 4, N'A vacuum tube is a solid-state device made from silicon.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (155, 4, N'Computers are classified into generations based on the fundamental hardware technology employed.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (156, 4, N'The _________ was the world''s first general-purpose electronic digital computer.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (157, 4, N'The Electronic Numerical Integrator and Computer project was a response to U.S. needs during _________.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (158, 4, N'The ENIAC used __________.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (159, 4, N'The ENIAC is an example of a _________ generation computer.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (160, 4, N'The __________ interprets the instructions in memory and causes them to be executed.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (161, 5, N'The _______ model is the basis for today''s computers!', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (162, 5, N'In a computer, the _______ subsystem stores data and programs.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (163, 5, N' In a computer, the _______ subsystem performs calculations and
logical operations.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (164, 5, N'In a computer, the _______ subsystem accepts data and programs and
sends processing results to output devices.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (165, 5, N'In a computer, the _______ subsystem accepts data and programs and
sends processing results to output devices.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (166, 5, N'According to the von Neumann model, _______ are stored in mem-
ory.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (167, 5, N'A step-by-step solution to a problem is called _______.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (168, 5, N'FORTRAN and COBOL are examples of _______.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (169, 5, N'A 17th-century computing machine that could perform addition and
subtraction was the _______.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (170, 5, N'. _______ is a set of instructions in a computer language that tells the
computer what to do with data.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (171, 5, N'_______ is the design and writing of a program in structured form.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (172, 5, N' The first electronic special-purpose computer was called _______.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (173, 5, N'One of the first computers based on the von Neumann model was
called _______.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (174, 5, N'The first computing machine to use the idea of storage and program-
ming was called _______.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (175, 5, N' _______ separated the programming task from computer operation
tasks.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (176, 5, N'The base of the binary number system is ____.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (177, 5, N' The base of the decimal number system is ____.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (178, 5, N' The base of the octal number system is ____.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (179, 5, N'The base of the hexadecimal number system is ____.', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (180, 5, N'When converting a decimal integer to base b, we repeatedly _____ ', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (181, 5, N'Which of the following representations is erroneous?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (182, 5, N' Which of the following representations is erroneous?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (183, 5, N' Which of the following representations is erroneous?', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (184, 6, N'lkajsdflkjasdf', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (185, 8, N'updateQues', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (186, 8, N'alksdfjlakfsj', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (187, 7, N'english1', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (188, 7, N'english2', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (189, 10, N'asdfasdf', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (190, 11, N'23k4jladsf', 1)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (191, 13, N'1+1', 0)
INSERT [dbo].[Question] ([id], [idSub], [question], [isPublic]) VALUES (192, 13, N'1+2', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([id], [img], [hyperlink], [idAuthor]) VALUES (1, N'https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fpptmon.com%2Fquiz-time%2F&psig=AOvVaw1tGAY4YusMWlak5EyVToIH&ust=1677049818668000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKCGiciHpv0CFQAAAAAdAAAAABAE', N'https://www.google.com.vn/url?sa=i&url=https%3A%2F%2Fpptmon.com%2Fquiz-time%2F&psig=AOvVaw1tGAY4YusMWlak5EyVToIH&ust=1677049818668000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKCGiciHpv0CFQAAAAAdAAAAABAE', N'linhchi')
INSERT [dbo].[Slider] ([id], [img], [hyperlink], [idAuthor]) VALUES (2, N'https://marketplace.canva.com/EAEp9oyWWcU/3/0/1600w/canva-yellow-quiz-time-class-illustration-presentation-kg7q5g8gH_k.jpg', N'https://marketplace.canva.com/EAEp9oyWWcU/3/0/1600w/canva-yellow-quiz-time-class-illustration-presentation-kg7q5g8gH_k.jpg', N'linhchi')
INSERT [dbo].[Slider] ([id], [img], [hyperlink], [idAuthor]) VALUES (3, N'https://marketplace.canva.com/EAEvGf2ZPL4/2/0/1600w/canva-colorful-scrapbook-quiz-game-presentation-pA1tM2eDUjU.jpg', N'https://marketplace.canva.com/EAEvGf2ZPL4/2/0/1600w/canva-colorful-scrapbook-quiz-game-presentation-pA1tM2eDUjU.jpg', N'linhchi')
INSERT [dbo].[Slider] ([id], [img], [hyperlink], [idAuthor]) VALUES (4, N'https://marketplace.canva.com/EAFNr3mZ4CQ/1/0/1600w/canva-blue-red-playful-illustration-memory-game-presentation-PtysW1y0FSU.jpg', N'https://marketplace.canva.com/EAFNr3mZ4CQ/1/0/1600w/canva-blue-red-playful-illustration-memory-game-presentation-PtysW1y0FSU.jpg', N'linhchi')
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (1, N'SWE201c', NULL, NULL, CAST(N'2023-02-01' AS Date), N'linhchi', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (2, N'DBI202', NULL, NULL, CAST(N'2023-02-01' AS Date), N'linhchi', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (3, N'SWR302', NULL, NULL, CAST(N'2023-02-01' AS Date), N'linhchi', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (4, N'CEA201', NULL, NULL, CAST(N'2023-02-01' AS Date), N'linhchi', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (5, N'CSI104', NULL, NULL, CAST(N'2023-02-01' AS Date), N'linhchi', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (6, N'WED ', NULL, NULL, CAST(N'2023-02-01' AS Date), N'linhchi', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (7, N'ENGLISH', N'', N'Ngữ VĂN 12', CAST(N'2023-03-07' AS Date), N'trangiabao5102@gmail.com', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (8, N'Van', N'https://img.vn/uploads/thuvien/singa-png-20220719150401Tdj1WAJFQr.png', N'Test update
lkjasldkfjlskajdf', CAST(N'2023-03-10' AS Date), N'trangiabao5102@gmail.com', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (9, N'Math', N'', N'Them Toan', CAST(N'2023-03-10' AS Date), N'trangiabao5102@gmail.com', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (10, N'MathAdd', N'', N'TOAN NE', CAST(N'2023-03-10' AS Date), N'trangiabao5102', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (11, N'France', N'', N'fap', CAST(N'2023-03-10' AS Date), N'trangiabao5102', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (12, N'Văn', N'', N'alskdjfaslkdfj', CAST(N'2023-03-10' AS Date), N'trangiabao5102', 1)
INSERT [dbo].[Subject] ([id], [name], [img], [description], [publicDate], [idAuthor], [isPublic]) VALUES (13, N'Add', N'data:image/jpeg;base64,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', N'Do hoa', CAST(N'2023-03-13' AS Date), N'expert', NULL)
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (1, 1)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (2, 1)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (3, 1)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (4, 1)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (7, 1)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (7, 4)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (8, 3)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (9, 2)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (10, 2)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (10, 4)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (11, 3)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (12, 1)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (12, 4)
INSERT [dbo].[SubType] ([idSub], [idCate]) VALUES (13, 3)
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([idQues])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Account] FOREIGN KEY([userName])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Account]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Subject] FOREIGN KEY([idSub])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Subject]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Account] FOREIGN KEY([idAuthor])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Account]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([idSub])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Slider]  WITH CHECK ADD  CONSTRAINT [FK_Slider_Account] FOREIGN KEY([idAuthor])
REFERENCES [dbo].[Account] ([userName])
GO
ALTER TABLE [dbo].[Slider] CHECK CONSTRAINT [FK_Slider_Account]
GO
ALTER TABLE [dbo].[SubType]  WITH CHECK ADD  CONSTRAINT [FK_SubType_Category1] FOREIGN KEY([idCate])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[SubType] CHECK CONSTRAINT [FK_SubType_Category1]
GO
ALTER TABLE [dbo].[SubType]  WITH CHECK ADD  CONSTRAINT [FK_SubType_Subject] FOREIGN KEY([idSub])
REFERENCES [dbo].[Subject] ([id])
GO
ALTER TABLE [dbo].[SubType] CHECK CONSTRAINT [FK_SubType_Subject]
GO
USE [master]
GO
ALTER DATABASE [Quiz System] SET  READ_WRITE 
GO
