/*Sample Stored Procedure Code For Film Studio Database, By Abhishek Joshi*/
/*Stored Procedure For Adding New Clients*/

CREATE PROC uspAddClient (
	@ClientName VARCHAR(60),
	@ClientAddress VARCHAR(120),
	@ClientCity VARCHAR(60),
	@ClientState VARCHAR(60),
	@ClientZip VARCHAR(25),
	@ClientPhone VARCHAR(60),
	@ClientEmail VARCHAR(60),
	@ClientTypeName VARCHAR(60)
)

AS

BEGIN TRAN T1
	DECLARE @ClientTypeID INT
	SET @ClientTypeID = (SELECT ClientTypeID FROM tblCLIENT_TYPE WHERE ClientTypeName = @ClientTypeName)

	INSERT INTO tblCLIENT(ClientName, ClientAddress, ClientCity, ClientState, ClientZip, ClientPhone, ClientEmail, ClientTypeID)
	VALUES (@ClientName, @ClientAddress, @ClientCity, @ClientState, @ClientZip, @ClientPhone, @ClientEmail, @ClientTypeID)
COMMIT TRAN T1