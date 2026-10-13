USE SupportOperations;
-- Open tickets by priority
SELECT Priority, COUNT(*) AS TicketCount FROM Tickets WHERE Status NOT IN('Resolved','Closed') GROUP BY Priority ORDER BY CASE Priority WHEN 'Critical' THEN 1 WHEN 'High' THEN 2 WHEN 'Medium' THEN 3 ELSE 4 END;
-- Agent workload
SELECT * FROM vw_OpenTicketWorkload ORDER BY OpenTickets DESC;
-- Average resolution time in hours
SELECT AVG(DATEDIFF(HOUR,CreatedAt,ResolvedAt)*1.0) AS AverageResolutionHours FROM Tickets WHERE ResolvedAt IS NOT NULL;
-- Departments generating the most tickets
SELECT d.Name, COUNT(t.TicketId) AS TicketCount FROM Departments d JOIN Customers c ON c.DepartmentId=d.DepartmentId JOIN Tickets t ON t.CustomerId=c.CustomerId GROUP BY d.Name ORDER BY TicketCount DESC;
-- Customer ticket history
SELECT c.FullName, t.TicketId, t.Title, t.Status, t.Priority, t.CreatedAt FROM Customers c JOIN Tickets t ON t.CustomerId=c.CustomerId ORDER BY c.FullName,t.CreatedAt DESC;
