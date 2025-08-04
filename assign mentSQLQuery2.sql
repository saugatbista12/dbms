
CREATE DATABASE career_development_cell;
USE career_development_cell;


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,                    
    DepartmentName VARCHAR(100) UNIQUE NOT NULL       
);


INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mechanical'),
(4, 'Civil Engineering'),
(5, 'Business Administration');

SELECT * FROM Departments;


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,                       
    FullName VARCHAR(100) NOT NULL,                   
    CGPA DECIMAL(3,2) CHECK (CGPA BETWEEN 0 AND 10), 
    DepartmentID INT NOT NULL,                         
    Email VARCHAR(100) UNIQUE NOT NULL,                
    Status VARCHAR(20) DEFAULT 'Unplaced',            
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Students (StudentID, FullName, CGPA, DepartmentID, Email, Status) VALUES
(1, 'Anil Gurung', 8.7, 1, 'anil.gurung@univ.edu', 'Placed'),
(2, 'Sunita Rai', 9.1, 2, 'sunita.rai@univ.edu', 'Placed'),
(3, 'Bibek Thapa', 7.2, 1, 'bibek.thapa@univ.edu', 'Unplaced'),
(4, 'Manish Shrestha', 6.9, 3, 'manish.shrestha@univ.edu', 'Unplaced'),
(5, 'Pooja Sharma', 8.0, 2, 'pooja.sharma@univ.edu', 'Placed'),
(6, 'Raj Koirala', 7.5, 4, 'raj.koirala@univ.edu', 'Unplaced'),
(7, 'Sita Lama', 8.9, 5, 'sita.lama@univ.edu', 'Placed'),
(8, 'Binod Adhikari', 6.5, 3, 'binod.adhikari@univ.edu', 'Unplaced'),
(9, 'Maya Gautam', 9.3, 1, 'maya.gautam@univ.edu', 'Placed'),
(10, 'Dipesh Thapa', 7.8, 2, 'dipesh.thapa@univ.edu', 'Placed');

SELECT * FROM Students;

CREATE TABLE CDC_Staff (
    StaffID INT PRIMARY KEY,                  
    Name VARCHAR(100) NOT NULL,               
    Role VARCHAR(50),                        
    Email VARCHAR(100) UNIQUE                  
);

CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY,               
    CompanyName VARCHAR(100) UNIQUE NOT NULL,
    Location VARCHAR(100) NOT NULL            
);


INSERT INTO Companies (CompanyID, CompanyName, Location) VALUES
(1, 'Google', 'California'),
(2, 'Amazon', 'Seattle'),
(3, 'Deerwalk', 'Kathmandu'),
(4, 'Microsoft', 'Redmond'),
(5, 'Facebook', 'Menlo Park'),
(6, 'IBM', 'New York'),
(7, 'Intel', 'Santa Clara'),
(8, 'Tesla', 'Palo Alto'),
(9, 'Apple', 'Cupertino'),
(10, 'Salesforce', 'San Francisco');

CREATE TABLE InternshipOffers (
    InternshipID INT PRIMARY KEY,              
    CompanyID INT NOT NULL,                     
    Title VARCHAR(100),                         
    DurationMonths INT,                        
    Stipend DECIMAL(8,2),                       
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);


INSERT INTO InternshipOffers (InternshipID, CompanyID, Title, DurationMonths, Stipend) VALUES
(1, 1, 'Software Engineering Intern', 6, 1500.00),
(2, 2, 'Data Analyst Intern', 3, 1200.00),
(3, 3, 'Web Developer Intern', 4, 1000.00),
(4, 4, 'Product Manager Intern', 6, 1400.00),
(5, 5, 'UX Designer Intern', 5, 1300.00),
(6, 1, 'AI Research Intern', 6, 1600.00),
(7, 6, 'Cloud Engineer Intern', 3, 1100.00),
(8, 7, 'Hardware Engineer Intern', 4, 1200.00),
(9, 8, 'Mechanical Intern', 6, 1000.00),
(10, 9, 'Mobile Developer Intern', 5, 1400.00);

CREATE TABLE PlacementOffers (
    PlacementID INT PRIMARY KEY,              
    CompanyID INT NOT NULL,                    
    Title VARCHAR(100),                         
    PackageLPA DECIMAL(6,2),                   
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);


INSERT INTO PlacementOffers (PlacementID, CompanyID, Title, PackageLPA) VALUES
(1, 1, 'Software Engineer', 25.00),
(2, 2, 'Data Scientist', 22.00),
(3, 3, 'Frontend Developer', 15.00),
(4, 4, 'Product Manager', 24.00),
(5, 5, 'UI Designer', 20.00),
(6, 6, 'System Analyst', 18.00),
(7, 7, 'Hardware Engineer', 16.00),
(8, 8, 'Mechanical Engineer', 17.00),
(9, 9, 'Mobile Developer', 23.00),
(10, 10, 'Salesforce Consultant', 21.00);


