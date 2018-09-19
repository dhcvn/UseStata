					Package: mrtab
					Author: Ben Jann
mrtab là viết tắt cho: multiple responses table (Bảng kết quả cho câu nhiều lựa chọn)
Lệnh này cho phép tạo các bảng kết quả nhanh gọn cho các câu hỏi nhiều lựa chọn.
Ngoài ra package có những lựa chọn để tính toán các test thống kê phù hợp.

* Tải bộ số liệu thực hành theo help file của mrtab
use "http://fmwww.bc.edu/RePEc/bocode/d/drugs.dta", clear
//Số liệu điều tra người nghiện ma túy tại Thụy Sỹ năm 1997

* Câu hỏi về nguồn thu nhập (Sources of income) là các biến từ inc1-inco7
* Mỗi biến có 2 lựa chọn 0=no 1=yes
* Sử dụng package table1 để check số liệu trước khi sử dụng mrtab
table1, vars(inco1 cat\inco2 cat\inco3 cat\inco4 cat\inco5 cat\inco6 cat\inco7 cat) ///
		one missing

/* Kết quả của câu lệnh:
+------------------------------------------------------------------------+
Factor                                                     Value       
------------------------------------------------------------------------
N                                                          972         
------------------------------------------------------------------------
private support (partner, family, friends)                             
no                                                      746 (76.7%) 
yes                                                     226 (23.3%) 
------------------------------------------------------------------------
public support (unemployment insurance, social benefits)               
no                                                      365 (37.6%) 
yes                                                     607 (62.4%) 
------------------------------------------------------------------------
drug dealing                                                           
no                                                      679 (69.9%) 
yes                                                     293 (30.1%) 
------------------------------------------------------------------------
housebreaking, theft, robbery                                          
no                                                      922 (94.9%) 
yes                                                     50 (5.1%)   
------------------------------------------------------------------------
prostitution                                                           
no                                                      890 (91.6%) 
yes                                                     82 (8.4%)   
------------------------------------------------------------------------
inco6                                                                  
no                                                      821 (84.5%) 
yes                                                     151 (15.5%) 
------------------------------------------------------------------------
legal occupation                                                       
no                                                      620 (63.8%) 
yes                                                     352 (36.2%) 
+------------------------------------------------------------------------+
*/
Nhận thấy rằng các biến từ inco1-inco7 không có giá trị missing.
Bây giờ chúng ta cần 1 bảng kết quả cho nguồn thu nhập chỉ gồm tần số và % của các giá trị "yes" trong các lựa chọn.
mrtab sẽ nhanh chóng giải quyết bài toán này.

mrtab inco1-inco7, include title(Sources of income) width(30)
/* kết quả câu lệnh 
                                      |                Pct. of     Pct. of
                     Sources of income |      Freq.   responses       cases
        -------------------------------+-----------------------------------
        inco1          private support |        226       12.83       23.25
                     (partner, family, |
                              friends) |
        inco2           public support |        607       34.47       62.45
              (unemployment insurance, |
                      social benefits) |
        inco3             drug dealing |        293       16.64       30.14
        inco4    housebreaking, theft, |         50        2.84        5.14
                               robbery |
        inco5             prostitution |         82        4.66        8.44
        inco6       "mischeln"/begging |        151        8.57       15.53
        inco7         legal occupation |        352       19.99       36.21
        -------------------------------+-----------------------------------
                                 Total |       1761      100.00      181.17
*/
Kết quả của mrtab trùng khớp với kết quả của table1 ở trên.
Hình dung tới những bộ số liệu nghiên cứu trên thực tế đã gặp phải--->>>>>>>>
*-------------------------------------------------------------------------------
Vậy nếu 1 câu hỏi có nhiều đáp án đúng thì sẽ sử dụng mrtab như thế nào?
Ví dụ trong biến tội phạm (crime1-crime5)

