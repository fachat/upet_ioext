
 100 open2,2,2,chr$(15)
 101 print chr$(14)
 105 rem #####################
 110 get a$:if a$="" then 130
 111 rem crude petscii to ascii
 112 a=asc(a$)
 114 if a>63 and a<96 then a$=chr$(a+32)
 115 if a=20 then a$=chr$(8)
 116 if a>127 then a$=chr$(a and 127)
 120 print#2,a$;
 125 if a$=chr$(13) then print#2,chr$(10);
 127 rem #####################
 130 get#2,a$:if a$="" then 150
 131 rem crude ascii to petscii
 132 a=asc(a$)
 133 if a=8 then a$=chr$(20)
 134 if a>63 and a<96 then a$=chr$(a+128)
 135 if a>95 and a<128 then a$=chr$(a-32)
 140 print a$;
 145 rem #####################
 150 goto 110


