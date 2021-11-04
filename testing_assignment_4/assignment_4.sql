##Tạo 1 File SQL đặt tên là "Testing_System_Assignment_4"
## Tiếp tục với Database Testing System_bai 4
##Exercise 1: Join

#######Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT ACC.AccountID , ACC.FullName, DEP.DepartmentID, DEP.DepartmentName
FROM `Account` ACC
INNER JOIN Department DEP ON ACC.AccountID = DEP.DepartmentID  ;

## Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT * 
FROM `Account`
WHERE CreateDate < '2021-12-20';

##Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT A.FullName,A.PositionID,d.Position_Name
FROM `Account` A 
INNER JOIN position_1 d WHERE A.PositionID = d.PositionID;


##Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT D.DepartmentName,D.DepartmentID,
count(a.DepartmentID) AS DSPB FROM account AS A
INNER JOIN department AS D ON A.DepartmentID = D.DepartmentID
GROUP BY A.DepartmentID
HAVING COUNT(A.DepartmentID) >3;


##Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT  Q.Content ,count(e.QuestionID)
FROM examquestion AS E
INNER JOIN question Q ON Q.QuestionID = E.QuestionID
GROUP BY E.QuestionID
order by count(e.QuestionID) desc
limit 1 ;
## cach 2 HAVING count(E.QuestionID) = 
(SELECT MAX(countQues) as maxcountQues 
FROM (
 SELECT COUNT(E.QuestionID) AS countQues 
FROM examquestion E
GROUP BY E.QuestionID) AS countTable);


Question 6: Thông kê mỗi Category Question được sử dụng trong bao nhiêu Question ???
SELECT cq.CategoryID, cq.CategoryName, count(q.CategoryID) FROM categoryquestion cq 
JOIN question q ON cq.CategoryID = q.CategoryID
GROUP BY q.CategoryID;
Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.QuestionID, q.Content , count(eq.QuestionID) FROM examquestion eq
RIGHT JOIN question q ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID;
- Sử dụng RightJoin
SELECT Q.Content, COUNT(EQ.QuestionID) AS 'SO LUONG'
FROM Question Q 
LEFT JOIN ExamQuestion EQ ON EQ.QuestionID = Q.QuestionID
GROUP BY Q.QuestionID
ORDER BY EQ.ExamID ASC;
Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT Q.QuestionID, Q.Content, count(A.QuestionID) FROM answer A
INNER JOIN question Q ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING count(A.QuestionID) = (SELECT max(countQues) FROM
(SELECT count(B.QuestionID) AS countQues FROM answer B
GROUP BY B.QuestionID) AS countAnsw);
Question 9: Thống kê số lượng account trong mỗi group
SELECT G.GroupID, COUNT(GA.AccountID) AS 'SO LUONG'
FROM GroupAccount GA 
JOIN `Group` G ON GA.GroupID = G.GroupID
GROUP BY G.GroupID
ORDER BY G.GroupID ASC;
Question 10: Tìm chức vụ có ít người nhất
SELECT P.PositionID, P.PositionName, count( A.PositionID) AS SL FROM account A
INNER JOIN position P ON A.PositionID = P.PositionID
GROUP BY A.PositionID
HAVING count(A.PositionID)= (SELECT MIN(minP) FROM(
SELECT count(B.PositionID) AS minP FROM account B
GROUP BY B.PositionID) AS minPA);
SELECT P.PositionID, P.PositionName, COUNT(A.PositionID) AS 'SO LUONG'
FROM Position P 
INNER JOIN `Account` A ON P.PositionID = A.PositionID
GROUP BY P.PositionID
HAVING COUNT(A.PositionID) = (SELECT MIN(CountP)
FROM (SELECT 
COUNT(P.PositionID) AS CountP
FROM Position P 
INNER JOIN `Account` A ON P.PositionID = A.PositionID
GROUP BY P.PositionID) AS MinCountP);
Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.DepartmentID,d.DepartmentName, p.PositionName, count(p.PositionName) FROM `account` a
INNER JOIN department d ON a.DepartmentID = d.DepartmentID
INNER JOIN position p ON a.PositionID = p.PositionID
GROUP BY d.DepartmentID, p.PositionID;
Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName AS Author, ANS.Content FROM question Q
INNER JOIN categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
INNER JOIN typequestion TQ ON Q.TypeID = TQ.TypeID
INNER JOIN account A ON A.AccountID = Q.CreatorID
INNER JOIN Answer AS ANS ON Q.QuestionID = ANS.QuestionID
ORDER BY Q.QuestionID ASC
;
Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT TQ.TypeID, TQ.TypeName, COUNT(Q.TypeID) AS SL FROM question Q
INNER JOIN typequestion TQ ON Q.TypeID = TQ.TypeID
GROUP BY Q.TypeID;
Question 14:Lấy ra group không có account nào
Sử dụng Left Join
SELECT * FROM `group` g
LEFT JOIN groupaccount ga ON g.GroupID = ga.GroupID
WHERE GA.AccountID IS NULL;
Question 15: Lấy ra group không có account nào
SELECT *
FROM `Group` 
WHERE GroupID NOT IN (SELECT GroupID
FROM GroupAccount);
Sử dụng Right Join
SELECT * FROM groupaccount ga
RIGHT JOIN `group` g ON ga.GroupID = g.GroupID
WHERE ga.AccountID IS NULL;
Question 16: Lấy ra question không có answer nào
SELECT *
FROM Question
WHERE QuestionID NOT IN (SELECT QuestionID
 From Answer);
SELECT q.QuestionID FROM answer a
RIGHT JOIN question q on a.QuestionID = q.QuestionID 
WHERE a.AnswerID IS NULL;
Exercise 2: Union
Question 17:
a) Lấy các account thuộc nhóm thứ 1
SELECT A.FullName FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 1;
b) Lấy các account thuộc nhóm thứ 2
SELECT A.FullName FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 2;
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 1
UNION
SELECT A.FullName
FROM `Account` A
JOIN GroupAccount GA ON A.AccountID = GA.AccountID
WHERE GA.GroupID = 2;
Question 18:
a) Lấy các group có lớn hơn 5 thành viên
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5;
b) Lấy các group có nhỏ hơn 7 thành viên
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) <= 7;
c) Ghép 2 kết quả từ câu a) và câu b)
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) >= 5
UNION
SELECT g.GroupName, COUNT(ga.GroupID) AS SL
FROM GroupAccount ga
JOIN `Group` g ON ga.GroupID = g.GroupID
GROUP BY g.GroupID
HAVING COUNT(ga.GroupID) <= 7;