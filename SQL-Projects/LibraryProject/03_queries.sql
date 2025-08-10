USE LibraryDB;

-- 1. הצגת כל הספרים עם שמות המחברים
SELECT b.Title, a.Name AS Author, b.YearPublished, b.Genre
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID;

-- 2. הצגת כל ההשאלות עם פרטי משתמש וספר
SELECT u.FullName, b.Title, l.LoanDate, l.ReturnDate
FROM Loans l
JOIN Users u ON l.UserID = u.UserID
JOIN Books b ON l.BookID = b.BookID;

-- 3. ספרים שהושאלו יותר מפעם אחת
SELECT b.Title, COUNT(l.LoanID) AS TimesLoaned
FROM Loans l
JOIN Books b ON l.BookID = b.BookID
GROUP BY b.BookID
HAVING TimesLoaned > 1;



-- 4. ספרים שטרם הוחזרו (ReturnDate הוא NULL)
SELECT b.Title, u.FullName, l.LoanDate
FROM Loans l
JOIN Books b ON l.BookID = b.BookID
JOIN Users u ON l.UserID = u.UserID
WHERE l.ReturnDate IS NULL;


-- 5. ספירת כמה ספרים יש לכל ז'אנר
SELECT Genre, COUNT(*) AS NumberOfBooks
FROM Books
GROUP BY Genre
ORDER BY NumberOfBooks DESC;


