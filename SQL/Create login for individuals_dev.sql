USE [master]
GO

/****** Object:  Login [individuals_dev]    Script Date: 4/13/2020 4:55:27 PM ******/
DROP LOGIN [individuals_dev]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [individuals_dev]    Script Date: 4/13/2020 4:55:27 PM ******/
CREATE LOGIN [individuals_dev] WITH PASSWORD=N'!3gCgQEh', 
	DEFAULT_DATABASE=[SecurityTrackerIndividualsDev], 
	DEFAULT_LANGUAGE=[us_english], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [individuals_dev] ENABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [individuals_dev]
GO
