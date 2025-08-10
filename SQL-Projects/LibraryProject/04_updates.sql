USE LibraryDB;

-- 1. עדכון מספר טלפון למשתמש ספציפי
UPDATE Users
SET Phone = '0520000000'
WHERE Email = 'david.cohen@example.com';

-- 2. סימון החזרת ספר: עדכון תאריך החזרה של השאלה שלא הוחזרה עד כה
UPDATE Loans
SET ReturnDate = CURDATE()
WHERE ReturnDate IS NULL
AND LoanDate < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 3. מחיקת השאלות שהוחזרו לפני יותר משנה (נקיון)
DELETE FROM Loans
WHERE ReturnDate IS NOT NULL
AND ReturnDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 4. הכנסת משתמש חדש רק אם האימייל לא קיים כבר (הימנעות מכפילויות)
INSERT INTO Users (FullName, Email, Phone)
SELECT 'New User', 'newuser@example.com', '0551234567'
WHERE NOT EXISTS (
    SELECT 1 FROM Users WHERE Email = 'newuser@example.com'
);

-- 5. הוספת עמודה חדשה לטבלת Users (אם היא לא קיימת)
ALTER TABLE Users
ADD COLUMN MembershipLevel VARCHAR(20) DEFAULT 'Basic';

-- 6. שינוי סוג עמודה עם טרנזקציה (הבטחת עקביות)
START TRANSACTION;

ALTER TABLE Books
MODIFY Genre VARCHAR(100);

COMMIT;
