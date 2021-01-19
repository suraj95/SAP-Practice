*&-------------------------------------------------------------------------------------------
*&    Form  itab02_fill_again
*&-------------------------------------------------------------------------------------------
*     text
*&-------------------------------------------------------------------------------------------
* --> P_ZSURNAME    text
* <-- p_ZFORENAME    text
*&-------------------------------------------------------------------------------------------
form itab02_fill_again using p_zsurname
                             p_zforename.

write / p_zsurname.
write / p_zforename.

p_zsurname = 'abcde'.

endform.  "itab02_fill_again

"Given that these variables only have to be declared within sub-routines, 
"rather than the whole program, memory usage is kept to a minimum. 
