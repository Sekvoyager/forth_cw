: parity_check 
  2 % if 
          ." odd" cr 
      else 
          ." even" cr 
  then 
; 

2. ( n instead of sqrt(n) )
: safe_% dup rot dup rot % rot swap ; 
: safe_< dup rot dup rot < rot swap ; 
: primary_check 2 
      repeat 
              safe_% 
              if
                  0 >r 
              else 
                  1 >r 
              then 
                  swap safe_< 
                  if 
                      0 >r 
                  else 
                      1 >r 
                  then 
                      swap 1 + r> r> lor 
      until 
      safe_< 
          if 
              ." prime" cr 
          else 
              ." not prime" cr 
          then 
;

: put_value 8 allot dup -rot ! ; 

4. : copy
	0 
	do
		  dup2 swap c@ swap c! 1 + swap 1 + swap
	loop
	drop drop
;

: concat
	dup2 swap dup >r swap count swap count swap 1 + dup2 + heap-alloc
	rot r> swap rot dup >r swap dup >r copy
	rot drop r> r@ + swap copy r>
;

5. ( m” sinitskiy” string-hash 3 % .S )
: radical 
  dup 1 < 
    if
	      drop 0
    else 
	      1 swap dup 1 + 2 
	  do
		    dup r@ % 0 = 
		    if 		
			      swap r@ * swap 	
			          repeat
				            r@ / dup r@ % 0 = not
			          until
		    then
	  loop
	  drop
    then 
;  
