
##Exercise 1: Tiếp tục với Database Testing System (Sử dụng subquery hoặc CTE)

##Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban hanh chinh   Sử dụng VIEW

USE EXAMPLE_RW25_DEMO_TEST;

CREATE  VIEW hanhchinh as
SELECT A.*, D.DepartmentName
FROM account A
INNER JOIN department D ON A.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Hành chính';
select *from hanhchinh;


##Sử dụng CTE

WITH hanhchinh AS (
SELECT A.DepartmentID, D.DepartmentName FROM account A
INNER JOIN department D ON A.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = "Hành chính")
select * from hanhchinh;



##Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất

SELECT A.AccountID,A.FullName,A.Username, count(Gr.GroupID) AS SOLUONG
FROM `account` As A
INNER JOIN groupaccount AS Gr ON A.AccountID = Gr.AccountID
group by Gr.GroupID
having count(Gr.GroupID) = (select max(Gr.GroupID));

##Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
 CREATE VIEW contendaitren18tu AS
 select * from question 
 where length(Content) > 18;
 select * FROM contendaitren18tu;
drop view contendaitren18tu;


#Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
drop view if exists phongnhieunhanvien;
create view phongnhieunhanvien as 
SELECT D.DepartmentID,D.DepartmentName,count(A.DepartmentID) AS SL 
FROM account AS A
Inner join department AS d on A.DepartmentID = d.DepartmentID
Group by A.DepartmentID
having count(A.DepartmentID) = (select max(A.DepartmentID));
SELECT * FROM phongnhieunhanvien;




##Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo

with honguyentao as (
SELECT A.FullName,A.AccountID,Q.QuestionID,Q.CreatorID
from account A
join question Q on Q.CreatorID = A.AccountID
WHERE SUBSTRING( A.FullName, 1,3  )='Nguyễn' ) 
SELECT * FROM honguyentao;



