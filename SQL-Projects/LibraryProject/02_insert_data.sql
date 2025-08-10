USE LibraryDB;

-- הכנסת מחברים
INSERT INTO Authors (Name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Isaac Asimov'),
('Agatha Christie'),
('Stephen King'),
('Jane Austen');

-- הכנסת ספרים עם פרטים נוספים
INSERT INTO Books (Title, AuthorID, YearPublished, Genre) VALUES
('Harry Potter and the Philosopher''s Stone', 1, 1997, 'Fantasy'),
('Harry Potter and the Chamber of Secrets', 1, 1998, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('Animal Farm', 2, 1945, 'Political Satire'),
('Foundation', 3, 1951, 'Science Fiction'),
('Murder on the Orient Express', 4, 1934, 'Mystery'),
('The Shining', 5, 1977, 'Horror'),
('Pride and Prejudice', 6, 1813, 'Romance');

-- הכנסת משתמשים עם פרטים
INSERT INTO Users (FullName, Email, Phone) VALUES
('David Cohen', 'david.cohen@example.com', '0501234567'),
('Sarah Levi', 'sarah.levi@example.com', '0527654321'),
('Michael Bar', 'michael.bar@example.com', '0549876543'),
('Rachel Green', 'rachel.green@example.com', '0507654321');

-- הכנסת השאלות
INSERT INTO Loans (BookID, UserID, LoanDate, ReturnDate) VALUES
(1, 1, '2025-08-01', NULL),
(2, 2, '2025-07-20', '2025-08-05'),
(3, 3, '2025-06-15', '2025-07-01'),
(6, 4, '2025-08-10', NULL),
(7, 1, '2025-07-25', '2025-08-01');
