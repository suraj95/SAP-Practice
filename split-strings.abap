DATA: mystring(30) TYPE c,
      a1(10) TYPE c,
      a2(10) TYPE c,
      a3(10) TYPE c,
      sep2(2) TYPE c VALUE '**'.
      
mystring = '1234** ABCD **6789'.
WRITE mystring.
SKIP.

SPLIT mystring AT sep2 INTO a1 a2 a3.

WRITE / a1. "1234      
WRITE / a2. " ABCD
WRITE / a3. " 6789

SPLIT mystring AT sep2 INTO a4 a5.

* In this case, with less fields than those defined, the system will include the remainder of the string in the final field.

WRITE / a4. "1234
WRITE / a5. " ABCD **67

 

