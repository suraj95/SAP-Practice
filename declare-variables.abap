* Variables must begin with the word DATA

DATA integer01 Type i VALUE 22.		
DATA packed_decimal01 Type p DECIMALS 2 VALUE '-5.5'. 

* If you are creating a large number of variables of the same data type, by using the LIKE addition, a lot of time can be saved

DATA packed_decimal02 LIKE packed_decimal01. 
DATA packed_decimal03 LIKE packed_decimal01. 
DATA packed_decimal04 LIKE packed_decimal01. 

DATA new_surname LIKE zemployees-surname.

* If you do try to change a Constant’s value within the program, this will usually result in a runtime error.

constants myconstant01 type p decimal 1 value '6.6'.
constants myconstant02 type i value 6.





