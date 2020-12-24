DATA: int_telephone_num(17) TYPE c,
      country_code(3) TYPE c,
      telephone_num(14) TYPE c.

int_telephone_num = '+44-(0)207-123456'.
WRITE int_telephone_num. "+44-(0)207-123456
SKIP.

country_code = int_telephone_num(3). "upto 3rd digit 
telephone_num = int_telephone_num+4(13). "from 4th digit to 13th digit
WRITE / country_code. "+44
WRITE / telephone_num. "207-123456

country_code+1(2) = '01'.

WRITE / country_code. "+01

 

