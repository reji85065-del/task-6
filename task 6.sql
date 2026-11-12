
-- WEEK 6: PRODUCT REVIEW AND RATING MANAGEMENT SYSTEM

-- STEP 1: Select Database
USE ecommerce;


-- STEP 2: Create Review Table
CREATE TABLE IF NOT EXISTS Review (
    Review_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating INT NOT NULL,
    Review_Text VARCHAR(255),
    Review_Date DATE NOT NULL,

    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(id),

    FOREIGN KEY (Product_ID)
    REFERENCES Product(Product_ID),

    CHECK (Rating BETWEEN 1 AND 5)
);


-- STEP 3: Display Table Structure
DESC Review;


-- STEP 4: Insert Review Records
INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Text, Review_Date)
VALUES
('R101', 1, 101, 5, 'Excellent performance', '2026-11-10'),
('R102', 2, 102, 4, 'Good battery life', '2026-11-11'),
('R103', 1, 102, 3, 'Average product', '2026-11-12'),
('R104', 2, 101, 5, 'Very good quality', '2026-11-12');


-- STEP 5: Display All Reviews
SELECT * FROM Review;


-- STEP 6: Update Review Comments
UPDATE Review
SET Review_Text = 'Excellent product quality'
WHERE Review_ID = 'R101';


-- STEP 7: Delete a Review
DELETE FROM Review
WHERE Review_ID = 'R103';


-- STEP 8: Display All Reviews for a Product
SELECT Product.Product_Name, Review.Rating, Review.Review_Text
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID;


-- STEP 9: Display Customer Name with Reviews
SELECT Customer.name, Review.Review_Text, Review.Rating
FROM Customer
JOIN Review
ON Customer.id = Review.Customer_ID;


-- STEP 10: Find Products Having Maximum Reviews
SELECT Product_ID, COUNT(*) AS Total_Reviews
FROM Review
GROUP BY Product_ID
ORDER BY Total_Reviews DESC;


-- STEP 11: Display Recent Customer Feedback
SELECT *
FROM Review
ORDER BY Review_Date DESC;


-- STEP 12: Retrieve Reviews with Ratings Above 4
SELECT *
FROM Review
WHERE Rating > 4;


-- STEP 13: Calculate Average Rating for Each Product
SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID;


-- STEP 14: Count Number of Reviews per Product
SELECT Product_ID, COUNT(*) AS Total_Reviews
FROM Review
GROUP BY Product_ID;


-- STEP 15: Find Highest Rated Products
SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
ORDER BY Average_Rating DESC;


-- STEP 16: Products with Average Rating Above 4
SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating) > 4;


-- STEP 17: PRODUCT RATING ANALYSIS REPORT
SELECT
    Product.Product_Name,
    COUNT(Review.Review_ID) AS Total_Reviews,
    AVG(Review.Rating) AS Average_Rating
FROM Product
JOIN Review
ON Product.Product_ID = Review.Product_ID
GROUP BY Product.Product_ID, Product.Product_Name;


-- STEP 18: MOST REVIEWED PRODUCTS
SELECT Product_ID, COUNT(*) AS Total_Reviews
FROM Review
GROUP BY Product_ID
ORDER BY Total_Reviews DESC;


-- STEP 19: HIGHLY RATED PRODUCTS
SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating) >= 4;


-- STEP 20: PRODUCTS REQUIRING IMPROVEMENT
SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating) < 3;


-- STEP 21: NUMBER OF 5-STAR RATINGS
SELECT COUNT(*) AS Five_Star_Ratings
FROM Review
WHERE Rating = 5;


-- STEP 22: NUMBER OF 4-STAR RATINGS
SELECT COUNT(*) AS Four_Star_Ratings
FROM Review
WHERE Rating = 4;


-- STEP 23: NUMBER OF LOW RATINGS
SELECT COUNT(*) AS Low_Ratings
FROM Review
WHERE Rating <= 2;


-- STEP 24: FINAL REVIEW TABLE
SELECT * FROM Review;
