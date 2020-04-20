USE [master]
GO

/****** Object:  Login [infinity_dev]    Script Date: 4/13/2020 4:57:23 PM ******/
DROP LOGIN [infinity_dev]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [infinity_dev]    Script Date: 4/13/2020 4:57:23 PM ******/
CREATE LOGIN [infinity_dev] WITH PASSWORD=N'TvVm@Gq&', 
	DEFAULT_DATABASE=[InfinityDev], 
	DEFAULT_LANGUAGE=[us_english], 
	CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [infinity_dev] ENABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [infinity_dev]
GO