CREATE TABLE Applications (
    ApplicationID INT PRIMARY KEY,                  
    StudentID INT NOT NULL,                         
    OfferType VARCHAR(10) CHECK (OfferType IN ('Internship', 'Placement')),  
    OfferID INT NOT NULL,                          
    ApplicationDate DATE NOT NULL,                
    Status VARCHAR(20) DEFAULT 'In Process',       
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Applications (ApplicationID, StudentID, OfferType, OfferID, ApplicationDate, Status) VALUES
(1, 1, 'Placement', 1, '2025-01-10', 'Selected'),
(2, 2, 'Placement', 2, '2025-01-12', 'Rejected'),
(3, 3, 'Internship', 3, '2025-02-01', 'In Process'),
(4, 4, 'Internship', 4, '2025-01-20', 'Rejected'),
(5, 5, 'Placement', 5, '2025-01-22', 'Selected'),
(6, 6, 'Internship', 7, '2025-02-15', 'In Process'),
(7, 7, 'Placement', 10, '2025-01-25', 'Selected'),
(8, 8, 'Internship', 8, '2025-02-05', 'Rejected'),
(9, 9, 'Placement', 9, '2025-01-18', 'Selected'),
(10, 10, 'Placement', 1, '2025-01-30', 'In Process'),
(11, 3, 'Placement', 3, '2025-02-20', 'Rejected'),
(12, 1, 'Internship', 6, '2025-01-15', 'Selected'),
(13, 2, 'Internship', 2, '2025-01-10', 'Selected'),
(14, 5, 'Internship', 5, '2025-01-28', 'Rejected'),
(15, 9, 'Internship', 10, '2025-02-02', 'Selected');


SELECT * FROM Applications;


CREATE TABLE Interviews (
    RoundID INT PRIMARY KEY,                 
    ApplicationID INT NOT NULL,              
    RoundName VARCHAR(50),                   
    RoundDate DATE,                         
    Result VARCHAR(20),                      
    FOREIGN KEY (ApplicationID) REFERENCES Applications(ApplicationID)
);

INSERT INTO Interviews (RoundID, ApplicationID, RoundName, RoundDate, Result) VALUES
(1, 1, 'Technical Round', '2025-01-15', 'Passed'),
(2, 1, 'HR Round', '2025-01-20', 'Passed'),
(3, 2, 'Technical Round', '2025-01-17', 'Failed'),
(4, 3, 'Technical Round', '2025-02-10', 'Pending'),
(5, 5, 'Technical Round', '2025-01-28', 'Passed'),
(6, 7, 'HR Round', '2025-01-30', 'Passed'),
(7, 9, 'Technical Round', '2025-01-25', 'Passed'),
(8, 12, 'Technical Round', '2025-01-18', 'Passed'),
(9, 13, 'HR Round', '2025-01-22', 'Passed'),
(10, 15, 'Technical Round', '2025-02-10', 'Passed');


SELECT * FROM Interviews;


CREATE TABLE CompanyFeedback (
    FeedbackID INT PRIMARY KEY,              
    ApplicationID INT NOT NULL,              
    Comments TEXT,                          
    Rating INT CHECK (Rating BETWEEN 1 AND 5),  
    FOREIGN KEY (ApplicationID) REFERENCES Applications(ApplicationID)
);


INSERT INTO CompanyFeedback (FeedbackID, ApplicationID, Comments, Rating) VALUES
(1, 1, 'Excellent technical skills and communication.', 5),
(2, 2, 'Needs improvement in problem solving.', 2),
(3, 3, 'Good potential but lacks experience.', 3),
(4, 5, 'Strong candidate with relevant skills.', 4),
(5, 7, 'Good attitude and quick learner.', 4),
(6, 9, 'Very knowledgeable and team player.', 5),
(7, 12, 'Outstanding performance in interview.', 5),
(8, 13, 'Average communication skills.', 3),
(9, 15, 'Promising candidate for future roles.', 4);


SELECT * FROM CompanyFeedback;


SELECT d.DepartmentName, COUNT(*) AS PlacedCount
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
WHERE s.Status = 'Placed'
GROUP BY d.DepartmentName;


SELECT Status, AVG(CGPA) AS AverageCGPA
FROM Students
GROUP BY Status;


SELECT c.CompanyName, COUNT(io.InternshipID) AS InternshipCount
FROM Companies c
LEFT JOIN InternshipOffers io ON c.CompanyID = io.CompanyID
GROUP BY c.CompanyName;


SELECT s.FullName, d.DepartmentName, c.CompanyName
FROM Students s
JOIN Departments d ON s.DepartmentID = d.DepartmentID
JOIN Applications a ON s.StudentID = a.StudentID
JOIN PlacementOffers p ON a.OfferID = p.PlacementID
JOIN Companies c ON p.CompanyID = c.CompanyID
WHERE a.Status = 'Selected' AND a.OfferType = 'Placement';


SELECT c.CompanyName, s.FullName
FROM Companies c
JOIN InternshipOffers io ON c.CompanyID = io.CompanyID
JOIN Applications a ON a.OfferID = io.InternshipID AND a.OfferType = 'Internship'
JOIN Students s ON a.StudentID = s.StudentID
UNION
SELECT c.CompanyName, s.FullName
FROM Companies c
JOIN PlacementOffers po ON c.CompanyID = po.CompanyID
JOIN Applications a ON a.OfferID = po.PlacementID AND a.OfferType = 'Placement'
JOIN Students s ON a.StudentID = s.StudentID
ORDER BY CompanyName, FullName;


SELECT DISTINCT s.StudentID, s.FullName
FROM Students s
JOIN Applications a1 ON s.StudentID = a1.StudentID AND a1.OfferType = 'Internship' AND a1.Status = 'Selected'
JOIN Applications a2 ON s.StudentID = a2.StudentID AND a2.OfferType = 'Placement' AND a2.Status = 'Selected';


SELECT DISTINCT s.StudentID, s.FullName
FROM Students s
JOIN Applications a ON s.StudentID = a.StudentID
WHERE a.OfferType = 'Internship'
UNION
SELECT DISTINCT s.StudentID, s.FullName
FROM Students s
JOIN Applications a ON s.StudentID = a.StudentID
WHERE a.OfferType = 'Placement';


SELECT DISTINCT c.CompanyID, c.CompanyName
FROM Companies c
JOIN InternshipOffers io ON c.CompanyID = io.CompanyID
UNION
SELECT DISTINCT c.CompanyID, c.CompanyName
FROM Companies c

