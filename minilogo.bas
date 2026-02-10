10 on error goto 10000
20 st$ = "" : REM pilha ( para execucao de blocos aninhados )
30 x = 127: y = 97: PI = atn(1)*4: an = atn(1)*2 : P1 = atn(1)/45
40 dr = 1
50 screen 2,2: keyoff
60 open "grp:" for output as #1
70 s1$ = "": for i = 1 to 32: read a: s1$=s1$+chr$(a): next i: sprite$(0) = s1$
80 sprite$(1) = string$( 8, chr$(255) )
90 PSET (0, 160), 4: print #1,"rutagames 2026": print #1,"welcome to mini logo": gosub 400


100 gosub 11000: ip = 1
110 gosub 500
120 if ip = 0 then 100 else 110


400 putsprite 0,(x-8,y-8),15,0
410 return

450 if dr then line ( x,y ) - ( tx,ty ),15
460 x = tx: y = ty
470 return

500 gosub 1000
510 if f$ = "qt" then end
520 if f$ = "fw" then gosub 1200: tx = x + cos( an ) * n: ty = y - sin( an ) * n: gosub 450 :  gosub 400
525 if f$ = "bk" then gosub 1200: tx = x + cos( -an ) * n: ty = y - sin( -an ) * n: gosub 450 :  gosub 400
530 if f$ = "rg" then gosub 1200: an = an - (n*atn(1))/45: gosub 400
535 if f$ = "lf" then gosub 1200: an = an + (n*atn(1))/45: gosub 400
540 if f$ = "pr" then p$=f$: gosub 1000: print #1,f$
550 if f$ = "rp" then gosub 800
560 if f$ = "cl" then line (0,0)-(255,160),4,bf
570 if f$ = "dr" then gosub 1200: dr = n

670 REM error 90
680 gosub 1100
690 return


800 REM parse e executa repeat (rp)
810 if st$ <> "" then error 89 : return : rem muitos niveis de aninhamento
815 gosub 1200
820 gosub 1300
830 if ip <> 0 then st$ = mid$(c$,ip)
850 for ir = 1 to n
860 c$=l$: ip = 1 
865 if ip > 0 then gosub 500: gosub 1100: goto 865
870 next ir
880 c$ = st$: ip = 1 : gosub 1100 
890 st$ = ""
900 return

1000 REM get a command from c$[ip] (letters) in f$
1002 gosub 1100
1005 f$ = ""
1010 if ip > len( c$ ) then ip = 0 : goto 1030 else cc$ = mid$(c$,ip,1)
1020 if cc$>="a" and cc$<="z" then f$=f$+cc$: ip = ip + 1: goto 1010 else 1030
1030 if f$="" then error 83 : return : REM esperando uma palavra
1040 return

1100 REM skip spaces c$[ip]
1105 if ip = 0 then return
1110 if ip > len( c$ ) then ip = 0: return
1115 if mid$(c$,ip,1) <> " " then return
1120 ip = ip + 1: goto 1110

1200 REM get a integer number from c$[ip] in n$/n
1205 gosub 1100
1210 n$ = ""
1220 if ip = 0 or ip > len(c$) then ip = 0 : goto 1250 else cc$=mid$(c$,ip,1)
1230 if cc$>="0" and cc$<="9" then n$=n$+cc$:ip=ip+1:goto 1220 else 1250
1240 error 84 : return  : REM esperando um numero
1250 if n$="" then 1240
1260 n = val(n$):return

1300 REM get a list block from c$[ip] [] in l$
1310 gosub 1100
1320 l$ = "": st = 0
1330 if ip > len(c$) then ip = 0: goto 1390 else cc$=mid$(c$,ip,1): ip = ip + 1
1340 if cc$ = "[" then st = st + 1: if st > 1 then 1365 else 1370
1350 if st = 0 then error 85 : return  : REM esperando um inicio de bloco [
1360 if cc$ = "]" then st = st - 1: if st > 0 then goto 1365 else 1390
1365 l$ = l$ + cc$
1370 goto 1330
1390 if st <> 0 then error 86 : return : REM bloco iniciado nao foi fechado
1400 if l$ = "" then error 87 : return : REM bloco vazio
1410 if ip > len(c$) then ip = 0
1420 return 

10000 REM error handling
10010 PSET ( 0, 176 ), 4
10020 if err = 83 then print #1,"Esperando uma palavra": goto 10800
10030 if err = 84 then print #1,"Esperando um numero": goto 10800
10040 if err = 85 then print #1,"Esperando um inicio de bloco '['": goto 10800
10050 if err = 86 then print #1,"Bloco iniciado não foi fechado com ']'": goto 10800
10060 if err = 87 then print #1,"Bloco vazio": goto 10800
10060 if err = 89 then print #1,"Muitos blocos aninhados": goto 10800
10070 if err = 90 then print #1,"Comando desconhecido": goto 10800

10700 print #1, "erro:";err;"linha";erl

10800 PSET ( 0,184 ),4
10810 print #1, "> ";c$
10820 if ip > 0 then line ( (ip+1)*8, 191 ) - ( (ip+1)*8+8, 191 )

10990 A$=input$(1):Resume 100

11000 REM screen 2 input to c$
11010 c$ = "": cx = 0: cy = 160 : line (cx,cy)-(255,191),4,bf : putsprite 1,(cx,cy-1),15,1
11020 a$=inkey$: if a$ = "" then 11020
11030 if a$>=" " and a$<="~" and len(c$)<64 then c$=c$+a$ : pset (cx,cy),4: print #1,a$ : cx = cx + 8 : if cx = 256 then cx = 0 : cy = cy + 8
11040 if a$=chr$(8) and len(c$)>0 then c$=mid$(c$,1,len(c$)-1): cy = cy + 8 * ( x = 0 ): cx = cx - 8 - 248 * ( cx = 0 ) : line(cx,cy)-(cx+7,cy+7),4,bf
11050 if a$=chr$(13) then RETURN
11070 putsprite 1,(cx,cy-1),15,1
11090 goto 11020

20000 REM sprites
20010 DATA 00,00,00,00,00,00,00,01,03,03,07,07,&H0F,00,00,00
20020 DATA 00,00,00,00,00,00,00,00,&H80,&H80,&HC0,&HC0,&HE0,00,00,00

