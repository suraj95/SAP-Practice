*&-------------------------------------------------------------------------------------------
*&    Form  itab02_fill_again
*&-------------------------------------------------------------------------------------------
*     text
*&-------------------------------------------------------------------------------------------
* --> P_Z_FIELD1    text
* <-- p_Z_FIELD2    text
*&-------------------------------------------------------------------------------------------
form itab02_fill_again using p_z_field1
                             p_z_field2.

endform.  "itab02_fill_again

"Given that these variables only have to be declared within sub-routines, 
"rather than the whole program, memory usage is kept to a minimum. 
