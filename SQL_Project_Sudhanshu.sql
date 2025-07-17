Use [E-commerce];

SELECT * FROM Customers;

Create table Products(
	ProductId int Primary key ,
	ProductName VARCHAR(100) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	StockQuantity INT NOT NULL,
	CategoryID INT,
	FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);

SELECT * FROM Products;

CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR (100) NOT NULL ,
	Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	OrderDate DATE NOT NULL
);

CREATE TABLE OrderDetails(
	DetailID INT PRIMARY KEY,
	OrderID INT,
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	ProductID INT,
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
	Quantity INT
);

CREATE TABLE Reviews(
	ReviewID INT PRIMARY KEY,
	ProductID INT,
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
	CustomerID INT,
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	Rating INT CHECK (Rating BETWEEN 1 AND 5),
	Comment TEXT
);

CREATE TABLE Shipping(
	ShippingID INT PRIMARY KEY,
	OrderId INT,
	FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
	ShipDate DATE,
	DeliveryDate DATE
);

CREATE TABlE Discounts(
	DiscountID INT PRIMARY KEY,
	ProductID INT,
	FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
	DiscountAmount DECIMAL(10,2)
);

SELECT * FROM Products;

INSERT INTO Products(ProductId, ProductName, Price, StockQuantity, CategoryID)
VALUES 
	(101, 'Laptop', 50000.00, 7, 1),  -- 1 for Electronics
	(102, 'NoteBook', 500.00, 50, 2),  -- 2 for Stationary
	(103, 'Sofa', 45000.00, 10, 3),  -- 3 for HouseHold
	(104, 'Office Chair', 7999.00, 15, 4),  -- 4 for Office
	(105, 'Gas Stove', 17999.00, 12, 5),  -- 5 for Kitchen
	(106, 'Jeans', 1499.00, 150, 6),  -- 6 for Fashion
	(107, 'Football', 1799.00, 250, 7),  -- 7 for Sports
	(108, 'Trimmer', 2000.00, 45, 8),  -- 8 for Grooming
	(109, 'Whey', 5400.00, 76, 9),  -- 9 for Health & Nutrition
	(110, 'Lipstick', 700.00, 200, 10),  -- 10 for Beauty
	(201, 'Mouse', 7000.00, 20, 1),  
	(202, 'Pen', 20.00, 500, 2),  
	(203, 'Dinning Table', 65000.00, 30, 3),  
	(204, 'Desk', 12999.00, 20, 4),  
	(205, 'Oven', 37000.00, 24, 5),  
	(206, 'Tshirt', 599.00, 250, 6),  
	(207, 'Bat', 3000.00, 150, 7),  
	(208, 'Beard Oil', 700.00, 95, 8),  
	(209, 'Yoga Mat', 699.00, 100, 9),  
	(210, 'Serum', 700.00, 200, 10),
	(301, 'TV', 70000.00, 35, 1),  
	(302, 'Pencil', 8.00, 500, 2),  
	(303, 'Chair', 5000.00, 70, 3),  
	(304, 'A4 Printing Paper', 350.00, 120, 4),  
	(305, 'Non-Stick Pan', 3000.00, 204, 5),  
	(306, 'Shirt', 900.00, 170, 6),  
	(307, 'VolleyBall', 2500.00, 50, 7),  
	(308, 'Comb', 700.00, 95, 8),  
	(309, 'Creatine', 500.00, 130, 9),  
	(310, 'Face Cream', 400.00, 150, 10),
	(401, 'Keyboard', 2000.00, 50, 1),  
	(402, 'Textbook', 200.00, 50, 2),  
	(403, 'Matress', 20000.00, 40, 3),  
	(404, 'File Folders', 120.00, 280, 4),  
	(405, 'Electric Kettle', 1199.00, 50, 5),  
	(406, 'Blazer', 5599.00, 70, 6),  
	(407, 'Stumps', 5000.00, 450, 7),  
	(408, 'Shaving Foam', 270.00, 90, 8),  
	(409, 'Fish Oil tablets', 750.00, 170, 9),  
	(410, 'Moisturizer', 300.00, 110, 10),
	(501, 'Ceiling Fan', 5999.00, 220, 1),  
	(502, 'A4 Size Chart paper', 10.00, 700, 2),  
	(503, 'Curtains', 3000.00, 80, 3),  
	(504, 'ffice Scissors', 90.00, 80, 4),  
	(505, 'Cooker', 7000.00, 130, 5),  
	(506, 'Jeans', 1499.00, 350, 6),  
	(507, 'Badminton', 1500.00, 90, 7),  
	(508, '	Hair Styling Gel', 250.00, 85, 8),  
	(509, 'Multivitamin Tablets', 599.00, 70, 9),  
	(510, 'Skin Brightening Cream', 490.00, 76, 10)
;

INSERT INTO Categories(CategoryID, CategoryName)
VALUES 
	(1, 'Electronics'),
	(2, 'Stationary'),
	(3, 'HouseHold'),
	(4, 'Office'),
	(5, 'Kitchen'),
	(6, 'Fashion'),
	(7, 'Sports'),
	(8, 'Grooming'),
	(9, 'Health & Nutrition'),
	(10, 'Beauty')
;

SELECT * FROM Customers;

