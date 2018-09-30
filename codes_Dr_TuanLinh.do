**-----------Thực hành lại đoạn codes theo post của Dr.Tuấn Linh
version 14.0
set more off
**Created: 29/09/2018

** Tạo dictionary cho các biến
cd "D:\zytcc\Python"
import delimited C:\Users\DHC\Downloads\TB_data_dictionary_2018-09-19.csv, clear 
rename (v1 v2 v3 v4) (varname dataset code_list defination)
keep if dataset=="Notification"
gen order=_n
save data_dict.dta, replace
*----------
import delimited using "TB_notifications_2018-07-20", clear
gen order=_n
merge 1:1 order using data_dict

* Gán nhãn cho số liệu
quietly count if !mi(varname)
forvalues i=1/`r(N)' {
	local name=varname[`i']
	local varlab=defination[`i']
	cap la var `name' "`varlab'"
}
drop order varname dataset code_list defination _merge
* Mô tả bộ số liệu
d, short //Obs: 7854, vars: 175

**Xem tên cột và định dạng data
d, varlist

**Đổi tên biến
foreach x in m f {
	rename new_sp_`x'* new_sp_`x'_*
	rename new_sn_`x'* new_sn_`x'_*
	rename new_ep_`x'* new_ep_`x'_*
	rename newrel_`x'* new_rel_`x'_* 
}
rename new_sn_sexunk* new_sn_sexunk_*
rename new_ep_sexunk* new_ep_sexunk_* 
rename newrel_sexunk* new_rel_sexunk_*

* Tách riêng số liệu cho Việt Nam
keep if country=="Viet Nam"
keep year new_*
keep if year>=1995 // Giữ lại data
* Kiểm tra missing
missings report _all

* Chuyển dạng dữ liệu thành dạng data
reshape long new_@, i(year) j(type) string

** Final cleaning steps
split type, p(_)
rename (new_ type1 type2 type3) (cases tb_forms sex agegroup)

** Tính toán số lượng cases theo năm
collapse (sum) cases, by(year)
