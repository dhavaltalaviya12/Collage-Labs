-- SP for User --

-- EXEC PR_User_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_User_SelectAll]
AS
BEGIN
SELECT 
    [dbo].[User].[UserID],
    [dbo].[User].[UserName],
    [dbo].[User].[Password],
    [dbo].[User].[Email],
    [dbo].[User].[MobileNo],
    [dbo].[User].[IsActive],
    [dbo].[User].[Created],
    [dbo].[User].[Modified]
FROM [dbo].[User]
WHERE [dbo].[User].[IsActive] = 1
END


-- EXEC PR_User_SelectByPK @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_User_SelectByPK]
    @UserID INT
AS
BEGIN
SELECT 
    [dbo].[User].[UserID],
    [dbo].[User].[UserName],
    [dbo].[User].[Password],
    [dbo].[User].[Email],
    [dbo].[User].[MobileNo],
    [dbo].[User].[IsActive],
    [dbo].[User].[Created],
    [dbo].[User].[Modified]
FROM [dbo].[User]
WHERE [dbo].[User].[UserID] = @UserID
END


-- EXEC PR_User_Insert @UserName = 'Dhaval Talaviya', @Password = 'P@ssword456', @Email = 'dhaval@example.com', @MobileNo = '9876543287', @IsActive = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_User_Insert]
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @IsActive BIT
AS
BEGIN
INSERT INTO [dbo].[User] (
    [UserName],
    [Password],
    [Email],
    [MobileNo],
    [IsActive],
    [Modified]
)
VALUES (
    @UserName,
    @Password,
    @Email,
    @MobileNo,
    @IsActive,
    GETDATE()
)
END


-- EXEC PR_User_UpdateByPK @UserID = 1, @UserName = 'Jevin', @Password = 'NewPass123', @Email = 'jevin.updated@example.com', @MobileNo = '1234567890', @IsActive = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_User_UpdateByPK]
    @UserID INT,
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @IsActive BIT
AS
BEGIN
UPDATE [dbo].[User]
SET 
    [UserName] = @UserName,
    [Password] = @Password,
    [Email] = @Email,
    [MobileNo] = @MobileNo,
    [IsActive] = @IsActive,
    [Modified] = GETDATE()
WHERE [dbo].[User].[UserID] = @UserID
END


-- EXEC PR_User_DeleteByPK @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_User_DeleteByPK]
    @UserID INT
AS
BEGIN
DELETE FROM [dbo].[User]
WHERE [dbo].[User].[UserID] = @UserID
END



-- SP for Department --

-- EXEC PR_Department_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_Department_SelectAll]
AS
BEGIN
SELECT 
    [dbo].[Department].[DepartmentID],
    [dbo].[Department].[DepartmentName],
    [dbo].[Department].[Description],
    [dbo].[Department].[IsActive],
    [dbo].[Department].[Created],
    [dbo].[Department].[Modified],
    [dbo].[Department].[UserID],
    [dbo].[User].[UserName]
FROM [dbo].[Department]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Department].[UserID]
WHERE [dbo].[Department].[IsActive] = 1
ORDER BY [dbo].[Department].[DepartmentName]
END


-- EXEC PR_Department_SelectByPK @DepartmentID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Department_SelectByPK]
    @DepartmentID INT
AS
BEGIN
SELECT 
    [dbo].[Department].[DepartmentID],
    [dbo].[Department].[DepartmentName],
    [dbo].[Department].[Description],
    [dbo].[Department].[IsActive],
    [dbo].[Department].[Created],
    [dbo].[Department].[Modified],
    [dbo].[Department].[UserID],
    [dbo].[User].[UserName]
FROM [dbo].[Department]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Department].[UserID]
WHERE [dbo].[Department].[DepartmentID] = @DepartmentID
END


-- EXEC PR_Department_Insert @DepartmentName = 'Cardiology', @Description = 'Heart care unit', @IsActive = 1, @Modified = GETDATE(), @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Department_Insert]
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
INSERT INTO [dbo].[Department] (
    [DepartmentName],
    [Description],
    [IsActive],
    [Modified],
    [UserID]
)
VALUES (
    @DepartmentName,
    @Description,
    @IsActive,
    GETDATE(),
    @UserID
)
END


