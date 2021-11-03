## bai tap ve nha so 3 ( ban rieng)
##Question 1: Thêm ít nhất 10 record vào mỗi table ( hoan thanh )
##Question 2: lấy ra tất cả các phòng ban
SELECT *
FROM Department;
                     ##Question 3: lấy ra id của phòng ban "Sale"
SELECT DepartmentID
FROM Department
WHERE DepartmentName = 'PHONG_GD';
				    ##Question 4: lấy ra thông tin account có full name dài nhất
SELECT *
FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)
ORDER BY Fullname DESC;

##Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3--
SELECT * FROM account 
WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM `account`)
and Department_ID = 3
ORDER BY Full_Name ASC;
            ##Question 6: Lấy ra tên group đã tạo trước ngày 20/12/2019
select * from `account`;
SELECT AccountID 
FROM `account`
WHERE CreateDate < '2021-12-20';

        # Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM type_question 
WHERE Type_ID >=1
GROUP BY Type_ID
HAVING count(Type_ID) >=1;
##Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2021
SELECT ExamID
FROM examquestion
WHERE QuestionID >= 60 AND CreateDate < '2020-12-20';

##Question 9: Lấy ra 5 `Account` được tạo gần đây nhất
SELECT *
FROM `Account`
ORDER BY CreateDate ASC 
LIMIT 5; 

##Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT (Department_ID), COUNT(Department_ID) AS SLVN
FROM `account`
WHERE Department_ID = 2;

##Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "H"
SELECT Full_name
FROM `Account`
WHERE Full_Name LIKE 'D%H' ;

##Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE exam
  FROM (exam)
  WHERE CreateDate >'2021-04-07';

##Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE
FROM `question`
WHERE (SUBSTRING_INDEX(Content,' ',2)) ='câu hỏi';
## chua lam uplade dc bang ( loi 1265)

##Question 14: Update thông tin của account có id = 5 thành tên "tran son" và email thành sondame@gmal.com
UPDATE `Account`
SET Full_name = N'tran son',
Email = 'sondame@gmal.com'
WHERE AccountID = 5;

##Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `GroupAccount` SET AccountID = 5
##>>>>>>> chuwa lam dc