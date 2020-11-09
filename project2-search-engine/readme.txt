README

Atat pentru cerinta 1, cat si pentru cerinta 2, am folosit functia
createMatrix pentru a crea matricea M din pseudocod.
Pentru citire din fisier am folosit functiile fopen, fclose si fscanf.
Pentru afisare am folosit functia fprintf.

Cerinta 1: Iterative
Am recalculat vectorul R pana cand eroarea a devenit mai mica decat eps.
Am initializat vectorul R cu valorile 1/N, unde N e numarul de pagini.

Cerinta 2: Algebraic
Pentru calcularea matricei inverse din pseudocod, am folosit factorizarea
Gramm-Schmidt, descompunand o singura data matricea in Q si R.
Apoi, am rezolvat SST pentru fiecare coloana.

Cerinta 3: Gradul de apartenenta
Pentru citirea valorilor val1 si val2 am folosit functia textread.
Pentru calcularea constantelor a si b, am pus conditia de continuitate si
am rezolvat sistemul:

a * val1 + b = 0
a * val2 + b = 1

Am sortat vectorul R cu ajutorul functiei built-in sort.

Pentru testarea temei am rulat comenzile:

PageRank("graf1", 0.85, 0.001);
PageRank("graf2", 0.85, 0.001);

Overall: o tema interesanta care nu necesita mult timp pentru rezolvare.
Enunt explicat foarte bine.



