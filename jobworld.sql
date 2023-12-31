USE [master]
GO
/****** Object:  Database [jobworld]    Script Date: 4/12/2017 2:49:17 PM ******/
CREATE DATABASE [jobworld] ON  PRIMARY 
( NAME = N'jobworld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\jobworld.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'jobworld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\jobworld_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [jobworld] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jobworld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jobworld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jobworld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jobworld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jobworld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jobworld] SET ARITHABORT OFF 
GO
ALTER DATABASE [jobworld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jobworld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jobworld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jobworld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jobworld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jobworld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jobworld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jobworld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jobworld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jobworld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jobworld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jobworld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jobworld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jobworld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jobworld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jobworld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jobworld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jobworld] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [jobworld] SET  MULTI_USER 
GO
ALTER DATABASE [jobworld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jobworld] SET DB_CHAINING OFF 
GO
USE [jobworld]
GO
/****** Object:  User [jobworld]    Script Date: 4/12/2017 2:49:17 PM ******/
CREATE USER [jobworld] FOR LOGIN [jobworld] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [jobworld]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [jobworld]
GO
/****** Object:  Table [dbo].[advertisement]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisement](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [smallint] NOT NULL CONSTRAINT [DF_advertisement_type]  DEFAULT ((0)),
	[imagepath] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[content]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[eid] [smallint] NULL CONSTRAINT [DF_content_eid]  DEFAULT ((0)),
	[type] [smallint] NULL CONSTRAINT [DF_content_type]  DEFAULT ((0)),
	[etitle] [text] NULL,
	[econtent] [text] NULL,
	[esummary] [text] NULL,
	[imagepath] [text] NULL,
	[kiosk] [smallint] NOT NULL CONSTRAINT [DF_content_kiosk]  DEFAULT ((0)),
	[regdate] [datetime] NOT NULL CONSTRAINT [DF_content_regdate]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[logins]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logins](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[user_ip] [nvarchar](50) NOT NULL,
	[url] [nvarchar](255) NULL,
	[agent] [nvarchar](255) NULL,
	[logout] [tinyint] NULL,
	[regdate] [datetime] NOT NULL CONSTRAINT [DF_logins_regdate]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[news_setting]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news_setting](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[company] [nvarchar](255) NOT NULL,
	[collector] [nvarchar](255) NOT NULL,
	[editor] [nvarchar](255) NOT NULL,
	[c_statue] [smallint] NOT NULL CONSTRAINT [DF_news_c_statue_1]  DEFAULT ((0)),
	[e_statue] [smallint] NOT NULL CONSTRAINT [DF_news_e_statue_1]  DEFAULT ((0)),
	[statue] [smallint] NOT NULL CONSTRAINT [DF_news_statue_1]  DEFAULT ((0)),
	[c_place] [nvarchar](255) NULL,
	[c_email] [nvarchar](255) NULL,
	[news_type] [smallint] NOT NULL CONSTRAINT [DF_news_news_type]  DEFAULT ((0)),
	[news_name] [nvarchar](255) NULL,
	[e_email] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loginid] [nvarchar](50) NOT NULL,
	[loginpwd] [nvarchar](50) NOT NULL,
	[reg_ip] [nvarchar](50) NULL,
	[user_ip] [nvarchar](50) NULL,
	[logindate] [datetime] NULL CONSTRAINT [DF_users_logindate]  DEFAULT (getdate()),
	[level] [int] NOT NULL,
	[leavedate] [datetime] NOT NULL CONSTRAINT [DF_users_leavedate]  DEFAULT (getdate())
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[sp_createLogin]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_createLogin]
	@user_id [bigint],
	@user_ip [nvarchar](50),
	@url [nvarchar](255),
	@agent [nvarchar](255)
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
		INSERT INTO logins
			(user_id, user_ip, url, agent, regdate)
		VALUES
			(@user_id, @user_ip, @url, @agent, GETDATE())
			
		SELECT COUNT(*) FROM logins WHERE user_id = @user_id AND CONVERT(NVARCHAR(30), regdate, 111) = CONVERT(NVARCHAR(30), GETDATE(), 111)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_createUser]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_createUser]
	@loginid [nvarchar](20),
	@loginpwd [nvarchar](50),
	@reg_ip [nvarchar](50),
	@user_ip [nvarchar](50),
	@logindate[datetime]=NULL,
	@level[int],
	@leavedate [datetime] = NULL
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO users
			(loginid, loginpwd, reg_ip, user_ip, logindate, [level], leavedate)
		VALUES
			(@loginid, @loginpwd, @reg_ip, @user_ip, @logindate, @level, @leavedate);
			
	SELECT @@IDENTITY
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getLogins]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getLogins]
	@adm_id [bigint] = NULL,
	@user_id [bigint] = NULL
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	IF @user_id IS NULL
	BEGIN
		SELECT
			l.url, l.regdate, u.loginid, u.id
		FROM
			logins AS l LEFT OUTER JOIN users AS u
		ON
			l.user_id = u.id
		WHERE
			l.logout = 0 AND 
			(@adm_id IS NULL OR u.id <> @adm_id)	
	END
	ELSE IF @user_id IS NOT NULL
	BEGIN
		SELECT
			*
		FROM
			(
				SELECT
					TOP(1) l.*, u.loginid
				FROM
					logins AS l LEFT OUTER JOIN users AS u
				ON
					l.user_id = u.id
				WHERE
					l.user_id = @user_id
				ORDER BY l.regdate DESC
			) AS A
		WHERE
			A.logout = 0
	END
	RETURN


    
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getUser]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_getUser]
	@id [bigint] = NULL,
	@loginid [nvarchar](20) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;    
	SELECT * FROM users 
	WHERE 
		(@id IS NULL OR id = @id) AND
		(@loginid IS NULL OR loginid = @loginid)		
END


GO
/****** Object:  StoredProcedure [dbo].[sp_modifyUser]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_modifyUser]
	@id [bigint],
	@loginid [nvarchar](20),
	@loginpwd [nvarchar](50)
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE 
		users
	SET
		loginid=@loginid,
		loginpwd=@loginpwd
	WHERE id=@id;
	RETURN
END


GO
/****** Object:  StoredProcedure [dbo].[sp_updateLogin]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_updateLogin]
	@user_id [bigint],
	@url [nvarchar](255) = NULL,
	@logout [tinyint] = 0
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON
		UPDATE
			logins
		SET
			url		= @url,
			logout	= @logout,
			regdate = GETDATE()
		WHERE
			id = (SELECT TOP(1) id FROM logins WHERE user_id = @user_id ORDER BY regdate DESC)
	RETURN


GO
/****** Object:  StoredProcedure [dbo].[sp_updateUserInfo]    Script Date: 4/12/2017 2:49:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_updateUserInfo]
	@id [bigint],
	@leavedate [datetime] = NULL,
	@user_ip [nvarchar](50) = NULL
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON
		IF @user_ip IS NOT NULL
		BEGIN
			UPDATE 
				users
			SET
				user_ip = @user_ip,
				logindate = GETDATE()
			WHERE
				id = @id
		END
		ELSE IF @leavedate IS NOT NULL
		BEGIN
			UPDATE
				users
			SET
				leavedate = @leavedate
			WHERE
				id = @id
		END
	RETURN


GO
USE [master]
GO
ALTER DATABASE [jobworld] SET  READ_WRITE 
GO
