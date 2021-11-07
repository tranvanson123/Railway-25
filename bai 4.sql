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
HAVING COUNT(A.DepartmentID) > 1;

# sao dung cau truc ma k ra du lieu???



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

## tham khao cac ban lam truoc .. bai nay dang AIMAI qua:((


##Question 6: Thông kê mỗi Category Question được sử dụng trong bao nhiêu Question 

SELECT lch.Category_ID, lch.Category_Name, count(q.QuestionID) 
FROM category_question as lch
JOIN question q ON lch.Category_ID = q.QuestionID
GROUP BY q.QuestionID;

##Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT Q.QuestionID, Q.Content ,count(E.ExamID)
from exam as E
RIGHT JOIN question Q on Q.QuestionID=E.ExamID
GROUP BY ExamID;

##Question 8: Lấy ra Question có nhiều câu trả lời nhất
select Q.QuestionID , Q.Content, count(A.QuestionID) as SLCH
FROM answer AS A
inner JOIN Question Q ON A.QuestionID = Q.QuestionID
GROUP by A.QuestionID 
	HAVING COUNT(A.QuestionID) =(SELECT max(SLCH)
	FROM  (SELECT count(A.QuestionID) AS SLCH
	FROM question AS A
	GROUP BY A.QuestionID) AS SLCH );    

##Question 9: Thống kê số lượng account trong mỗi group

SELECT AC.AccountID,count(G.GroupID) AS SL
from groupaccount AS  G
JOIN account AC on AC.AccountID=G.GroupID
GROUP BY G.GroupID;

##Question 10: Tìm chức vụ có ít người nhất

SELECT P.positionID,P.Position_Name,count(A.AccountID)AS SLNN
from position_1 AS P
JOIN  `account` A on A.AccountID=P.positionID
GROUP BY A.AccountID
having count(A.AccountID) =(select min(P.positionID));
## CHAY DUOC NHUNG THAY SAI SAI GI !!

##Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT d.DepartmentName, d.SLNVID ,count(p.positionID)
 FROM `position_1` AS P
INNER JOIN department d ON p.positionID = d.SLNVID
GROUP BY  d.SLNVID , p.PositionID;

 
##Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
##question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …

SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName, ANS.QuestionID
FROM question Q
INNER JOIN category_question CQ ON Q.QuestionID = CQ.Category_ID
INNER JOIN type_question TQ ON Q.TypeID = TQ.Type_ID
INNER JOIN` account` A ON A.AccountID = Q.reatorID
INNER JOIN Answer AS ANS ON Q.QuestionID = ANS.QuestionID
ORDER BY Q.QuestionID ASC ;
##trinh tu join ntn???

##Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT E.ExamID,E.CreatorID,count(TQ.Type_ID) AS SL
FROM exam E
JOIN exam ON  E.ExamID = TQ.Type_ID
GROUP BY Q.Type_ID ;


##Question 14:Lấy ra group không có account nào Sử dụng Left Join
SELECT * FROM `group` g
LEFT JOIN groupaccount ga ON g.GroupID = ga.GroupID
WHERE GA.AccountID IS NULL;


##Question 15: Lấy ra group không có account nào
SELECT * FROM `Group` 
WHERE GroupID NOT IN (SELECT GroupID
FROM GroupAccount);

## C2 RIGHT JOIN

SELECT * FROM groupaccount ga
RIGHT JOIN `group` g ON ga.GroupID = g.GroupID
WHERE ga.AccountID IS NULL;


##Question 16: Lấy ra question không có answer nào
SELECT * FROM Question
WHERE QuestionID NOT IN
 (SELECT QuestionID
 From Answer );
SELECT q.QuestionID FROM answer a
RIGHT JOIN question q on a.QuestionID = q.QuestionID 
WHERE a.AnswerID IS NULL;


##Exercise 2: Union Question 17:
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