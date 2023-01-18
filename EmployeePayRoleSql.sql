--create database
Create Database EmployeePayRoleADO
--Create table 
CREATE TABLE employeePayRoleTable(
Id INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(150) NOT NULL,
Salary BIGINT NOT NULL,
Gender Varchar(10) NOT NULL
);
--Insert data
INSERT INTO employeePayRoleTable(Name,Salary,Gender)VALUES
('Basha',1000000.00,'Male'),
('Pyari',1500000.00,'Female'),
('Shaik',2000000.00,'Male'),
('Shanas',2000000.00,'Female'),
('Pari',2000000.00,'Female');
SELECT * FROM employeePayRoleTable

-----------------------------------
Create Procedure fetchGetEmployees
As
Begin Try  
   select *from employeePayRoleTable
End Try
Begin Catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH
execute fetchGetEmployees
--Add data
Create procedure spAddNewEmpPayRoll
(  
  @Name VARCHAR(50),
  @Salary BIGINT,
  @Gender Varchar(50)
)  
As
Begin Try  
   INSERT INTO employeePayRoleTable (Name,Salary,Gender)VALUES(@Name,@Salary,@Gender)
End Try
Begin Catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH
execute spAddNewEmpPayRoll 'Shaik',435355,'Male'


--UpdateData
Create procedure spUpdateEmpDetails  
(  
   @Id int,
   @Name VARCHAR(50),
  @Salary BIGINT,
  @Gender Varchar(50)  
)  
As
Begin Try  
   Update employeePayRoleTable set Name=@Name,Salary=@Salary,Gender=@Gender where Id=@Id  
End Try
Begin Catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH
execute spUpdateEmpDetails 8,'Basha',353255,'Male'

--Delete data
Create procedure spDeleteEmpByIdEmployee 
(  
   @Id int  
)  
As
Begin Try  
  DELETE FROM employeePayRoleTable WHERE Id = @Id
End Try
Begin Catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH
execute spDeleteEmpByIdEmployee 8
--------------------------------------------------------
--Uc8
--EMPLOYEE TABLE
CREATE TABLE EmployeeDetail_one(
EmpId INT PRIMARY KEY IDENTITY(1,1),
EmpName VARCHAR(150) NOT NULL,
Gender VARCHAR(10) NOT NULL,
);
------------Data insert----------------
INSERT INTO EmployeeDetail_one(EmpName,Gender)VALUES('Basha','Female');
INSERT INTO EmployeeDetail_one(EmpName,Gender)VALUES('Pyari','Male');
INSERT INTO EmployeeDetail_one(EmpName,Gender)VALUES('Shaik','Male');
INSERT INTO EmployeeDetail_one(EmpName,Gender)VALUES('Shanas','Female');
INSERT INTO EmployeeDetail_one(EmpName,Gender)VALUES('Pari','Male');
---Display---
SELECT *FROM EmployeeDetail_one;

-- Salary Table
CREATE TABLE Salary_two(
BasicPay BIGINT DEFAULT(000),
Deduction BIGINT DEFAULT(000),
Tax BIGINT DEFAULT(000),
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail_one(EmpId),
NetPay Bigint 
);
INSERT INTO Salary_two(BasicPay,Deduction,Tax,EmpId) VALUES(10000000,2000,34333,1);
INSERT INTO Salary_two(BasicPay,Deduction,Tax,EmpId) VALUES(20000000,5000,3435,2);

INSERT INTO Salary_two(BasicPay,Deduction,Tax,EmpId) VALUES(1000000,4000,31333,3);

INSERT INTO Salary_two(BasicPay,Deduction,Tax,EmpId) VALUES(10000000,2000,34333,4);
UPDATE Salary_two SET NetPay = (BasicPay-Tax-Deduction);
SELECT *FROM Salary_two;

SELECT * FROM EmployeeDetail_one AS C
FULL OUTER JOIN Salary_two AS D ON C.EmpId=D.EmpId; 