-- EXEC PR_Department_UpdateByPK @DepartmentID = 1, @DepartmentName = 'Updated Dept', @Description = 'Updated description', @IsActive = 1, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Department_UpdateByPK]
    @DepartmentID INT,
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
UPDATE [dbo].[Department]
SET 
    [DepartmentName] = @DepartmentName,
    [Description] = @Description,
    [IsActive] = @IsActive,
    [Modified] = GETDATE(),
    [UserID] = @UserID
WHERE [dbo].[Department].[DepartmentID] = @DepartmentID
END


-- EXEC PR_Department_DeleteByPK @DepartmentID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Department_DeleteByPK]
    @DepartmentID INT
AS
BEGIN
DELETE FROM [dbo].[Department]
WHERE [dbo].[Department].[DepartmentID] = @DepartmentID
END



-- SP for Doctor --

-- EXEC PR_Doctor_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_Doctor_SelectAll]
AS
BEGIN
SELECT 
    [dbo].[Doctor].[DoctorID],
    [dbo].[Doctor].[Name],
    [dbo].[Doctor].[Phone],
    [dbo].[Doctor].[Email],
    [dbo].[Doctor].[Qualification],
    [dbo].[Doctor].[Specialization],
    [dbo].[Doctor].[IsActive],
    [dbo].[Doctor].[Created],
    [dbo].[Doctor].[Modified],
    [dbo].[Doctor].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName
FROM [dbo].[Doctor]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Doctor].[UserID]
WHERE [dbo].[Doctor].[IsActive] = 1
END


-- EXEC PR_Doctor_SelectByPK @DoctorID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Doctor_SelectByPK]
    @DoctorID INT
AS
BEGIN
SELECT 
    [dbo].[Doctor].[DoctorID],
    [dbo].[Doctor].[Name],
    [dbo].[Doctor].[Phone],
    [dbo].[Doctor].[Email],
    [dbo].[Doctor].[Qualification],
    [dbo].[Doctor].[Specialization],
    [dbo].[Doctor].[IsActive],
    [dbo].[Doctor].[Created],
    [dbo].[Doctor].[Modified],
    [dbo].[Doctor].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName
FROM [dbo].[Doctor]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Doctor].[UserID]
WHERE [dbo].[Doctor].[DoctorID] = @DoctorID
END


-- EXEC PR_Doctor_Insert @Name = 'Dr. Jevin', @Phone = '9998887777', @Email = 'drjevin@example.com', @Qualification = 'MBBS', @Specialization = 'Neurology', @IsActive = 1, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Doctor_Insert]
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @IsActive BIT = 1,
    @UserID INT
AS
BEGIN
INSERT INTO [dbo].[Doctor] (
    [Name],
    [Phone],
    [Email],
    [Qualification],
    [Specialization],
    [IsActive],
    [Modified],
    [UserID]
)
VALUES (
    @Name,
    @Phone,
    @Email,
    @Qualification,
    @Specialization,
    @IsActive,
    GETDATE(),
    @UserID
)
END


-- EXEC PR_Doctor_UpdateByPK @DoctorID = 1, @Name = 'Dr. Updated', @Phone = '1234567890', @Email = 'updated@example.com', @Qualification = 'MD', @Specialization = 'Cardiology', @IsActive = 1, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Doctor_UpdateByPK]
    @DoctorID INT,
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
UPDATE [dbo].[Doctor]
SET 
    [Name] = @Name,
    [Phone] = @Phone,
    [Email] = @Email,
    [Qualification] = @Qualification,
    [Specialization] = @Specialization,
    [IsActive] = @IsActive,
    [Modified] = GETDATE(),
    [UserID] = @UserID
WHERE [dbo].[Doctor].[DoctorID] = @DoctorID
END


-- EXEC PR_Doctor_DeleteByPK @DoctorID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Doctor_DeleteByPK]
    @DoctorID INT
AS
BEGIN
DELETE FROM [dbo].[Doctor]
WHERE [dbo].[Doctor].[DoctorID] = @DoctorID
END



-- SP for DoctorDepartment --

