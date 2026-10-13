USE SupportOperations;
INSERT INTO Departments(Name) VALUES ('Finance'),('Operations'),('Marketing'),('People');
INSERT INTO Agents(FullName,Email,DepartmentId) VALUES ('Alex Morgan','alex@support.local',1),('Sam Williams','sam@support.local',2),('Jordan Lee','jordan@support.local',3);
INSERT INTO Customers(FullName,Email,DepartmentId) VALUES ('Maya Patel','maya@company.local',1),('Daniel Smith','daniel@company.local',2),('Lerato Mokoena','lerato@company.local',3);
INSERT INTO Tickets(Title,Description,Priority,Status,CustomerId,AgentId) VALUES ('Shared finance drive unavailable','Team cannot access monthly reports','High','In Progress',1,1),('Laptop replacement request','Battery no longer holds charge','Medium','Open',2,2),('Email account locked','User requires account reset','Critical','Resolved',3,3);
INSERT INTO TicketComments(TicketId,AgentId,CommentText) VALUES (1,1,'Investigating permissions and network access.'),(3,3,'Identity verified and account unlocked.');