INSERT INTO Customers(CustomerID, CustomerName, Email)
VALUES
	(1, 'Alice Parker', 'aliceparker@gmail.com'),
	(2, 'Neha Verma', 'neha.verma@example.com'),
	(3, 'Rohan Kapoor', 'rohan.kapoor@example.com'),
	(4, 'Priya Mehta', 'priya.mehta@example.com'),
	(5, 'Kunal Singh', 'kunal.singh@example.com'),
	(6, 'Isha Gupta', 'isha.gupta@example.com'),
	(7, 'Vikram Joshi', 'vikram.joshi@example.com'),
	(8, 'Sneha Reddy', 'sneha.reddy@example.com'),
	(9, 'Ankit Yadav', 'ankit.yadav@example.com'),
	(10, 'Megha Bansal', 'megha.bansal@example.com'),
	(11, 'Rahul Sinha', 'rahul.sinha@example.com'),
	(12, 'Kriti Rao', 'kriti.rao@example.com'),
	(13, 'Tanya Desai', 'tanya.desai@example.com'),
	(14, 'Varun Patel', 'varun.patel@example.com'),
	(15, 'Sanya Khan', 'sanya.khan@example.com'),
	(16, 'Nikhil Jain', 'nikhil.jain@example.com'),
	(17, 'Divya Iyer', 'divya.iyer@example.com'),
	(18, 'Arjun Thakur', 'arjun.thakur@example.com'),
	(19, 'Reena Malhotra', 'reena.malhotra@example.com'),
	(20, 'Yash Dubey', 'yash.dubey@example.com'),
	(21, 'Preeti Nair', 'preeti.nair@example.com'),
	(22, 'Manav Shetty', 'manav.shetty@example.com'),
	(23, 'Aditi Kulkarni', 'aditi.kulkarni@example.com'),
	(24, 'Ritika Mishra', 'ritika.mishra@example.com'),
	(25, 'Siddharth Sen', 'siddharth.sen@example.com'),
	(26, 'Rhea Ghosh', 'rhea.ghosh@example.com'),
	(27, 'Mohit Deshmukh', 'mohit.deshmukh@example.com'),
	(28, 'Ananya Saxena', 'ananya.saxena@example.com'),
	(29, 'Karan Chatterjee', 'karan.chatterjee@example.com'),
	(30, 'Lavanya Das', 'lavanya.das@example.com'),
	(31, 'Harshita Pandey', 'harshita.pandey@example.com'),
	(32, 'Tanmay Rao', 'tanmay.rao@example.com'),
	(33, 'Bhavna Kaur', 'bhavna.kaur@example.com'),
	(34, 'Devang Arora', 'devang.arora@example.com'),
	(35, 'Simran Chopra', 'simran.chopra@example.com'),
	(36, 'Raghav Nanda', 'raghav.nanda@example.com'),
	(37, 'Srishti Vohra', 'srishti.vohra@example.com'),
	(38, 'Akash Bhatia', 'akash.bhatia@example.com'),
	(39, 'Nikita Lohia', 'nikita.lohia@example.com'),
	(40, 'Aman Goel', 'aman.goel@example.com'),
	(41, 'Shruti Menon', 'shruti.menon@example.com'),
	(42, 'Zoya Qureshi', 'zoya.qureshi@example.com'),
	(43, 'Tejas Pillai', 'tejas.pillai@example.com'),
	(44, 'Avni Kaul', 'avni.kaul@example.com'),
	(45, 'Dhruv Sethi', 'dhruv.sethi@example.com'),
	(46, 'Pooja Salvi', 'pooja.salvi@example.com'),
	(47, 'Gaurav Wagh', 'gaurav.wagh@example.com'),
	(48, 'Asmita Rane', 'asmita.rane@example.com'),
	(49, 'Rohit Vora', 'rohit.vora@example.com'),
	(50, 'Shivani Pathak', 'shivani.pathak@example.com'),
	(51, 'Yuvraj Mehra', 'yuvraj.mehra@example.com'),
	(52, 'Kashish Agarwal', 'kashish.agarwal@example.com'),
	(53, 'Aarohi Shah', 'aarohi.shah@example.com'),
	(54, 'Jayant Tiwari', 'jayant.tiwari@example.com'),
	(55, 'Vani Saxena', 'vani.saxena@example.com'),
	(56, 'Ritesh Bhatt', 'ritesh.bhatt@example.com'),
	(57, 'Ishita Khanna', 'ishita.khanna@example.com'),
	(58, 'Sarthak Kapoor', 'sarthak.kapoor@example.com'),
	(59, 'Palak Mahajan', 'palak.mahajan@example.com'),
	(60, 'Ankit Jha', 'ankit.jha@example.com'),
	(61, 'Hiral Jetwa', 'hiral.jethwa@example.com'),
	(62, 'Aaravi Sharma', 'aaravi.sharma@example.com')
;

SELECT * FROM Orders;

INSERT INTO Orders(OrderID, CustomerID, OrderDate)
VALUES
	(1001, 5, '2025-01-10'),
	(1002, 12, '2025-01-11'),
	(1003, 23, '2025-01-12'),
	(1004, 7, '2025-01-14'),
	(1005, 19, '2025-01-16'),
	(1006, 4, '2025-01-17'),
	(1007, 30, '2025-01-20'),
	(1008, 17, '2025-01-21'),
	(1009, 9, '2025-01-23'),
	(1010, 13, '2025-01-25'),
	(1011, 25, '2025-01-26'),
	(1012, 14, '2025-01-28'),
	(1013, 3, '2025-02-02'),
	(1014, 28, '2025-02-04'),
	(1015, 10, '2025-02-06'),
	(1016, 21, '2025-02-07'),
	(1017, 2, '2025-02-09'),
	(1018, 11, '2025-02-11'),
	(1019, 31, '2025-02-12'),
	(1020, 6, '2025-02-14'),
	(1021, 8, '2025-02-15'),
	(1022, 33, '2025-02-17'),
	(1023, 16, '2025-02-20'),
	(1024, 1, '2025-02-21'),
	(1025, 27, '2025-02-22'),
	(1026, 18, '2025-02-24'),
	(1027, 26, '2025-02-25'),
	(1028, 29, '2025-02-27'),
	(1029, 22, '2025-03-01'),
	(1030, 34, '2025-03-02'),
	(1031, 15, '2025-03-04'),
	(1032, 24, '2025-03-05'),
	(1033, 32, '2025-03-07'),
	(1034, 38, '2025-03-08'),
	(1035, 20, '2025-03-09'),
	(1036, 36, '2025-03-10'),
	(1037, 39, '2025-03-11'),
	(1038, 35, '2025-03-13'),
	(1039, 40, '2025-03-15'),
	(1040, 37, '2025-03-16'),
	(1041, 41, '2025-03-17'),
	(1042, 43, '2025-03-19'),
	(1043, 42, '2025-03-21'),
	(1044, 44, '2025-03-22'),
	(1045, 45, '2025-03-23'),
	(1046, 46, '2025-03-24'),
	(1047, 47, '2025-03-26'),
	(1048, 48, '2025-03-27'),
	(1049, 49, '2025-03-28'),
	(1050, 50, '2025-03-30'),
	(1051, 51, '2025-04-01'),
	(1052, 52, '2025-04-02'),
	(1053, 53, '2025-04-03'),
	(1054, 54, '2025-04-04'),
	(1055, 55, '2025-04-05'),
	(1056, 56, '2025-04-06'),
	(1057, 57, '2025-04-07'),
	(1058, 58, '2025-04-08'),
	(1059, 59, '2025-04-09'),
	(1060, 60, '2025-04-10'),
	(1061, 12, '2025-04-12'),
	(1062, 6, '2025-04-14'),
	(1063, 30, '2025-04-16'),
	(1064, 1, '2025-04-17'),
	(1065, 15, '2025-04-18'),
	(1066, 62, '2025-04-19'),
	(1067, 5, '2025-04-20'),
	(1068, 61, '2025-04-21'),
	(1069, 13, '2025-04-22'),
	(1070, 19, '2025-04-23')
