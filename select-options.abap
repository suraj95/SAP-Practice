
SELECT-OPTIONS my_dob FOR zemployees-dob.

SELECT * FROM zemployees.
  IF zemployees-dob in my_dob.
    WRITE: / zemployees.
  ENDIF.
ENDSELECT. 

