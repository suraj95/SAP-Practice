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

* Date Fields in Calculations

DATA empl_date TYPE d.
DATA todays_date TYPE d.
DATA fut_date TYPE d.

DATA los TYPE i.
DATA days_count TYPE i.

empl_date = '20090515'. "15th May, 2009 
todays_date = SY-DATUM. "set to todays date (5th Jan, 2021)

los = todays_date - empl_date.
WRITE / los.

days_count = 20.
fut_date = todays_date + days_count. 
WRITE / fut_date. "print date 20 days from now (25th Jan, 2021)

todays_date+6(2) = '20'. "change two characters from the 6th digit
WRITE / SY-DATUM.
WRITE / todays_date."print current date with day changed to 20 (20th Jan, 2021)

todays_date+6(2) = '01'. "change two characters from the 6th digit
WRITE / SY-DATUM.
todays_date = todays_date - 1. "subtract 1 day from current month
WRITE / todays_date. "print last date of previous month (31st December, 2020)

* Time Fields in Calculations

DATA clock_in TYPE t.
DATA clock_out TYPE t.
DATA seconds_diff TYPE i.
DATA minutes_diff TYPE i.
DATA hours_diff TYPE p decimals 2. 

clock_in = '073000'. "7:30 AM
clock_out = '160000'. "4:00 PM
seconds_diff = clock_out - clock_in. "8 hours and 30 minutes = 30,600 seconds

WRITE: 'clock_in: ', clock_in, ' clock_out: ', clock_out.
WRITE / seconds_diff.

minutes_diff = seconds_diff / 60.
WRITE: / 'differences in minutes: ', minutes_diff.

hours_diff = minutes_diff / 60.
WRITE: / 'differences in hours: ', hours_diff.

* if hours_diff is left as an integer, then 8.5 hours is automatically rounded off to 9.