;

SELECT * FROM OrderDetails;

INSERT INTO OrderDetails(DetailID, OrderID, ProductID, Quantity)
VALUES
	(1, 1001, 201, 2),
	(2, 1002, 301, 1),
	(3, 1003, 401, 3),
	(4, 1004, 501, 1),
	(5, 1005, 401, 2),
	(6, 1006, 202, 1),
	(7, 1007, 302, 4),
	(8, 1008, 402, 2),
	(9, 1009, 502, 1),
	(10, 1010, 302, 1),
	(11, 1011, 203, 3),
	(12, 1012, 303, 1),
	(13, 1013, 403, 2),
	(14, 1014, 503, 2),
	(15, 1015, 103, 1),
	(16, 1016, 204, 1),
	(17, 1017, 304, 2),
	(18, 1018, 404, 3),
	(19, 1019, 504, 2),
	(20, 1020, 304, 1),
	(21, 1021, 205, 2),
	(22, 1022, 305, 1),
	(23, 1023, 405, 3),
	(24, 1024, 505, 1),
	(25, 1025, 205, 2),
	(26, 1026, 206, 1),
	(27, 1027, 306, 1),
	(28, 1028, 406, 2),
	(29, 1029, 506, 3),
	(30, 1030, 406, 2),
	(31, 1031, 207, 2),
	(32, 1032, 307, 1),
	(33, 1033, 407, 2),
	(34, 1034, 507, 1),
	(35, 1035, 307, 1),
	(36, 1036, 208, 3),
	(37, 1037, 308, 1),
	(38, 1038, 408, 2),
	(39, 1039, 508, 1),
	(40, 1040, 108, 2),
	(41, 1041, 209, 1),
	(42, 1042, 309, 3),
	(43, 1043, 409, 1),
	(44, 1044, 509, 1),
	(45, 1045, 509, 2),
	(46, 1046, 210, 1),
	(47, 1047, 310, 2),
	(48, 1048, 510, 1),
	(49, 1049, 410, 3),
	(50, 1050, 301, 1),
	(51, 1051, 401, 2),
	(52, 1052, 201, 1),
	(53, 1053, 201, 2),
	(54, 1054, 302, 1),
	(55, 1055, 402, 1),
	(56, 1056, 502, 2),
	(57, 1057, 102, 1),
	(58, 1058, 203, 1),
	(59, 1059, 303, 1),
	(60, 1060, 503, 1),
	(61, 1061, 203, 1),
	(62, 1062, 204, 2),
	(63, 1063, 404, 1),
	(64, 1064, 304, 3),
	(65, 1065, 504, 1),
	(66, 1066, 304, 1),
	(67, 1067, 404, 2),
	(68, 1068, 504, 1),
	(69, 1069, 510, 1),
	(70, 1070, 301, 1)
;

SELECT * FROM Reviews;
SELECT * fROM Products WHERE ProductId = 203;

INSERT INTO Reviews(ReviewID, ProductID, CustomerID, Rating, Comment)
VALUES
	(1, 102, 12, 4, 'Good quality notebook for the price.'),
	(2, 103, 23, 5, 'Very comfortable and looks great.'),
	(3, 405, 5, 4, 'Heats up water in seconds.'),
	(4, 509, 8, 5, 'Gives daily energy boost.'),
	(5, 106, 13, 4, 'Soft and comfy material.'),
	(6, 401, 30, 4, 'Keys feel premium.'),
	(7, 203, 61, 5, 'Spacious and solid build.'),
	(8, 108, 17, 5, 'Trimmer works smoothly.'),
	(9, 210, 15, 4, 'Works well with dry skin.'),
	(10, 402, 22, 4, 'Covers syllabus well.'),
	(11, 201, 25, 4, 'Great mouse for office use.'),
	(12, 202, 14, 5, 'Pens write smoothly.'),
	(13, 203, 3, 4, 'Spacious dining table.'),
	(14, 204, 28, 5, 'Sturdy and stylish desk.'),
	(15, 205, 10, 4, 'Oven heats quickly and evenly.'),
	(16, 206, 21, 5, 'Perfect fit t-shirt.'),
	(17, 207, 2, 4, 'Great bat for practice sessions.'),
	(18, 208, 11, 5, 'Smells nice and softens beard.'),
	(19, 209, 31, 3, 'Yoga mat is okay, not thick enough.'),
	(20, 210, 6, 5, 'Serum made my skin glow.'),
	(21, 301, 8, 4, 'Crystal clear display.'),
	(22, 302, 33, 5, 'Affordable pencils for students.'),
	(23, 303, 16, 4, 'Decent quality chair.'),
	(24, 304, 1, 4, 'Good for office prints.'),
	(25, 305, 27, 4, 'Excellent pan for daily cooking.'),
	(26, 306, 18, 4, 'Shirt quality is nice.'),
	(27, 307, 26, 3, 'A bit overpriced.'),
	(28, 308, 29, 5, 'Simple and sturdy comb.'),
	(29, 309, 22, 5, 'Helps with my workouts.'),
	(30, 310, 34, 4, 'Smooth cream, not greasy.'),
	(31, 401, 15, 4, 'Responsive keyboard.'),
	(32, 402, 24, 4, 'Basic but useful textbook.'),
	(33, 403, 32, 5, 'Very soft and supportive mattress.'),
	(34, 404, 38, 3, 'Decent folders for files.'),
	(35, 405, 20, 4, 'Kettle boils water fast.'),
	(36, 406, 36, 5, 'Stylish and fits perfectly.'),
	(37, 407, 39, 4, 'Great quality cricket stumps.'),
	(38, 408, 35, 5, 'Smooth foam, good fragrance.'),
	(39, 409, 40, 3, 'Useful but smells weird.'),
	(40, 410, 37, 5, 'Moisturizes very well.'),
	(41, 501, 41, 4, 'Powerful and silent fan.'),
	(42, 502, 43, 5, 'Perfect for diagrams and charts.'),
	(43, 503, 42, 3, 'Curtains are too thin.'),
	(44, 504, 44, 4, 'Sharp scissors for office use.'),
	(45, 505, 45, 5, 'Pressure cooker is excellent.'),
	(46, 506, 46, 4, 'Jeans fit well, great price.'),
	(47, 507, 47, 5, 'Great balance and grip.'),
	(48, 508, 48, 3, 'Smells good but less hold.'),
	(49, 509, 49, 5, 'Useful daily vitamins.'),
	(50, 510, 50, 4, 'Cream absorbs quickly.'),
	(51, 205, 62, 5, 'Perfect for baking.'),
	(52, 303, 52, 4, 'Strong build, worth the price.'),
	(53, 202, 53, 5, 'Very smooth writing pens.'),
	(54, 204, 55, 5, 'Perfect office desk size.'),
	(55, 308, 56, 4, 'Works well, great grip.'),
	(56, 206, 57, 4, 'Nice color and stretch.'),
	(57, 301, 58, 5, 'Excellent smart TV.'),
	(58, 408, 59, 3, 'Foam runs out quickly.'),
	(59, 507, 60, 5, 'Durable badminton racket.')	