-- EXEC PR_DoctorDepartment_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartment_SelectAll]
AS
BEGIN
SELECT 
    [dbo].[DoctorDepartment].[DoctorDepartmentID],
    [dbo].[DoctorDepartment].[DoctorID],
    [dbo].[Doctor].[Name] AS DoctorName,
    [dbo].[DoctorDepartment].[DepartmentID],
    [dbo].[Department].[DepartmentName],
    [dbo].[DoctorDepartment].[Created],
    [dbo].[DoctorDepartment].[Modified],
    [dbo].[DoctorDepartment].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName
FROM [dbo].[DoctorDepartment]
INNER JOIN [dbo].[Doctor]
    ON [dbo].[Doctor].[DoctorID] = [dbo].[DoctorDepartment].[DoctorID]
INNER JOIN [dbo].[Department]
    ON [dbo].[Department].[DepartmentID] = [dbo].[DoctorDepartment].[DepartmentID]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[DoctorDepartment].[UserID]
ORDER BY 
    [dbo].[Doctor].[Name],
    [dbo].[Department].[DepartmentName]
END


-- EXEC PR_DoctorDepartment_SelectByPK @DoctorDepartmentID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartment_SelectByPK]
    @DoctorDepartmentID INT
AS
BEGIN
SELECT 
    [dbo].[DoctorDepartment].[DoctorDepartmentID],
    [dbo].[DoctorDepartment].[DoctorID],
    [dbo].[Doctor].[Name] AS DoctorName,
    [dbo].[DoctorDepartment].[DepartmentID],
    [dbo].[Department].[DepartmentName],
    [dbo].[DoctorDepartment].[Created],
    [dbo].[DoctorDepartment].[Modified],
    [dbo].[DoctorDepartment].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName
FROM [dbo].[DoctorDepartment]
INNER JOIN [dbo].[Doctor]
    ON [dbo].[Doctor].[DoctorID] = [dbo].[DoctorDepartment].[DoctorID]
INNER JOIN [dbo].[Department]
    ON [dbo].[Department].[DepartmentID] = [dbo].[DoctorDepartment].[DepartmentID]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[DoctorDepartment].[UserID]
WHERE [dbo].[DoctorDepartment].[DoctorDepartmentID] = @DoctorDepartmentID
END


-- EXEC PR_DoctorDepartment_Insert @DoctorID = 1, @DepartmentID = 2, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartment_Insert]
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT
AS
BEGIN
INSERT INTO [dbo].[DoctorDepartment] (
    [DoctorID],
    [DepartmentID],
    [Modified],
    [UserID]
)
VALUES (
    @DoctorID,
    @DepartmentID,
    GETDATE(),
    @UserID
)
END


-- EXEC PR_DoctorDepartment_UpdateByPK @DoctorDepartmentID = 1, @DoctorID = 1, @DepartmentID = 3, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartment_UpdateByPK]
    @DoctorDepartmentID INT,
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT
AS
BEGIN
UPDATE [dbo].[DoctorDepartment]
SET 
    [DoctorID] = @DoctorID,
    [DepartmentID] = @DepartmentID,
    [Modified] = GETDATE(),
    [UserID] = @UserID
WHERE [dbo].[DoctorDepartment].[DoctorDepartmentID] = @DoctorDepartmentID
END


-- EXEC PR_DoctorDepartment_DeleteByPK @DoctorDepartmentID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartment_DeleteByPK]
    @DoctorDepartmentID INT
AS
BEGIN
DELETE FROM [dbo].[DoctorDepartment]
WHERE [dbo].[DoctorDepartment].[DoctorDepartmentID] = @DoctorDepartmentID
END


-- SP for Patient --

-- EXEC PR_Patient_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_Patient_SelectAll]
AS
BEGIN
SELECT 
    [dbo].[Patient].[PatientID],
    [dbo].[Patient].[Name],
    [dbo].[Patient].[DateOfBirth],
    [dbo].[Patient].[Gender],
    [dbo].[Patient].[Email],
    [dbo].[Patient].[Phone],
    [dbo].[Patient].[Address],
    [dbo].[Patient].[City],
    [dbo].[Patient].[State],
    [dbo].[Patient].[IsActive],
    [dbo].[Patient].[Created],
    [dbo].[Patient].[Modified],
    [dbo].[Patient].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName
