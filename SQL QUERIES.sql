CREATE DATABASE EmployeeDB;
GO

USE EmployeeDB;
GO

-- Admins Table
CREATE TABLE Admins (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50),
    Password NVARCHAR(50),
    adminKey UNIQUEIDENTIFIER DEFAULT NEWID()
);

-- Departments Table
CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100),
    adminKey UNIQUEIDENTIFIER
);

-- Notices Table
CREATE TABLE Notices (
    NoticeId INT PRIMARY KEY IDENTITY(1,1),
    DepartmentId INT,
    NoticeText NVARCHAR(MAX),
    PublishDate DATE,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY IDENTITY(1,1),
    EmployeeCode NVARCHAR(50),
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    DepartmentId INT,
    SecretCode NVARCHAR(50),
    Salary DECIMAL(18,2),
    EmployeeImage VARBINARY(MAX),
    adminKey UNIQUEIDENTIFIER,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);

-- EmployeeRequests Table
CREATE TABLE EmployeeRequests (
    RequestId INT PRIMARY KEY IDENTITY(1,1),
    EmployeeCode NVARCHAR(50),
    RequestType NVARCHAR(50),
    Reason NVARCHAR(500),
    RequestDate DATE,
    Status NVARCHAR(50),
    EmployeeId INT,
    adminKey UNIQUEIDENTIFIER,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);

-- WorkingDates Table
CREATE TABLE WorkingDates (
    WorkDate DATE PRIMARY KEY,
    IsWorkingDay BIT,
    adminKey UNIQUEIDENTIFIER
);

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceId INT PRIMARY KEY IDENTITY(1,1),
    EmployeeId INT,
    EmployeeCode NVARCHAR(50),
    AttendanceDate DATE,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId)
);
