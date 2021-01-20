REPORT Z_MOD_2.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(15) text-001. "starts at position 1 and can hold 15 characters
PARAMETER mynum Type i.
SELECTION-SCREEN END OF LINE.

"This ABAP code was generated automatically from Function Modules
CALL FUNCTION 'SPELL_AMOUNT'
  EXPORTING
    AMOUNT    = mynum
*   CURRENCY  = ' '
*   FILLER    = ' ' 
*   LANGUAGE  = SY-LANGU
  IMPORTING
    IN_WORDS  = result
* EXCEPTIONS
*   NOT_FOUND = 1 
*   TOO_LARGE = 2
*   OTHERS    = 3
.

IF sy-subrc <> 0.
  write: 'The funciton Module returned a value of:', sy-subrc.
else.
  write: 'The amount in words is:', result-word.
ENDIF.