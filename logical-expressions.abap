
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
  WRITE: / 'You have won a train!'.
ENDIF.







 

