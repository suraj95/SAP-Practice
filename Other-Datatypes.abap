REPORT Z_Other_data_types. "Remove this line in online ABAP Editor

* Date fields format: YYYYMMDD with initial value of '00000000' 
DATA my_date TYPE d VALUE '20120101'.

* SY-DATUM is a system variable, which always holds the value of the system’s date.
DATA my_date2 LIKE SY-DATUM. "no value set so will initialized as default value

* Time fields format: HHMMSS with initial value of '000000'
DATA my_time TYPE t VALUE '111005'.

* SY-UZEIT is a system variable, which always holds the value of the system’s TIME.
DATA my_time2 LIKE SY-UZEIT."no value set so will initialized as default value


WRITE: my_date,  "01012012
     / my_date2, "00.00.0000    
     / my_time,  "111005
     / my_time2. "00:00:00
uline.

* Note that in the first row the my_date field has reversed itself to the format DDMMYYYY. 
* In the second, no value was assigned to the field, so the system has output the default 
* zeros. However, as this was defined like the system’s date variable, it has included 
* periods in the formatting. This also applies to the my_time2 field, where colons have 
* appeared between the places where the time values would ordinarily be.

DATA empl_date TYPE d.
DATA todays_date TYPE d.
DATA los TYPE i.

empl_date = '20090515'.
todays_date = SY-DATUM. "set to todays date
los = todays_date - empl_date.
WRITE / los.






