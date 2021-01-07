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

wa_employees-employee = '10000007'. 
wa_employees-surname = 'WESTMORE'.
wa_employees-forename = 'BRUCE'.
wa_employees-title = 'MR'.
wa_employees-dob = '19921213'.

CLEAR wa_employees. "clears the whole work area

* UPDATE Statement

wa_employees-employee = '10000006'. "this is a key field (has to be unique)
wa_employees-surname = 'EASTMORE'.
wa_employees-forename = 'ANDY'.
wa_employees-title = 'MR'.
wa_employees-dob = '19921213'.

UPDATE zemployees FROM wa_employees.

* MODIFY Statement

CLEAR wa_employees. "to ensure work-area is empty

wa_employees-employee = '10000006'. 
wa_employees-surname = 'NORTHMORE'.
wa_employees-forename = 'PETER'.
wa_employees-title = 'MR'.
wa_employees-dob = '19921213'.

MODIFY zemployees FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Record modified correctly'.
ELSE.
  WRITE: 'We have return code of ', sy-subrc.
ENDIF.

CLEAR wa_employees.

wa_employees-employee = '10000007'. 
wa_employees-surname = 'SOUTHMORE'.
wa_employees-forename = 'SUSAN'.
wa_employees-title = 'MRS'.
wa_employees-dob = '19921213'.

MODIFY zemployees FROM wa_employees.

IF sy-subrc = 0.
  WRITE 'Record modified correctly'.
ELSE.
  WRITE: 'We have return code of ', sy-subrc.
ENDIF.









