USE [master]
GO

/****** Object:  Login [cms_dev]    Script Date: 4/13/2020 4:47:15 PM ******/
DROP LOGIN [cms_dev]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [cms_dev]    Script Date: 4/13/2020 4:47:15 PM ******/
CREATE LOGIN [cms_dev] WITH PASSWORD=N'n!Uj!2Ge', 
	DEFAULT_DATABASE=[CaseTrackerDEV], 
	DEFAULT_LANGUAGE=[us_english], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [cms_dev] ENABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [cms_dev]
GO