;

SELECT * FROM Shipping;

INSERT INTO Shipping(ShippingID, OrderId, ShipDate, DeliveryDate)
VALUES 
	(1, 1001, '2025-01-11', '2025-01-14'),
	(2, 1002, '2025-01-12', '2025-01-15'),
	(3, 1003, '2025-01-13', '2025-01-16'),
	(4, 1004, '2025-01-15', '2025-01-18'),
	(5, 1005, '2025-01-17', '2025-01-21'),
	(6, 1006, '2025-01-18', '2025-01-22'),
	(7, 1007, '2025-01-21', '2025-01-25'),
	(8, 1008, '2025-01-22', '2025-01-26'),
	(9, 1009, '2025-01-24', '2025-01-28'),
	(10, 1010, '2025-01-26', '2025-01-30'),
	(11, 1011, '2025-01-27', '2025-01-31'),
	(12, 1012, '2025-01-29', '2025-02-01'),
	(13, 1013, '2025-02-03', '2025-02-06'),
	(14, 1014, '2025-02-05', '2025-02-09'),
	(15, 1015, '2025-02-07', '2025-02-10'),
	(16, 1016, '2025-02-08', '2025-02-12'),
	(17, 1017, '2025-02-10', '2025-02-14'),
	(18, 1018, '2025-02-12', '2025-02-16'),
	(19, 1019, '2025-02-13', '2025-02-17'),
	(20, 1020, '2025-02-15', '2025-02-18'),
	(21, 1021, '2025-02-16', '2025-02-19'),
	(22, 1022, '2025-02-18', '2025-02-21'),
	(23, 1023, '2025-02-21', '2025-02-25'),
	(24, 1024, '2025-02-22', '2025-02-26'),
	(25, 1025, '2025-02-23', '2025-02-27'),
	(26, 1026, '2025-02-25', '2025-02-28'),
	(27, 1027, '2025-02-26', '2025-03-01'),
	(28, 1028, '2025-02-28', '2025-03-03'),
	(29, 1029, '2025-03-02', '2025-03-05'),
	(30, 1030, '2025-03-03', '2025-03-06'),
	(31, 1031, '2025-03-05', '2025-03-08'),
	(32, 1032, '2025-03-06', '2025-03-10'),
	(33, 1033, '2025-03-08', '2025-03-11'),
	(34, 1034, '2025-03-09', '2025-03-12'),
	(35, 1035, '2025-03-10', '2025-03-13'),
	(36, 1036, '2025-03-11', '2025-03-14'),
	(37, 1037, '2025-03-12', '2025-03-15'),
	(38, 1038, '2025-03-14', '2025-03-17'),
	(39, 1039, '2025-03-16', '2025-03-19'),
	(40, 1040, '2025-03-17', '2025-03-21'),
	(41, 1041, '2025-03-18', '2025-03-22'),
	(42, 1042, '2025-03-20', '2025-03-24'),
	(43, 1043, '2025-03-22', '2025-03-26'),
	(44, 1044, '2025-03-23', '2025-03-27'),
	(45, 1045, '2025-03-24', '2025-03-28'),
	(46, 1046, '2025-03-25', '2025-03-29'),
	(47, 1047, '2025-03-27', '2025-03-30'),
	(48, 1048, '2025-03-28', '2025-04-01'),
	(49, 1049, '2025-03-29', '2025-04-02'),
	(50, 1050, '2025-03-31', '2025-04-03'),
	(51, 1051, '2025-04-02', '2025-04-05'),
	(52, 1052, '2025-04-03', '2025-04-06'),
	(53, 1053, '2025-04-04', '2025-04-07'),
	(54, 1054, '2025-04-05', '2025-04-08'),
	(55, 1055, '2025-04-06', '2025-04-09'),
	(56, 1056, '2025-04-07', '2025-04-10'),
	(57, 1057, '2025-04-08', '2025-04-11'),
	(58, 1058, '2025-04-09', '2025-04-12'),
	(59, 1059, '2025-04-10', '2025-04-13'),
	(60, 1060, '2025-04-11', '2025-04-14'),
	(61, 1061, '2025-04-13', '2025-04-16'),
	(62, 1062, '2025-04-15', '2025-04-18'),
	(63, 1063, '2025-04-17', '2025-04-20'),
	(64, 1064, '2025-04-18', '2025-04-21'),
	(65, 1065, '2025-04-19', '2025-04-23'),
	(66, 1066, '2025-04-20', '2025-04-24'),
	(67, 1067, '2025-04-21', '2025-04-25'),
	(68, 1068, '2025-04-22', '2025-04-26'),
	(69, 1069, '2025-04-23', '2025-04-27'),
	(70, 1070, '2025-04-24', '2025-04-28')
;

SELECT * FROM Discounts;

