* INSERT Statement

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

* CLEAR Statement

CLEAR wa_employees-title. "clears the title 
wa_employees-title = 'DR'.

CLEAR wa_employees. "clears the whole work area

* UPDATE Statement

wa_employees-employee = '10000029'.
wa_employees-surname = 'EASTMORE'.
wa_employees-forename = 'ANDY'.
wa_employees-title = 'SIR'.
wa_employees-dob = '19324213'.

UPDATE zemployees FROM wa_employees.






