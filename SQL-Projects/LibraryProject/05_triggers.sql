
DELIMITER $$

CREATE TRIGGER PreventDuplicateLoan
BEFORE INSERT ON Loans
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Loans
        WHERE BookID = NEW.BookID
          AND UserID = NEW.UserID
          AND ReturnDate IS NULL
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This book is already loaned to this user and not yet returned.';
    END IF;
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER UpdateBookAvailabilityOnLoan
AFTER INSERT ON Loans
FOR EACH ROW
BEGIN
    UPDATE Books SET Genre = Genre -- אפשר לשים עמודת זמינות אמיתית במקום Genre
    WHERE BookID = NEW.BookID;
    -- כאן תוכל להוסיף עמודת זמינות ולשנות אותה ל'לא זמין'
END $$

DELIMITER ;


CREATE TABLE IF NOT EXISTS LoansLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    LoanID INT,
    BookID INT,
    UserID INT,
    LoanDate DATE,
    ReturnDate DATE,
    Action VARCHAR(50),
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER LogLoanInsert
AFTER INSERT ON Loans
FOR EACH ROW
BEGIN
    INSERT INTO LoansLog (LoanID, BookID, UserID, LoanDate, ReturnDate, Action)
    VALUES (NEW.LoanID, NEW.BookID, NEW.UserID, NEW.LoanDate, NEW.ReturnDate, 'INSERT');
END $$

DELIMITER ;


