# Dao Huy Cu/ Stata user

*Sử dụng Stata trong quản lý số liệu nghiên cứu, dự án.*

**I. Chủ đề chung**

**_1. Sử dụng Stata như một notebook với jupyter lab_**

    1.1. Cài đặt stata (phiên bản 14 hoặc mới hơn) 
  
    1.2. Cài đặt python (phiên bản gần nhất)
  
    1.3. Cài đặt jupyter lab
  
    1.4. Cài đặt Stata kernel và stata syntax highlight
  
    1.5. Ví dụ sử dụng Stata notebook trong jupyter lab
  
**_2. Data work flow khi xử lý và phân tích số liệu với Stata_**

    2.1. Thiết lập môi trường làm việc
    
    **_Tại sao cần thiết lập môi trường làm việc trong stata?_**
    - Khi làm việc có thể số liệu được chia sẻ cho nhiều người cùng 1 nhóm hoặc cho đồng nghiệp/bạn bè.
    - Khi thay đổi ổ đĩa lưu trữ hoặc có nhiều máy tính khác nhau với tên máy tính khác nhau
    
    **_Thiết lập môi trường làm việc có lợi ích gì?_**
    Bản thân tôi có thói quen giữ tất cả dofile và một số số liệu thường dùng trên dropbox hoặc driver và cũng có 2 máy tính khác nhau với tên máy khác nhau. Có lúc làm việc trên máy tính labtop, nhưng cũng có khi làm việc trên máy tính để bàn cho nên bước thiết lập môi trường làm việc này hết sức quan trọng đối với tôi. Nó giúp tôi tiết kiệm thời gian truy xuất công việc và số liệu tôi đang làm việc.
    1. Tạo adofile các thư mục, đường dẫn tới thư mục để truy xuất mỗi lần khởi chạy stata.
    2. Thiết lập username và pattern của đường dẫn. Dưới đây là 1 ví dụ.
  
    2.2. Cài đặt các câu lệnh bổ sung
    Các user package sẽ giúp thực hiện những công việc mà các lệnh thông thường trong Stata không thực hiện được, khắc phục được những hạn chế của các câu lệnh được cài đặt mặc định. Trong quá trình sử dụng tôi tìm tòi và biết thêm nhiều user command hữu dụng mà chưa gặp bao giờ. Tôi lưu và cập nhật những packages bổ sung của tôi thống nhất cao, cũng tương tự như phần trên, 1 adofile sẽ được xây dựng để thực hiện công việc này. Dưới đây là 1 ví dụ.

    2.3. Template file làm việc với Stata notebook
  
**_3. Tài liệu tham khảo_**

**II. Các chủ đề cụ thể**
