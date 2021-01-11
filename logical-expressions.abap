
* IF Statement

Data: surname(15) TYPE c.

surname = 'SMITH'.

IF surname = 'SMITH'.
  WRITE: / 'You have won a car!'.
ELSEIF surname = 'BROWN'.
  WRITE: / 'You have won a boat!'.
ELSEIF surname = 'JONES'.
  WRITE: / 'You have won a plane!'.
ELSEIF surname = 'ANDREWS'.
  WRITE: / 'You have won a house!'.
ELSE.
  WRITE: / 'Unlucky! You go empty-handed'.
ENDIF.

Data: forename(15) TYPE c.
forename = 'JOHN'.

IF surname = 'SMITH' AND forename = 'JOHN'.
  WRITE: / 'You have won a bus!'.
ENDIF.

* Nested IF Statement

IF surname = 'SMITH'.
  IF forename = 'JOHN'.
    WRITE: / 'You have won a train!'.
  ELSE.
    WRITE: / 'Ooo, so close'.
  ENDIF.
ENDIF.

* CASE Statement

CASE surname.
  WHEN 'SMITH'.
    WRITE: / 'You have won a car!'.
  WHEN 'BROWN'.
    WRITE: / 'You have won a boat!'.
  WHEN 'JONES'.
    WRITE: / 'You have won a plane!'.
  WHEN 'ANDREWS'.
    WRITE: / 'You have won a house!'.
  WHEN OTHERS.
    WRITE: / 'Unlucky! You go empty-handed'.
ENDCASE.

* SELECT Loops

TABLES: zemployees.

SELECT * FROM zemployees.
  WRITE: / zemployees.
ENDSELECT.

TABLES: zemployees.

SELECT * FROM zemployees WHERE surname = 'MILLS'.
  WRITE: / zemployees.
ENDSELECT.

* DO Loops

DO.
  WRITE: / 'Hello'.
ENDDO.

DO 15 TIMES.
  WRITE: / 'Hello'.
ENDDO.

Data: a TYPE i.

a = 0.

DO 15 TIMES.
  a = a + 1.
  WRITE: / a.
ENDDO.

* Nested DO Loops

Data: a TYPE i,
      b TYPE i,
      c TYPE i.

a = 0.
c = 0.

DO 15 TIMES.
  a = a + 1.
  WRITE: / 'Outer Loop cycle: ', a.
  b = 0.
  DO 10 TIMES.
    b = b + 1.
    WRITE: / 'Inner Loop cycle: ', b.
  ENDDO.
  c = c + b.
ENDDO.
c = c + a.
WRITE: / 'Total Iterations: ', c.

* WHILE Loops

WHILE a <> 15.
  WRITE: / 'Loop cycle: ', a.
  a = a + 1.
ENDWHILE.

* Nested WHILE Loops

WHILE a <> 15. " <> means not equal to (!=)
  a = a + 1.
  WRITE: / 'Outer Loop cycle: ', a.
  b = 0.
  WHILE b <> 10.
    b = b + 1.
    WRITE: 'Inner Loop cycle: ', b.
  ENDWHILE.
  c = c + b.
ENDWHILE.
c = c + a.
WRITE: / 'Total Iterations: ', c.

* Loop Termination— Continue 

DO 15 TIMES.
  a = a + 1.
  IF sy-index = 2.
    CONTINUE. "allows a loop pass to be terminated unconditionally
  ENDIF.
  WRITE: / 'Outer Loop cycle: ', a.
ENDDO.

* Loop Termination— Check

DO 15 TIMES.
  a = a + 1.
  CHECK sy-index <> 2.
  WRITE: / 'Outer Loop cycle: ', a.
ENDDO.

* Loop Termination— Exit  

DO 15 TIMES.
  a = a + 1.
  IF sy-index = 3.
    EXIT.
  ENDIF.
  WRITE: / 'Outer Loop cycle: ', a.
ENDDO
WRITE: / 'FILLER'.
WRITE: / 'FILLER'.






