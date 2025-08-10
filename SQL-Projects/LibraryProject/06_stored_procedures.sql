

DELIMITER $$

CREATE PROCEDURE AddUser(
    IN p_FullName VARCHAR(100),
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(20)
)
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = p_Email) THEN
        INSERT INTO Users (FullName, Email, Phone) VALUES (p_FullName, p_Email, p_Phone);
        SELECT 'User added successfully.' AS Message;
    ELSE
        SELECT 'Email already exists.' AS Message;
    END IF;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE UpdateUserPhone(
    IN p_Email VARCHAR(100),
    IN p_NewPhone VARCHAR(20)
)
BEGIN
    UPDATE Users SET Phone = p_NewPhone WHERE Email = p_Email;
    SELECT 'Phone updated.' AS Message;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE GetLoansByUserEmail(
    IN p_Email VARCHAR(100)
)
BEGIN
    SELECT b.Title, l.LoanDate, l.ReturnDate
    FROM Loans l
    JOIN Users u ON l.UserID = u.UserID
    JOIN Books b ON l.BookID = b.BookID
    WHERE u.Email = p_Email;
END $$

DELIMITER ;
