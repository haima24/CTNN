use master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'CTNN')
DROP DATABASE [CTNN]
GO

CREATE DATABASE [CTNN]
GO


USE [CTNN]
GO
/****** Object:  Table [dbo].[Answers_Fill]    Script Date: 20/01/2013 11:56:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers_Fill](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[FillWord] [nvarchar](255) NULL,
 CONSTRAINT [PK_Answers_Fill] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Answers_Radio]    Script Date: 20/01/2013 11:56:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers_Radio](
	[AnswerId] [int] NOT NULL,
	[QuestionId] [int] NULL,
	[AnswerDetail] [nvarchar](255) NULL,
	[IsTrue] [bit] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Answers_WrongWords]    Script Date: 20/01/2013 11:56:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers_WrongWords](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[WrongWord] [nvarchar](255) NULL,
 CONSTRAINT [PK_Answers_WrongWords] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 20/01/2013 11:56:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionDetail] [nvarchar](255) NULL,
	[QuestionType] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Answers_Fill]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Fill_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[Answers_Fill] CHECK CONSTRAINT [FK_Answers_Fill_Questions]
GO
ALTER TABLE [dbo].[Answers_Radio]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[Answers_Radio] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Answers_WrongWords]  WITH CHECK ADD  CONSTRAINT [FK_Answers_WrongWords_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[Answers_WrongWords] CHECK CONSTRAINT [FK_Answers_WrongWords_Questions]
GO
