*&-------------------------------------------------------------------------------------------
*&    Form  itab02_write
*&-------------------------------------------------------------------------------------------
*     text
*&-------------------------------------------------------------------------------------------
*    --> P_ITAB02    text
*&-------------------------------------------------------------------------------------------
form itab02_write   tables    p_itab02 structure.

  DATA wa_tmp TYPE line01_typ. "When an internal table is passed into a sub-routine, the local internal table is always declared with a header line. 
  LOOP AT p_itab02 INTO wa_tmp.
    WRITE wa_tmp-surname.
  ENDLOOP.

endform.  "itab02_write

"Once this subroutine is processed, the contents of the local internal table are then 
"passed back to the global internal table.