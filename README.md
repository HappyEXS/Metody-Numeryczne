# Projekty z przedmiotu Metody Numeryczne

Jan Jędrzejewski 2023L

## Projekt 1

### Zadanie 1 - rozkład LDLt

Napisać uniwersalną procedurę w Matlabie o odpowiednich parametrach wejścia i wyjścia (solwer),
rozwiązującą układ n równań liniowych Ax = b, gdzie x, b ∈ Rn, wykorzystując podaną metodę. Nie
sprawdzać w procedurze, czy dana macierz A spełnia wymagania stosowalności metody. Zakazane
jest użycie jakichkolwiek solwerów w środku. Obliczyć błąd rozwiązania ε = ∥A˜x − b∥2 (skorzystać
z funkcji norm Matlaba).

Metoda: faktoryzacji LDLt

### Zadanie 2 - porównanie solwerów

Wykonać eksperymenty takie jak w p. 1 dla macierzy A i wektorów b danych wzorami:
aii = −20; aij = 7.5, j = i ± 3; aij = 0 dla pozostałych; bi = 4 − 0.5i, używając swojego solwera
z p. 1 oraz solwera GS.m ze strony przedmiotu, będącego implementacją metody Gaussa-Seidela.
Przyjąć itmax=1000 · n, delta=10−8 ≜ 1e−8. Przedstawić wyniki (dokładności i czasy) w tabelach
i wykresach, porównać je i skomentować.

### Zadanie 3 - aproksymacja

Dla podanych w tabeli danych pomiarowych (próbek) metodą najmniejszych kwadratów należy wyznaczyć
funkcję wielomianową y = f(x) (tzn. wektor współczynników) najlepiej aproksymującą te
dane.

## Projekt 2

### Zadanie 1 - metoda siecznych

Proszę znaleźć wszystkie pierwiastki funkcji
f(x) = –1.65 + 0.3x–xe−x/2 w przedziale [–4, 15]
używając:
- własnego solwera z implementacją metody siecznych.
- podanego na stronie przedmiotu solwera newton.m z implementacją metody Newtona

### Zadanie 2 - metoda MM1

Używając metody Mullera MM1 proszę znaleźć wszystkie pierwiastki wielomianu czwartego
stopnia:
f(x) = a4x4 + a3x3 + a2x2 + a1x + a0, [a4 a3 a2 a1 a0] = [–1 1.5 3 1 1.5]

## Projekt 3

### Zadanie - równania różniczkowe (RKF23)

Ruch punktu na płaszczyźnie (x1, x2) jest opisany równaniami:
- dx1/dt = x2 + x1 (0.6 − x21 − x22)
- dx2/dt = −x1 + x2 (0.6 − x21 − x22)

Należy obliczyć przebieg trajektorii ruchu tego punktu w przedziale [0, 20] dla warunków początkowych:
x1(0) = 11, x2(0) = 6.
Rozwiązanie proszę znaleźć korzystając z zaimplementowanej przez siebie w języku Matlaba w formie
funkcji (możliwie uniwersalnej, czyli solwera, o odpowiednich parametrach wejścia i wyjścia) metody
Rungego–Kutty-Fehlberga drugiego rzędu przy zmiennym kroku z szacowaniem błędu
techniką pary metod włożonych (RKF23) .