
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

* NESTED IF Statement

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

