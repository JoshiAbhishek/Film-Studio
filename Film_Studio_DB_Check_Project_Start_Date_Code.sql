/*Sample Function & Check Constraint Code For Film Studio Database, By Abhishek Joshi*/
/*Function and check constraint to check project's begin date
compared to the contract's start date*/

CREATE FUNCTION ufnGetContractStart (@ContractID INT)
RETURNS DATE
AS

BEGIN
	DECLARE @ContractDate DATE
	SELECT @ContractDate = BeginDateActual
	FROM tblCONTRACT
	WHERE tblCONTRACT.ContractID = @ContractID

	RETURN @ContractDate
END

GO

ALTER TABLE tblPROJECT
ADD CONSTRAINT chk_ContractDate
CHECK (BeginDateActual >= dbo.ufnGetContractStart(ContractID));