FROM [dbo].[Patient]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Patient].[UserID]
WHERE [dbo].[Patient].[IsActive] = 1
ORDER BY [dbo].[Patient].[Name]
END


-- EXEC PR_Patient_SelectByPK @PatientID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Patient_SelectByPK]
    @PatientID INT
AS
BEGIN
SELECT 
    [dbo].[Patient].[PatientID],
    [dbo].[Patient].[Name],
    [dbo].[Patient].[DateOfBirth],
    [dbo].[Patient].[Gender],
    [dbo].[Patient].[Email],
    [dbo].[Patient].[Phone],
    [dbo].[Patient].[Address],
    [dbo].[Patient].[City],
    [dbo].[Patient].[State],
    [dbo].[Patient].[IsActive],
    [dbo].[Patient].[Created],
    [dbo].[Patient].[Modified],
    [dbo].[Patient].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName
FROM [dbo].[Patient]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Patient].[UserID]
WHERE [dbo].[Patient].[PatientID] = @PatientID
END


-- EXEC PR_Patient_Insert @Name = 'Jevin', @DateOfBirth = '1990-01-01', @Gender = 'Female', @Email = 'jevin@example.com', @Phone = '1112223333', @Address = '123 Street', @City = 'CityX', @State = 'StateY', @IsActive = 1, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Patient_Insert]
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @IsActive BIT = 1,
    @UserID INT
AS
BEGIN
INSERT INTO [dbo].[Patient] (
    [Name],
    [DateOfBirth],
    [Gender],
    [Email],
    [Phone],
    [Address],
    [City],
    [State],
    [IsActive],
    [Modified],
    [UserID]
)
VALUES (
    @Name,
    @DateOfBirth,
    @Gender,
    @Email,
    @Phone,
    @Address,
    @City,
    @State,
    @IsActive,
    GETDATE(),
    @UserID
)
END


-- EXEC PR_Patient_UpdateByPK @PatientID = 1, @Name = 'Jevin Updated', @DateOfBirth = '1991-02-02', @Gender = 'Female', @Email = 'Jevin.new@example.com', @Phone = '9998887777', @Address = '456 New St', @City = 'NewCity', @State = 'NewState', @IsActive = 1, @UserID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Patient_UpdateByPK]
    @PatientID INT,
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
UPDATE [dbo].[Patient]
SET 
    [Name] = @Name,
    [DateOfBirth] = @DateOfBirth,
    [Gender] = @Gender,
    [Email] = @Email,
    [Phone] = @Phone,
    [Address] = @Address,
    [City] = @City,
    [State] = @State,
    [IsActive] = @IsActive,
    [Modified] = GETDATE(),
    [UserID] = @UserID
WHERE [dbo].[Patient].[PatientID] = @PatientID
END


-- EXEC PR_Patient_DeleteByPK @PatientID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Patient_DeleteByPK]
    @PatientID INT
AS
BEGIN
DELETE FROM [dbo].[Patient]
WHERE [dbo].[Patient].[PatientID] = @PatientID
END


-- SP for Appointment --

-- EXEC PR_Appointment_SelectAll
CREATE OR ALTER PROCEDURE [dbo].[PR_Appointment_SelectAll]
AS
BEGIN
SELECT 
    [dbo].[Appointment].[AppointmentID],
    [dbo].[Appointment].[DoctorID],
    [dbo].[Doctor].[Name] AS DoctorName,
    [dbo].[Appointment].[PatientID],
    [dbo].[Patient].[Name] AS PatientName,
    [dbo].[Appointment].[AppointmentDate],
    [dbo].[Appointment].[AppointmentStatus],
    [dbo].[Appointment].[Description],
    [dbo].[Appointment].[SpecialRemarks],
    [dbo].[Appointment].[Created],
    [dbo].[Appointment].[Modified],
    [dbo].[Appointment].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName,
    [dbo].[Appointment].[TotalConsultedAmount]
FROM [dbo].[Appointment]
INNER JOIN [dbo].[Doctor]
    ON [dbo].[Doctor].[DoctorID] = [dbo].[Appointment].[DoctorID]
INNER JOIN [dbo].[Patient]
    ON [dbo].[Patient].[PatientID] = [dbo].[Appointment].[PatientID]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Appointment].[UserID]
