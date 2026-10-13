CREATE DATABASE SupportOperations;
GO
USE SupportOperations;
GO
CREATE TABLE Departments (DepartmentId INT IDENTITY PRIMARY KEY, Name NVARCHAR(80) NOT NULL UNIQUE);
CREATE TABLE Agents (AgentId INT IDENTITY PRIMARY KEY, FullName NVARCHAR(120) NOT NULL, Email NVARCHAR(160) NOT NULL UNIQUE, DepartmentId INT NOT NULL REFERENCES Departments(DepartmentId), IsActive BIT NOT NULL DEFAULT 1);
CREATE TABLE Customers (CustomerId INT IDENTITY PRIMARY KEY, FullName NVARCHAR(120) NOT NULL, Email NVARCHAR(160) NOT NULL UNIQUE, DepartmentId INT NULL REFERENCES Departments(DepartmentId));
CREATE TABLE Tickets (TicketId INT IDENTITY PRIMARY KEY, Title NVARCHAR(200) NOT NULL, Description NVARCHAR(MAX) NULL, Priority NVARCHAR(20) NOT NULL CHECK(Priority IN('Low','Medium','High','Critical')), Status NVARCHAR(20) NOT NULL DEFAULT 'Open' CHECK(Status IN('Open','In Progress','Resolved','Closed')), CustomerId INT NOT NULL REFERENCES Customers(CustomerId), AgentId INT NULL REFERENCES Agents(AgentId), CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(), ResolvedAt DATETIME2 NULL);
CREATE TABLE TicketComments (CommentId INT IDENTITY PRIMARY KEY, TicketId INT NOT NULL REFERENCES Tickets(TicketId) ON DELETE CASCADE, AgentId INT NOT NULL REFERENCES Agents(AgentId), CommentText NVARCHAR(1000) NOT NULL, CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME());
CREATE INDEX IX_Tickets_StatusPriority ON Tickets(Status, Priority); CREATE INDEX IX_Tickets_Customer ON Tickets(CustomerId);
GO
CREATE VIEW vw_OpenTicketWorkload AS SELECT a.FullName AS Agent, COUNT(t.TicketId) AS OpenTickets, SUM(CASE WHEN t.Priority='Critical' THEN 1 ELSE 0 END) AS CriticalTickets FROM Agents a LEFT JOIN Tickets t ON a.AgentId=t.AgentId AND t.Status NOT IN('Resolved','Closed') GROUP BY a.FullName;