INSERT INTO Discounts(DiscountID, ProductID, DiscountAmount)
VALUES 
	(1, 101, 2500.00),
	(2, 102, 50.00),
	(3, 103, 3000.00),
	(4, 104, 799.00),
	(5, 105, 1000.00),
	(6, 106, 200.00),
	(7, 107, 150.00),
	(8, 108, 250.00),
	(9, 109, 500.00),
	(10, 110, 100.00),
	(11, 201, 700.00),
	(12, 202, 5.00),
	(13, 203, 3500.00),
	(14, 204, 999.00),
	(15, 205, 2500.00),
	(16, 206, 100.00),
	(17, 207, 300.00),
	(18, 208, 70.00),
	(19, 209, 50.00),
	(20, 210, 100.00),
	(21, 301, 4000.00),
	(22, 302, 2.00),
	(23, 303, 400.00),
	(24, 304, 40.00),
	(25, 305, 300.00),
	(26, 306, 120.00),
	(27, 307, 200.00),
	(28, 308, 60.00),
	(29, 309, 50.00),
	(30, 310, 75.00),
	(31, 401, 150.00),
	(32, 402, 20.00),
	(33, 403, 1000.00),
	(34, 404, 15.00),
	(35, 405, 200.00),
	(36, 406, 400.00),
	(37, 407, 250.00),
	(38, 408, 30.00),
	(39, 409, 80.00),
	(40, 410, 50.00),
	(41, 501, 500.00),
	(42, 502, 2.00),
	(43, 503, 200.00),
	(44, 504, 10.00),
	(45, 505, 400.00),
	(46, 506, 200.00),
	(47, 507, 150.00),
	(48, 508, 20.00),
	(49, 509, 60.00),
	(50, 510, 50.00),
	(51, 104, 500.00),
	(52, 303, 350.00),
	(53, 202, 3.00),
	(54, 109, 450.00),
	(55, 204, 800.00),
	(56, 308, 50.00),
	(57, 206, 100.00),
	(58, 301, 3000.00),
	(59, 408, 25.00),
	(60, 507, 100.00),
	(61, 107, 120.00),
	(62, 205, 1000.00),
	(63, 401, 150.00),
	(64, 203, 2500.00),
	(65, 210, 60.00),
	(66, 402, 15.00),
	(67, 405, 100.00),
	(68, 509, 50.00),
	(69, 106, 150.00),
	(70, 105, 1200.00)
;

-- Q1. Select all the products from products table along with category name

SELECT 
	P.ProductId,
	P.ProductName,
	P.Price,
	P.StockQuantity,
	c.CategoryID
FROM Products P
JOIN 
	Categories c ON c.CategoryID = p.CategoryID
;

-- Q2. Select all the customers detail from customer table who had purchased electronics item

SELECT	
	c.CustomerID,
	c.CustomerName,
	c.Email
FROM 
	Customers c
JOIN 
	Orders o ON o.CustomerID = c.CustomerID
JOIN
	OrderDetails od ON od.OrderID = o.OrderID
JOIN
	Products p ON p.ProductId = od.ProductID
WHERE p.CategoryID = 7
;


SELECT * FROM Orders;

-- Q3. How much products are sold from a particular category

SELECT 
    p.CategoryID,
    cat.CategoryName,
    SUM(od.Quantity) AS TotalProductsSold
	FROM OrderDetails od
	JOIN Products p ON od.ProductID = p.ProductID
	JOIN Categories cat ON p.CategoryID = cat.CategoryID
	WHERE p.CategoryID = 3  
	GROUP BY p.CategoryID, cat.CategoryName
;

-- Q4. Average amount of products from particular category

SELECT
	C.CategoryID,
	C.CategoryName,
	AVG(P.Price) AS AverageAmount
	FROM Categories AS C
	JOIN 
	Products P ON P.CategoryID = C.CategoryID
	GROUP BY C.CategoryName, C.CategoryID
;

-- Q5. highest order amount from each category

SELECT 
	c.CategoryID,
	c.CategoryName,
	MAX(p.Price) AS HighestAmountPerorder
	FROM Categories AS c
	JOIN 
	Products p ON p.CategoryID = c.CategoryID
	GROUP BY c.CategoryID, c.CategoryName
;

-- Q6. How many quantities of each product sold
SELECT
	p.ProductId,
	p.ProductName,
	SUM(Od.Quantity) AS TotalQuantitySold
	FROM OrderDetails AS Od
	INNER JOIN 
	Products p ON p.ProductId = Od.ProductID
	GROUP BY p.ProductName, p.ProductId
	ORDER BY TotalQuantitySold DESC
;

-- Q7. Total Quantity Sold per category

SELECT 
	p.CategoryID,
	c.CategoryName,
	SUM(od.Quantity) AS TotalQuantitySold
	FROM OrderDetails od
	INNER JOIN 
	Products p ON od.ProductId = p.ProductID
	INNER JOIN 
	Categories c ON p.CategoryID = c.CategoryID
	GROUP BY p.CategoryID, c.CategoryName
	ORDER BY TotalQuantitySold DESC
;

-- Q8. Total amount collected per category

SELECT 
	p.CategoryID,
	c.CategoryName,
	SUM(od.Quantity) AS TotalQuantitySold,
	SUM(p.Price) AS ToatalPrice
	FROM OrderDetails AS od
	INNER JOIN 
	Products p ON p.ProductId = od.ProductID
	INNER JOIN 
	Categories c ON c.CategoryID = p.CategoryID
	GROUP BY p.CategoryID, c.CategoryName
	ORDER BY TotalQuantitySold DESC
;

-- Q9. Total Quantity sold for all products along with total price
SELECT 
    SUM(od.Quantity) AS TotalQuantitySold,
	SUM(p.Price) AS TotalPrice
FROM OrderDetails AS od
	INNER JOIN 
	Products p ON p.ProductId = od.ProductID
;

-- Q10. query for finding range of product as per price, product id, peoduct name, product category

SELECT 
	p.ProductId,
	p.ProductName,
	p.Price,
	CASE 
	WHEN p.Price < 1000 Then 'Low Range'
	WHEN p.price BETWEEN 1000  AND 20000 THEN 'Mid Range'
	ELSE 'High Range'
	END AS PriceRange,
	COUNT(*) AS ProductCount
	FROM Products p
	GROUP BY Price, ProductId, ProductName
	Order BY ProductCount 
;
	
-- Q11. sort product as per their price after sale

SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    ISNULL(d.DiscountAmount, 0) AS Discount,
    (p.Price - ISNULL(d.DiscountAmount, 0)) AS FinalPriceAfterDiscount
FROM Products p
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
ORDER BY FinalPriceAfterDiscount ASC;

-- Q12. Total amount collected per category