ORDER BY 
    [dbo].[Appointment].[AppointmentDate] DESC
END


-- EXEC PR_Appointment_SelectByPK @AppointmentID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Appointment_SelectByPK]
    @AppointmentID INT
AS
BEGIN
SELECT 
    [dbo].[Appointment].[AppointmentID],
    [dbo].[Appointment].[DoctorID],
    [dbo].[Doctor].[Name] AS DoctorName,
    [dbo].[Appointment].[PatientID],
    [dbo].[Patient].[Name] AS PatientName,
    [dbo].[Appointment].[AppointmentDate],
    [dbo].[Appointment].[AppointmentStatus],
    [dbo].[Appointment].[Description],
    [dbo].[Appointment].[SpecialRemarks],
    [dbo].[Appointment].[Created],
    [dbo].[Appointment].[Modified],
    [dbo].[Appointment].[UserID],
    [dbo].[User].[UserName] AS CreatedByUserName,
    [dbo].[Appointment].[TotalConsultedAmount]
FROM [dbo].[Appointment]
INNER JOIN [dbo].[Doctor]
    ON [dbo].[Doctor].[DoctorID] = [dbo].[Appointment].[DoctorID]
INNER JOIN [dbo].[Patient]
    ON [dbo].[Patient].[PatientID] = [dbo].[Appointment].[PatientID]
INNER JOIN [dbo].[User]
    ON [dbo].[User].[UserID] = [dbo].[Appointment].[UserID]
WHERE [dbo].[Appointment].[AppointmentID] = @AppointmentID
END


-- EXEC PR_Appointment_Insert @DoctorID = 1, @PatientID = 2, @AppointmentDate = '2025-06-30 14:00', @AppointmentStatus = 'Scheduled', @Description = 'Routine Checkup', @SpecialRemarks = 'None', @UserID = 1, @TotalConsultedAmount = 150.00
CREATE OR ALTER PROCEDURE [dbo].[PR_Appointment_Insert]
    @DoctorID INT,
    @PatientID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(20),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @UserID INT,
    @TotalConsultedAmount DECIMAL(5, 2) = NULL
AS
BEGIN
INSERT INTO [dbo].[Appointment] (
    [DoctorID],
    [PatientID],
    [AppointmentDate],
    [AppointmentStatus],
    [Description],
    [SpecialRemarks],
    [Modified],
    [UserID],
    [TotalConsultedAmount]
)
VALUES (
    @DoctorID,
    @PatientID,
    @AppointmentDate,
    @AppointmentStatus,
    @Description,
    @SpecialRemarks,
    GETDATE(),
    @UserID,
    @TotalConsultedAmount
)
END


-- EXEC PR_Appointment_UpdateByPK @AppointmentID = 1, @DoctorID = 2, @PatientID = 2, @AppointmentDate = '2025-07-01 10:00', @AppointmentStatus = 'Completed', @Description = 'Follow-up', @SpecialRemarks = 'Bring reports', @UserID = 1, @TotalConsultedAmount = 200.00
CREATE OR ALTER PROCEDURE [dbo].[PR_Appointment_UpdateByPK]
    @AppointmentID INT,
    @DoctorID INT,
    @PatientID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(20),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @UserID INT,
    @TotalConsultedAmount DECIMAL(5, 2)
AS
BEGIN
UPDATE [dbo].[Appointment]
SET 
    [DoctorID] = @DoctorID,
    [PatientID] = @PatientID,
    [AppointmentDate] = @AppointmentDate,
    [AppointmentStatus] = @AppointmentStatus,
    [Description] = @Description,
    [SpecialRemarks] = @SpecialRemarks,
    [Modified] = GETDATE(),
    [UserID] = @UserID,
    [TotalConsultedAmount] = @TotalConsultedAmount
WHERE [dbo].[Appointment].[AppointmentID] = @AppointmentID
END


-- EXEC PR_Appointment_DeleteByPK @AppointmentID = 1
CREATE OR ALTER PROCEDURE [dbo].[PR_Appointment_DeleteByPK]
    @AppointmentID INT
AS
BEGIN
DELETE FROM [dbo].[Appointment]
WHERE [dbo].[Appointment].[AppointmentID] = @AppointmentID
END