* Sử dụng table1 để check số liệu trước khi dùng mrtab			
table1, vars( crime1 cat \crime2 cat crime3 cat\crime4 cat\crime5 cat) one missing
/* Kết quả của câu lệnh (đã rút gọn, không đưa hết vào do file)
+----------------------------------------------+
Factor                           Value       
----------------------------------------------
N                                972         
----------------------------------------------
hit someone                                  
no                            716 (73.7%) 
yes, as committer             62 (6.4%)   
yes, as victim                97 (10.0%)  
yes, both                     32 (3.3%)   
65 (6.7%)   
----------------------------------------------
*/
Nhìn vào kết quả ta thấy có 4 câu trả lời cho câu hỏi đã đánh ai bao giờ chưa?
0=Chưa
1=Có, là người đánh
2=Có, là người bị hại luôn
3=Có, cả 2 (nghĩa là đi đánh người ta xong bị người ta oánh lại)

Như vậy muốn xác định tần số những trường hợp 1 người là người bị hại trong những 
câu hỏi về tội phạm thì phải bao gồm đáp án 2 và đáp án 3. Không có mrtab sẽ mất rất nhiều thao tác
để có thể đưa ra bảng kết quả.

* Cùng chạy lệnh với option response là 2 và 3, nghĩa là lựa chọn 2 và 3 là lựa chọn chúng ta quan tâm 
mrtab crime1-crime5, include response(2 3) title(Crime (là người bị hại)) nonames

/*Kết quả của câu lệnh
                               |             Percent of     Percent
       Crime (là người bị hại) |  Frequency   responses    of cases
-------------------------------+-----------------------------------
                   hit someone |        129       41.08       14.22
  use a weapon against someone |         27        8.60        2.98
       sexual harassment, rape |         31        9.87        3.42
robbery (including drug theft) |         99       31.53       10.92
                     blackmail |         28        8.92        3.09
-------------------------------+-----------------------------------
                         Total |        314      100.00       34.62

Valid cases:        906
Missing cases:       65
*/
Nếu như cộng tần số đáp án 2 và 3 như ở table1, kết quả cho hit someone cũng sẽ là 129.
Ngoài ra kết quả còn cho thấy có 65 missing trong số các biến về tội phạm này.
Điều tuyệt vời hơn, mrtab còn cho chúng ta phân tích theo nhóm những bảng kết quả trên (two-way table)	

* Cùng chạy lệnh với lựa chọn by() và biến số phân nhóm, ở đây là by(sex). 
* Và lựa chọn column để tính % theo cột (theo nam/nữ)
mrtab crime1-crime5, include response(2 3) ///
					title(Crime (là người bị hại)) nonames width(18) ///
					by(sex) column 
/*Kết quả của câu lệnh

Crime (là người bị |   Sex of respondent    
              hại) |     female        male |      Total
-------------------+------------------------+-----------
       hit someone |         35          94 |        129 
                   |      14.46       14.16 |      14.24 
-------------------+------------------------+-----------
      use a weapon |          4          22 |         26 
   against someone |       1.65        3.31 |       2.87 
-------------------+------------------------+-----------
sexual harassment, |         31           0 |         31 
              rape |      12.81        0.00 |       3.42 
-------------------+------------------------+-----------
robbery (including |         32          66 |         98 
       drug theft) |      13.22        9.94 |      10.82 
-------------------+------------------------+-----------
         blackmail |         14          14 |         28 
                   |       5.79        2.11 |       3.09 
-------------------+------------------------+-----------
             Total |        116         196 |        312 
                   |      47.93       29.52 |      34.44 
             Cases |        242         664 |        906 

Valid cases:        906
Missing cases:       65
*/
Ngoài ra, package còn cung cấp thêm những test thống kê cho các bảng 2 chiều.
help mrtab để tìm hiểu 

Kết luận: package mrtab sẽ giúp tiết kiệm phần lớn các bước phụ để tạo ra 1 bảng kết quả
phù hợp với nhiều loại câu hỏi nhiều lựa chọn.