SELECT 
	c.CategoryID,
	c.CategoryName,
	SUM(od.Quantity) AS TotalQuantitySold,
	SUM(p.Price * od.Quantity) AS TotalPrice
	FROM Categories AS c
	JOIN 
	Products p ON p.CategoryID = c.CategoryID
	JOIN 
	OrderDetails od ON od.ProductID = p.ProductId
	GROUP BY c.CategoryID, c.CategoryName
	ORDER BY TotalQuantitySold Desc
;

-- Q13. Total Amount collected per product and show the range

SELECT 
	c.CategoryID,
	c.CategoryName,
	p.ProductName,
	SUM(od.Quantity) AS TotalQuantitySold,
	SUM(p.Price * od.Quantity) AS TotalPrice,
	CASE 
		WHEN p.Price < 10000 THEN 'Low Range'
		WHEN p.Price BETWEEN 10000 AND 50000 THEN 'Mid Range'
		ELSE 'High Range'
	END AS ProductSalesRange
	FROM Categories AS c
	JOIN 
	Products p ON p.CategoryID = c.CategoryID
	JOIN 
	OrderDetails od ON od.ProductID = p.ProductId
	GROUP BY c.CategoryID, c.CategoryName, Price, od.Quantity, p.ProductName
	ORDER BY TotalQuantitySold Desc
;

SELECT * FROM OrderDetails;

-- Q14. Total Amount collected per category and show the range
SELECT 
    p.CategoryID,
    cat.CategoryName,
    CASE 
        WHEN p.Price < 10000 THEN 'Low Range'
        WHEN p.Price BETWEEN 10000 AND 50000 THEN 'Mid Range'
        ELSE 'High Range'
    END AS ProductSalesRange,
    SUM(od.Quantity) AS TotalProductsSold,
    SUM(p.Price * od.Quantity) AS TotalPrice
FROM 
	OrderDetails od
JOIN 
	Products p ON od.ProductID = p.ProductID
JOIN 
	Categories cat ON p.CategoryID = cat.CategoryID 
GROUP BY 
    p.CategoryID, 
    cat.CategoryName,
    CASE 
        WHEN p.Price < 10000 THEN 'Low Range'
        WHEN p.Price BETWEEN 10000 AND 50000 THEN 'Mid Range'
        ELSE 'High Range'
    END
ORDER BY 
    p.CategoryID, ProductSalesRange
;

-- Q15. query for total price after discount per product
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalSold,
    p.Price,
    ISNULL(d.DiscountAmount, 0) AS Discount,
    SUM(od.Quantity * (p.Price - ISNULL(d.DiscountAmount, 0))) AS TotalRevenueAfterDiscount
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
GROUP BY p.ProductID, p.ProductName, p.Price, d.DiscountAmount
ORDER BY TotalRevenueAfterDiscount DESC;

-- Q15. query for total price after discount per Category

SELECT 
	p.CategoryID,
	SUM(od.Quantity * (p.price - ISNULL(d.DiscountAmount, 0))) AS TotalRevenueAfterDiscount
FROM OrderDetails AS od
JOIN 
	Products p ON p.ProductId = od.ProductID
LEFT JOIN 
	Discounts d ON p.ProductID = d.ProductID
-- JOIN 
	-- Categories c ON c.CategoryID = p.CategoryID
GROUP BY 
	p.CategoryID
ORDER BY
	TotalRevenueAfterDiscount DESC
;

-- Q16. Total revenue after discount range

--SELECT 
--    p.CategoryID,
--    SUM(od.Quantity * (p.Price - ISNULL(d.DiscountAmount, 0))) AS TotalRevenueAfterDiscount,
--    CASE 
--        WHEN p.Price < 10000 THEN 'Low revenue range'
--        WHEN p.Price BETWEEN 10000 AND 100000 THEN 'Mid Revenue range'
--        ELSE 'High Revenue range'
--    END AS RevenueRange
--FROM OrderDetails AS od
--JOIN Products p ON p.ProductID = od.ProductID
--LEFT JOIN Discounts d ON p.ProductID = d.ProductID
--GROUP BY 
--    p.CategoryID,
--    CASE 
--        WHEN p.Price < 10000 THEN 'Low revenue range'
--        WHEN p.Price BETWEEN 10000 AND 100000 THEN 'Mid Revenue range'
--        ELSE 'High Revenue range'
--    END
--ORDER BY 
--    CASE 
--        WHEN p.Price < 10000 THEN 'Low revenue range'
--        WHEN p.Price BETWEEN 10000 AND 100000 THEN 'Mid Revenue range'
--        ELSE 'High Revenue range'
--    END DESC;

-- Q16. total products sold from particular range

SELECT 
	p.ProductId,
	p.ProductName,
    CASE 
        WHEN p.Price < 1000 THEN 'Low Range'
        WHEN p.Price BETWEEN 1000 AND 10000 THEN 'Mid Range'
        ELSE 'High Range'
    END AS PriceRange,
    SUM(od.Quantity) AS TotalProductsSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON c.CategoryID = p.CategoryID
GROUP BY 
	p.Price,p.ProductId,p.ProductName,
    CASE 
        WHEN p.Price < 1000 THEN 'Low Range'
        WHEN p.Price BETWEEN 1000 AND 10000 THEN 'Mid Range'
        ELSE 'High Range'
    END
ORDER BY 
    CASE 
        WHEN p.Price < 10000 THEN 1
        WHEN p.Price BETWEEN 10000 AND 100000 THEN 2
        ELSE 3
    END;

-- Q17. Display all the customers where name starts with either A or S.

SELECT 
	*
	FROM Customers AS c
	WHERE 
	 c.CustomerName LIKE 'A%' OR c.CustomerName LIKE 'S%';

-- Q18. Display all the customer records where 2nd and 4th character are n And i respectively 
SELECT 
	*
	FROM Customers AS c
WHERE 
	c.CustomerName LIKE '_n_i%';

-- Q19. Display all the records where name starts from alphabet s to z
SELECT *
	FROM Customers
WHERE 
	CustomerName BETWEEN 's%' AND 'Z%';

-- Q20. Discount amount for each products

SELECT 
	d.ProductID,
	p.ProductName,
	SUM(od.Quantity) AS TotalSold,
	d.DiscountAmount
	FROM Discounts d
JOIN
	Products p ON p.ProductId = d.ProductID
JOIN
	OrderDetails od ON od.ProductID = p.ProductId
GROUP BY od.Quantity, d.ProductId, p.ProductName, d.DiscountAmount
ORDER BY TotalSold
;

-- Q20. Total discount for each category

SELECT 
	c.CategoryID,
	c.CategoryName,
	SUM(d.DiscountAmount) AS TotalDiscount
	FROM Categories c
