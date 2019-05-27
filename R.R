infec <- bet*S*I/N
recov <- I/D

Sdot <- -infec
Idot <- infec - recov
Rdot <- recov
