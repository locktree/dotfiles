"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim abbreviations
" Last Update : Sun 28 Apr 2019 12:27:07 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         ABBREVIATIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab ### ###########################################################################
iab #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUTS - DUTCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab   bv    bijvoorbeeld
iab   dmv   door middel van
iab   dwz   dat wil zeggen
iab   icm   in combinatie met
iab   idd   inderdaad
iab   iig   in ieder geval
iab   iii   in eerste instantie
iab   ipd   in plaats daarvan
iab   ipv   in plaats van
iab   mbv   met behulp van
iab   oa    onder andere
iab   tov   ten opzichte van
iab   ws    waarschijnlijk
iab   zsm   zo snel mogelijk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DAYS AND MONTHS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab   monday      Mondays
iab   tuesday     Tuesday
iab   wednesday   Wednesday
iab   thursday    Thursday
iab   friday      Friday
iab   saturday    Saturday
iab   sunday      Sunday

iab   mon         Mondays
iab   tue         Tuesday
iab   wed         Wednesday
iab   thu         Thursday
iab   fri         Friday
iab   sat         Saturday
iab   sun         Sunday

iab   jan         January
iab   feb         February
iab   mar         March
iab   apr         April
iab   jun         June
iab   jul         Juli
iab   aug         Augustus
iab   sep         September
iab   oct         October
iab   nov         November
iab   dec         December

iab   january     January
iab   febuary     February
iab   march       March
iab   april       April
iab   june        June
iab   july        July
iab   augustus    Augustus
iab   september   September
iab   october     October
iab   november    November
iab   december    December

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DATE and TIME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Date/Time stamps
" %a - Day of the week
" %b - Month
" %d - Day of the month
" %Y - Year
" %H - Hour
" %M - Minute
" %S - Seconds
" %Z - Time Zone

iab  _all    <C-R>=strftime("%d/%m/%y %H:%M:%S %Z")<CR>
iab  _date   <C-R>=strftime("%d/%m/%y")<CR>
iab  _time   <C-R>=strftime("%H:%M")<CR>
iab  _epoch  <C-R>=strftime("%s")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DIGRAPHS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set   digraph
iab   pi                <c-k>p*
iab   power2            <c-k>2S
iab   coproduct         <c-k>*P
iab   summation         <c-k>+Z
iab   root              <c-k>RT
iab   infinity          <c-k>00
iab   delta             <c-k>D*
iab   Theta             <c-k>H*
iab   phi               <c-k>F*
iab   psi               <c-k>Q*
iab   omega             <c-k>W*
iab   alpha             <c-k>a*
iab   beta              <c-k>b*
iab   gamma             <c-k>g*
iab   epsilon           <c-k>e*
iab   eta               <c-k>y*
iab   theta             <c-k>h*
iab   lambda            <c-k>l*
iab   mu                <c-k>m*
iab   rho               <c-k>r*
iab   forall            <c-k>FA
iab   thereexists       <c-k>TE
iab   nullset           <c-k>/0
iab   elementof         <c-k>(-
iab   intersection      <c-k>(U
iab   union             <c-k>U)
iab   subset            <c-k>(C
iab   dot               <c-k>Ob
iab   integral          <c-k>In
iab   doubleintegral    <c-k>DI
iab   tilde             <c-k>?1
iab   almostequal       <c-k>?2
iab   notequal          <c-k>!=
iab   ltoe              <c-k>=<
iab   gtor              <c-k>>=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""