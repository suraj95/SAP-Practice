* Insert Statement

DATA wa_employees LIKE zemployees.

wa_employees-employee = '10000006'.
wa_employees-surname = 'WESTMORE'.
wa_employees-forename = 'BRUCE'.
wa_employees-title = 'MR'.
wa_employees-dob = '19921213'.

INSERT zemployees FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Record inserted correctly'.
ELSE.
  WRITE: 'We have return code of ', sy-subrc.
ENDIF.