JOIN 
	Products p ON p.CategoryID = c.CategoryID
JOIN 
	Discounts d ON d.ProductID = p.ProductId
GROUP BY 
	c.CategoryID, c.CategoryName
ORDER BY 
	TotalDiscount DESC
;

-- Q21. Query to display the customer name and what product they purchased from a specific category

SELECT 
	c.CustomerName,
	cat.CategoryName,
	p.ProductName
	FROM Customers c
JOIN
	Orders o ON o.CustomerID = c.CustomerID
JOIN 
	OrderDetails od ON od.OrderID = o.OrderID
JOIN 
	Products P on P.ProductId = od.ProductID
JOIN
	Categories cat ON cat.CategoryID = p.CategoryID
;

-- Q22. Display amount for each products

SELECT 
	p.ProductName,
	P.Price
FROM Products p;

-- Q23. Display amount for each products sold after discounts

SELECT 
	p.ProductName,
	p.Price,
	d.DiscountAmount,
	(p.Price - d.DiscountAmount) AS PriceAfterDiscount
FROM Products p
JOIN
	Discounts d ON d.ProductID = p.ProductId
;

-- Q24 Display total discount amount for a specific category

SELECT 
    p.CategoryID,
	c.CategoryName,
    SUM(ISNULL(d.DiscountAmount, 0)) AS TotalDiscountAmount
FROM Products p
JOIN Discounts d ON p.ProductID = d.ProductID
JOIN Categories c ON c.CategoryID = p.CategoryID
-- WHERE p.CategoryID = 5 
GROUP BY p.CategoryID, c.CategoryName;

-- Q25. Query to display the item purchased for a specific date

SELECT
	p.ProductName,
	o.OrderDate
FROM 
	Orders o
JOIN 
	OrderDetails od ON od.OrderID = o.OrderID
JOIN 
	Products p ON od.ProductID = p.ProductId
WHERE 
	o.OrderDate = '2025-01-10'
;

-- Q26. Query to display item purchased between two dates
SELECT * FROM orders;

SELECT
	p.ProductName,
	o.OrderDate
FROM 
	Orders o
JOIN 
	OrderDetails od ON od.OrderID = o.OrderID
JOIN 
	Products p ON od.ProductID = p.ProductId
WHERE o.OrderDate BETWEEN '2025-04-01' AND '2025-07-15';
;

-- Q26. Query to display the maximimum discount for a particular product

SELECT 
    p.ProductID,
    p.ProductName,
    MAX(ISNULL(d.DiscountAmount, 0)) AS MaxDiscount
FROM Products p
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
WHERE p.ProductID = 203
GROUP BY p.ProductID, p.ProductName;

-- Q27. Query to display how many products are sold

SELECT
	p.ProductId,
	p.ProductName,
	SUM(od.Quantity) as TotalProductsSold
	FROM Products AS p
	JOIN
	OrderDetails od ON  p.ProductId = od.ProductID
	GROUP BY p.ProductId, p.ProductName
	Order By TotalProductsSold DESC
;

SELECT 
    SUM(Quantity) AS TotalProductsSold
FROM OrderDetails;

-- Q28. Query to display top 10 products with maximum selling
SELECT TOP 10
	p.ProductId,
	p.ProductName,
	SUM(od.Quantity) as TotalProductsSold
	FROM Products AS p
	JOIN
	OrderDetails od ON  p.ProductId = od.ProductID
	GROUP BY p.ProductId, p.ProductName
	Order By TotalProductsSold DESC
;

-- Q29. Query to find top 10 products with maximum revenue(without discounts)

SELECT * FROM OrderDetails
WHERE ProductID = 101;

SELECT TOP 10
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC;

-- Q30. Total revenue after discount for top 10 products

SELECT* FROM Products WHERE ProductName = 'Dinning table';

SELECT TOP 10
    p.ProductID,
    p.ProductName ,
	p.Price,
	SUM(od.Quantity * ISNULL(d.DiscountAmount, 0)) AS TotalDiscountAmount,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(od.Quantity * (p.Price - ISNULL(d.DiscountAmount, 0))) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Discounts d ON p.ProductID = d.ProductID
GROUP BY p.ProductID, p.ProductName, p.Price
ORDER BY TotalRevenue DESC;

-- Q31. Total discount amount for a particular product after selling

SELECT 
	p.ProductId,
	p.ProductName,
	p.Price,
	d.DiscountAmount,
	SUM(od.Quantity) AS TotalSold,
	SUM(od.Quantity * ISNULL (d.DiscountAmount,0)) AS TotalDiscountAmountAfterselling
	FROM Products p
	JOIN
	OrderDetails od ON od.ProductID = p.ProductId
	LEFT JOIN 
	Discounts d ON d.ProductID = p.ProductId
	GROUP BY 
	p.ProductId, p.ProductName, p.Price, d.DiscountAmount
	Order BY TotalDiscountAmountAfterselling
;

-- Q32. Highest quantity sold for all products by one customer

SELECT
	P.ProductId,
	P.ProductName,
	MAX(od.Quantity) AS MaxQuantitySold
FROM Products p
JOIN 
	OrderDetails od ON od.ProductID = p.ProductId
GROUP BY 
	p.ProductId,
	p.ProductName
Order BY 
	MaxQuantitySold DESC
;

-- Q33. Find Product with price higher than the average price

SELECT AVG(Price) FROM Products AS AveragePrice;

SELECT 
	*
FROM Products AS p
WHERE p.Price > (SELECT AVG(Price) FROM Products);

-- Q34. Find Product with price Lower than the average price

SELECT 
	*
FROM Products AS p
WHERE p.Price < (SELECT AVG(Price) FROM Products);

-- Q35. Show Price difference from average Price 

SELECT  
	ProductName,
	price,
	Price - (SELECT AVG(Price) FROM Products) AS PriceDiff
FROM Products 
;

-- Q36. Find orders for expensive products > 10000

SELECT 
	*
FROM OrderDetails
WHERE ProductID IN (SELECT ProductId FROM Products WHERE price > 10000);

-- Q37. Find products with atleast one order

SELECT ProductID FROM OrderDetails WHERE Quantity >= 1
GROUP BY ProductID;

SELECT * 
	FROM Products
	WHERE ProductID IN (SELECT ProductID FROM OrderDetails WHERE Quantity >= 1
			GROUP BY ProductID);

