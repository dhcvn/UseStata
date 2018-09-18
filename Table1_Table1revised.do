						Package table1
					tác giả: Phil Clayton
. Package table1 giúp người phân tích số liệu rất nhanh tạo được các bảng tiêu chuẩn để viết báo cáo.
. Với table1 các bảng sẽ được định dạng sẵn, vì vậy không mất nhiều công format bảng.
. Ngoài ra, table1 cũng sẽ tính toán 1 số test thống kê: chi2, Anova, Ttest...khi các biến 
đầu vào thỏa mãn điều kiện của test.

Ví dụ về cách sử dụng table1

sysuse bplong, clear

*** Install package
capture which table1
if _rc == 111 {
ssc install table1
}

*** Tạo bảng kết quả 1 chiều hiển thị trong cửa sổ result của Stata
table1, vars(sex cat\ agegrp cat\when cat\ bp contn) one format(%9.2f)

/*Kết quả câu lệnh:
+--------------------------------------------+
Factor                      Value          
--------------------------------------------
N                           240            
--------------------------------------------
Sex                                        
Male                     120 (50.0%)    
Female                   120 (50.0%)    
--------------------------------------------
Age Group                                  
30-45                    80 (33.3%)     
46-59                    80 (33.3%)     
60+                      80 (33.3%)     
--------------------------------------------
Status                                     
Before                   120 (50.0%)    
After                    120 (50.0%)    
--------------------------------------------
Blood pressure, mean (SD)   153.90 (13.08) 
+--------------------------------------------+

*/

*** Tạo bảng kết quả  1 chiều và lưu dưới sạng excel file (đuôi .xls)
table1, vars(sex cat\ agegrp cat\when cat\ bp contn) one format(%9.2f) ///
        saving(table1.xls, replace)
****Kết quả khi xuất file sang excel cũng tương tự như hiển thị ở trên
		
*** Tạo bảng kết quả 2 chiều hiển thị trong cửa sổ result của Stata
table1, vars(agegrp cat\when cat\ bp contn) one format(%9.2f) ///
		by(sex)
		
/*Kết quả của câu lệnh:
+-----------------------------------------------------------------------+
Factor                      Male             Female           p-value 
-----------------------------------------------------------------------
N                           120              120                      
-----------------------------------------------------------------------
Age Group                                                        1.00 
30-45                    40 (33.3%)       40 (33.3%)               
46-59                    40 (33.3%)       40 (33.3%)               
60+                      40 (33.3%)       40 (33.3%)               
-----------------------------------------------------------------------
Status                                                           1.00 
Before                   60 (50.0%)       60 (50.0%)               
After                    60 (50.0%)       60 (50.0%)               
-----------------------------------------------------------------------
Blood pressure, mean (SD)   157.39 (13.54)   150.42 (11.66)    <0.001 
+-----------------------------------------------------------------------+

*/

*** Tạo bảng kết quả 2 chiều và lưu dưới dạng excel
table1, vars(agegrp cat\when cat\ bp contn) one format(%9.2f) ///
		by(sex) saving(table2.xls, replace)
****Kết quả khi xuất file sang excel cũng tương tự như hiển thị ở trên

Ưu điểm: package tạo bảng theo tiêu chuẩn có thể dùng để viết báo cáo hoặc để public được,
			cú pháp đơn giản dễ viết.
Nhược điểm: Tác giả format theo chuẩn báo cáo nước ngoài, không phải tất cả ở VN đều 
			  sử dụng định dạng chuẩn quốc tế để viết báo cáo. Tần số và % thường sẽ là 2 cột riêng rẽ.
			  Vì vậy nếu áp dụng lệnh này sẽ mất thời gian để tách tần số và % ra 2 cột khác nhau.
			  
Để giải nhược điểm này, dựa vào code của Phil Clayton, có thể tùy chỉnh để có định dạng mong muốn.
Nơi lưu trữ codes của câu lệnh sau khi install "C:\ado\plus\t"

Ví dụ 1 cách giải quyết vấn đề như sau:

quietly do "C:\Users\DHC\Dropbox\Mywork\2.Codes\table2.do"
*** Tạo bảng kết quả 1 chiều hiển thị trong cửa sổ result của Stata
table2, vars(sex cat\ agegrp cat\when cat\ bp contn) one format(%9.2f)

/*
Kết quả của câu lệnh: Cột bên trái là tần số và bên phải là %
+-----------------------------------------------------+
Factor                      .        Value          
-----------------------------------------------------
N                           .        240            
-----------------------------------------------------
Sex                         .                       
Male                     120      50.0           
Female                   120      50.0           
-----------------------------------------------------
Age Group                   .                       
30-45                    80       33.3           
46-59                    80       33.3           
60+                      80       33.3           
-----------------------------------------------------
Status                      .                       
Before                   120      50.0           
After                    120      50.0           
-----------------------------------------------------
Blood pressure, mean (SD)   .        153.90 (13.08) 
+-----------------------------------------------------+

*/
*** Tạo bảng kết quả 2 chiều hiển thị trong cửa sổ result của Stata
table2, vars(agegrp cat\when cat\ bp contn) one format(%9.2f) ///
		by(sex)
/*
Kết quả của câu lệnh:		
+-----------------------------------------------------------------------------------------+
Factor                      .        Male             .        Female           p-value 
-----------------------------------------------------------------------------------------
N                           .        120              .        120                      
-----------------------------------------------------------------------------------------
Age Group                   .                         .                            1.00 
30-45                    40       33.3             40       33.3                     
46-59                    40       33.3             40       33.3                     
60+                      40       33.3             40       33.3                     
-----------------------------------------------------------------------------------------
Status                      .                         .                            1.00 
Before                   60       50.0             60       50.0                     
After                    60       50.0             60       50.0                     
-----------------------------------------------------------------------------------------
Blood pressure, mean (SD)   .        157.39 (13.54)   .        150.42 (11.66)    <0.001 
+-----------------------------------------------------------------------------------------+
*/

*** Muốn biết test thống kê nào được sử dụng
table2, vars(agegrp cat\when cat\ bp contn) one format(%9.2f) ///
		by(sex) test

/* Kết quả của câu lệnh:
+-----------------------------------------------------------------------------------------------------------------+
Factor                      .        Male             .        Female           p-value   Test                  
-----------------------------------------------------------------------------------------------------------------
N                           .        120              .        120                                              
-----------------------------------------------------------------------------------------------------------------
Age Group                   .                         .                            1.00   Pearson's chi-squared 
30-45                    40       33.3             40       33.3                                             
46-59                    40       33.3             40       33.3                                             
60+                      40       33.3             40       33.3                                             
-----------------------------------------------------------------------------------------------------------------
Status                      .                         .                            1.00   Pearson's chi-squared 
Before                   60       50.0             60       50.0                                             
After                    60       50.0             60       50.0                                             
-----------------------------------------------------------------------------------------------------------------
Blood pressure, mean (SD)   .        157.39 (13.54)   .        150.42 (11.66)    <0.001   Two sample t test     
+-----------------------------------------------------------------------------------------------------------------+

*/

Nhược điểm: 
Ưu điểm: package table2 chỉnh sửa dựa trên package table1 vậy nên cú pháp sẽ không thay đổi, help table1 để biết nhiều thông tin hơn
