USE [InfinityDev]
GO

/****** Object:  StoredProcedure [dbo].[SaveFromDatatable]    Script Date: 4/21/2020 1:13:49 PM ******/
--DROP PROCEDURE [dbo].[SaveFromDatatable]
GO

/****** Object:  StoredProcedure [dbo].[SaveFromDatatable]    Script Date: 4/21/2020 1:13:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Chris Perez
-- Create date: 04/21/2020
-- Description:	Save DataTable values into Inifinity Table
-- =============================================
CREATE PROCEDURE [dbo].[SaveFromDatatable]
	@DataTable	[dbo].[Infinity_LPLB_Type] READONLY,
	@RecNo		INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SET IDENTITY_INSERT [dbo].[Infinity_LPLB] ON
	DELETE FROM [dbo].[Infinity_LPLB] WHERE [IDInfinity]=@RecNo

	INSERT INTO [dbo].[Infinity_LPLB]
               ([IDInfinity], [Defendant_Company], [Status_of_Case_Ex_ADST], [Year_Filed], 
                [Lead_Case_Venue], [Type_of_Case_10b_11_14e_14a], [Lead_Case_No_Example_1100409], [First_Jurisdiction_Filed_and_Number], [KTMC_Marketing_PlanDesignation],
                [Second_Jurisdiction_Filed_and_Number], [Third_Jurisdiction_Filed_and_Number], [Fourth_Jurisdiction_Filed_and_Number],
                [Lead_Plaintiff_Deadline], [Lead_Plaintiff_Movant1_Type_InsitutionalIndividualMixed], [Appointed_Lead_Plaintiff],
                [Appointed_Lead_Plaintiff_Type_EX_Individual_Institution_Group_of], [Largest_Loss_Appointed_YesNo], [Judge_that_Appointed_LP], [Judge_Assigned_to_Lead_Case],
                [Magistrate_Judge], [Lead_Counsel_1_], [Lead_Counsel_2], [Lead_Counsel_3], [Lead_Counsel_4], [Appointed_Local_Liaison_Counsel], [Appointed_Additional_Counsel],
                [Corporate_Defense_Counsel_1_], [Attorney_for_Corporate_Defense_Counsel_1], [Corporate_Defense_Counsel_2], [Attorney_for_Corporate_Defense_Counsel_2],
                [Corporate_Defense_Counsel_3], [Attorney_for_Corporate_Defense_Counsel_3], [Corporate_Defense_Counsel_4], [KTMC_Internal_Case_No], [Initial_Damage_Estimate_from_60day_list],
                [LP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t], [The_1st_MTD_Result], [The_1st_MTD_Judge],
                [The_2nd_MTD_Result], [The_2nd_MTD_Judge], [The_3rd_MTD_Result], [The_3rd_MTD_Judge], [Class_Cert_Result],
                [Class_Cert_Judge], [Certified_Class_Period], [Is_Certified_Class_Period_Same_as_Original_Class_Period_YN], [Settlement_Type_cash_stock_mixed],
                [Settlement_Stage_Examples_Motion_to_dismiss_summary_judgment_cla], [Settling_Lead_Plaintiffs], [Settlement_Amount],
                [Settlement_Attorneys_Fees_], [Requested_Attorneys__Fee_Percentage], [Attorneys_Fee_Percentage_Awarded_], [Fee_Lodestar], [Settling_Parties_Company_Individual_Auditor_Underwriter],
                [Settlement_Judge], [Mediator], [Defendant_Insurer], [Certified_Class_Representative1], [Certified_Class_Representative2],
                [Certified_Class_Representative3], [Certified_Class_Representative4], [Certified_Class_Representative5], [Defendant_Underwriter],
				[First_Press_Release_Date], [LP_Appointment_Date], [Date_of_Order_on_1st_MTD],
                [Date_of_Order_on_2nd_MTD], [Date_of_Order_on_3rd_MTD], [Date_of_Class_Cert_Decision], [Stipulation_of_Settlement_Filed_Date], [Settlement_Hearing_Date],
                [Final_Settlement_Date], [Date_KTMC_paid])
	SELECT 
			    @RecNo, [Defendant_Company], [Status_of_Case_Ex_ADST], [Year_Filed], 
                [Lead_Case_Venue], [Type_of_Case_10b_11_14e_14a], [Lead_Case_No_Example_1100409], [First_Jurisdiction_Filed_and_Number], [KTMC_Marketing_PlanDesignation],
                [Second_Jurisdiction_Filed_and_Number], [Third_Jurisdiction_Filed_and_Number], [Fourth_Jurisdiction_Filed_and_Number],
                [Lead_Plaintiff_Deadline], [Lead_Plaintiff_Movant1_Type_InsitutionalIndividualMixed], [Appointed_Lead_Plaintiff],
                [Appointed_Lead_Plaintiff_Type_EX_Individual_Institution_Group_of], [Largest_Loss_Appointed_YesNo], [Judge_that_Appointed_LP], [Judge_Assigned_to_Lead_Case],
                [Magistrate_Judge], [Lead_Counsel_1_], [Lead_Counsel_2], [Lead_Counsel_3], [Lead_Counsel_4], [Appointed_Local_Liaison_Counsel], [Appointed_Additional_Counsel],
                [Corporate_Defense_Counsel_1_], [Attorney_for_Corporate_Defense_Counsel_1], [Corporate_Defense_Counsel_2], [Attorney_for_Corporate_Defense_Counsel_2],
                [Corporate_Defense_Counsel_3], [Attorney_for_Corporate_Defense_Counsel_3], [Corporate_Defense_Counsel_4], [KTMC_Internal_Case_No], [Initial_Damage_Estimate_from_60day_list],
                [LP__of_Estimated_Class_Loss_LPs_loss_from_landscape_divided_by_t], [The_1st_MTD_Result], [The_1st_MTD_Judge],
                [The_2nd_MTD_Result], [The_2nd_MTD_Judge], [The_3rd_MTD_Result], [The_3rd_MTD_Judge], [Class_Cert_Result],
                [Class_Cert_Judge], [Certified_Class_Period], [Is_Certified_Class_Period_Same_as_Original_Class_Period_YN], [Settlement_Type_cash_stock_mixed],
                [Settlement_Stage_Examples_Motion_to_dismiss_summary_judgment_cla], [Settling_Lead_Plaintiffs], [Settlement_Amount],
                [Settlement_Attorneys_Fees_], [Requested_Attorneys__Fee_Percentage], [Attorneys_Fee_Percentage_Awarded_], [Fee_Lodestar], [Settling_Parties_Company_Individual_Auditor_Underwriter],
                [Settlement_Judge], [Mediator], [Defendant_Insurer], [Certified_Class_Representative1], [Certified_Class_Representative2],
                [Certified_Class_Representative3], [Certified_Class_Representative4], [Certified_Class_Representative5], [Defendant_Underwriter],
				[First_Press_Release_Date], [LP_Appointment_Date], [Date_of_Order_on_1st_MTD],
                [Date_of_Order_on_2nd_MTD], [Date_of_Order_on_3rd_MTD], [Date_of_Class_Cert_Decision], [Stipulation_of_Settlement_Filed_Date], [Settlement_Hearing_Date],
                [Final_Settlement_Date], [Date_KTMC_paid]
	FROM
				@DataTable

    SET IDENTITY_INSERT [dbo].[Infinity_LPLB] OFF
	
END
GO