-- Q38. Find Products which does not have any order

SELECT 
    p.ProductID,
    p.ProductName,
    p.Price,
    p.StockQuantity,
	od.Quantity AS orderQuantity
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL;

-- Q39.	Stock available after sale

SELECT 
    p.ProductID,
    p.ProductName,
    p.StockQuantity AS OriginalStock,
    ISNULL(SUM(od.Quantity), 0) AS TotalQuantitySold,
    (p.StockQuantity - ISNULL(SUM(od.Quantity), 0)) AS StockAvailable
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, p.StockQuantity
ORDER BY StockAvailable ASC;  


SELECT * FROM Products;

-- Q40. What are the order details including customer name, product name for recent orders

SELECT 
	c.CustomerID,
	c.CustomerName,
	p.ProductName,
	od.Quantity AS QuantityPurchased,
	o.OrderDate
FROM OrderDetails od
JOIN 
	Products p ON p.ProductId = od.ProductID
JOIN 
	Orders o ON o.OrderID = od.OrderID
JOIN 
	Customers c ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate DESC
;

-- Q41. Check review for particular item along with customer details

SELECT * FROM Reviews;

SELECT 
	c.CustomerID,
	c.CustomerName,
	c.Email,
	p.ProductId,
	p.ProductName,
	r.ReviewID,
	r.Rating,
	r.Comment
	FROM Customers c
	JOIN 
	Reviews r ON r.CustomerID = c.CustomerID
	JOIN 
	Products p ON p.ProductId = r.ProductID
	WHERE p.ProductId = 102
;

-- Q42. query for selecting product which have multiple orders

SELECT 
	p.ProductId,
	p.ProductName,
	COUNT(od.OrderID) AS NumberOfOrders,
	SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od 
JOIN 
	Products p ON p.ProductId = od.ProductID
GROUP BY p.ProductId, p.ProductName
HAVING COUNT(od.OrderId) > 1
order BY NumberOfOrders DESC
;

-- Q43. Query to find product which have ratings more than 4

SELECT
	p.ProductId,
	p.ProductName,
	r.Rating
	FROM Products p
JOIN 
	Reviews r ON r.ProductID = p.ProductId
WHERE 
	r.Rating > 4
	;

-- Q44. Products greater than average rating

SELECt * FROM Reviews;

SELECT 
	p.ProductId,
	p.ProductName,
	r.Rating
FROM Reviews r
JOIN
	Products p ON p.ProductId = r.ProductID
WHERE 
	r.Rating > (SELECT AVG(Rating) FROM Reviews)
;

-- Q45. A filter for products with low stock (e.g., < 10)

SELECT 
    p.ProductID,
    p.ProductName,
    p.StockQuantity AS OriginalStock,
    ISNULL(SUM(od.Quantity), 0) AS TotalQuantitySold,
    (p.StockQuantity - ISNULL(SUM(od.Quantity), 0)) AS StockRemaining,
	CASE 
		WHEN (p.StockQuantity - ISNULL(SUM(od.Quantity), 0)) < 10 THEN 'Low'
		WHEN (p.StockQuantity - ISNULL(SUM(od.Quantity), 0)) BETWEEN 10 AND 20 THEN 'Mid'
		ELSE 'High'
	END AS StockAvailabilityRange

FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName, p.StockQuantity
ORDER BY StockRemaining ASC,
CASE 
		WHEN (p.StockQuantity - ISNULL(SUM(od.Quantity), 0)) < 10 THEN 'Low'
		WHEN (p.StockQuantity - ISNULL(SUM(od.Quantity), 0)) BETWEEN 10 AND 20 THEN 'Mid'
		ELSE 'High'
END;  

-- Q46. Product with zero order in a specific category

SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.CategoryID = 4
  AND p.ProductID NOT IN (
      SELECT DISTINCT ProductID FROM OrderDetails
  );

-- Q47. Product with zero order in all category

SELECT 
	p.ProductId,
	p.ProductName,
	p.CategoryID,
	c.CategoryName,
	od.Quantity
FROM Products p 
JOIN 
	Categories c ON c.CategoryID = p.CategoryID
LEFT JOIN 
	OrderDetails od ON od.ProductID = p.ProductId
WHERE od.ProductID IS NULL
;

-- Q48.	Show top 5 categories by total revenue (after discount)

SELECT TOP 5
	c.CategoryID,
	c.CategoryName,
	SUM(od.Quantity * (p.Price - ISNULL(d.DiscountAmount, 0))) AS TotalRevenue
	FROM Categories c
	JOIN	
		Products p ON p.CategoryID = c.CategoryID
	JOIN
		OrderDetails od ON od.ProductID = p.ProductId
	JOIN 
		Discounts d ON d.ProductID = p.ProductId
	GROUP BY c.CategoryID, c.CategoryName
	Order By TotalRevenue DESC
	;

-- Q49. Get customers who made more than 2 purchases

SELECT 
	c.CustomerID,
	c.CustomerName,
	p.ProductName,
	od.Quantity
FROM Customers c
JOIN 
	Orders o ON o.CustomerID = c.CustomerID
JOIN 
	OrderDetails od ON od.OrderID = o.OrderID
JOIN 
	Products p ON p.ProductId = od.ProductID
WHERE 
	od.Quantity >= 3
;

-- Q50. Get customers who made more than 1 orders

SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 1;

-- Q51. Top 5 customers by total spending (Per product)

SELECT TOP 5
	c.CustomerID,
	c.CustomerName,
	p.ProductName,
	p.CategoryID,
	p.Price,
	SUM(od.Quantity * (Price - ISNULL(DiscountAmount, 0))) AS TotalRevenue
FROM Customers c
	JOIN 
	Orders o ON o.CustomerID = c.CustomerID	
	JOIN 
	OrderDetails od ON od.OrderID = o.OrderID
	JOIN
	Products p ON p.ProductId = od.ProductID
	LEFT JOIN 
	Discounts d ON d.ProductID = p.ProductId
GROUP BY
	c.CustomerID, c.CustomerName, p.ProductName, p.Price, p.CategoryID
ORDER BY 
	TotalRevenue DESC
;


-- Q52. Top 5 customers by total spending
SELECT TOP 5
    c.CustomerID,
    c.CustomerName,
    SUM(od.Quantity * (p.Price - ISNULL(d.DiscountAmount, 0))) AS TotalSpent
FROM Customers c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
LEFT JOIN Discounts d ON d.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC;
