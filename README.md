# Dao Huy Cu/ Stata user

*Sử dụng Stata trong quản lý số liệu nghiên cứu, dự án.*

**I. Chủ đề chung**

**_1. Sử dụng Stata như một notebook với jupyter lab_**

    1.1. Cài đặt stata (phiên bản 14 hoặc mới hơn)   
   - Stata là phần mềm bản quyền cần đặt tại trang web chính thức của [Stata](https://www.stata.com/order/).
   
    1.2. Cài đặt python (phiên bản gần nhất)
   - Cài đặt python phiên bản gần nhất [tại đây](https://www.python.org/downloads/)
   
    1.3. Cài đặt jupyter lab
   - Hướng dẫn cài đặt [tại đây](https://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html)
   
    1.4. Cài đặt Stata kernel và stata syntax highlight
   - Hướng dẫn chi tiết [tại đây](https://kylebarron.dev/stata_kernel/)
   
    1.5. Ví dụ sử dụng Stata notebook trong jupyter lab
   - [Đây](https://nbviewer.jupyter.org/github/dhcvn/UseStata/blob/master/Example.ipynb) là 1 ví dụ về cách sử dụng Stata notebook trong jupyter lab 
   
**_2. Data work flow khi xử lý và phân tích số liệu với Stata_**

    2.1. Thiết lập môi trường làm việc trong Stata
    
   **_Tại sao cần thiết lập môi trường làm việc trong stata?_**
    
    - Khi làm việc có thể số liệu được chia sẻ cho nhiều người cùng 1 nhóm hoặc cho đồng nghiệp/bạn bè.
    - Khi thay đổi ổ đĩa lưu trữ hoặc có nhiều máy tính khác nhau với tên máy tính khác nhau
    - Khi chạy dofile của một người khác nhưng các câu lệnh bổ sung chưa được cài đặt
    
   **_Thiết lập môi trường làm việc có lợi ích gì?_**
   
    Bản thân tôi có thói quen giữ tất cả dofile và một số số liệu thường dùng trên dropbox hoặc google driver và cũng có 2 máy tính khác nhau. Có lúc làm việc trên máy tính labtop, nhưng cũng có khi làm việc trên máy tính để bàn cho nên bước thiết lập môi trường làm việc này hết sức quan trọng đối với tôi. Nó giúp tôi tiết kiệm thời gian truy xuất công việc và số liệu tôi đang làm việc.
  
    Cài đặt các câu lệnh bổ sung
    Stata cho phép người dùng tự xây dựng câu lệnh của mình phù hợp với mục đích sử dụng và đã lưu trữ lại các câu lệnh mà người dùng xây dựng để có thể tái sử dụng.
    
    Dưới đây là [ví dụ](https://nbviewer.jupyter.org/github/dhcvn/UseStata/blob/master/Setup-environment.ipynb) về thiết lập môi trường làm việc và [ví dụ](https://nbviewer.jupyter.org/github/dhcvn/UseStata/blob/master/Setup-packages.ipynb) về cách hệ thống câu lệnh bổ sung
  
**_3. Tài liệu tham khảo_**

**II. Các chủ đề cụ thể**
