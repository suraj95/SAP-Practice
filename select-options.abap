
* SELECT-OPTIONS Example

SELECT-OPTIONS my_dob FOR zemployees-dob NO-EXTENSION.

SELECT * FROM zemployees.
  IF zemployees-dob in my_dob.
    WRITE: / zemployees.
  ENDIF.
ENDSELECT. 

