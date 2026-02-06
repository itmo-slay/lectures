#set page(margin: 20pt)
#import "@preview/cetz:0.4.2" as cetz
#import "@preview/cetz-plot:0.1.3" as cetz_plot
#import "@preview/fletcher:0.5.8" as fletcher


// макросы
#let dabs(x) = $abs(abs(#x))$

#let sumtb(x, top, bottom) = $display(sum^(#top)_(#bottom) #x)$

#let exprtb(func, x, top, bottom) = $display(#func^(#top)_(#bottom) #x)$

// TODO: update the thingy with this block
#let titleless_block(body) = [
  #rect(
    radius: 5pt,
    outset: 5pt,
    fill: rgb("#c2dec17f"),
    stroke: 1pt + rgb("#0101018a"),

    [#body]
  )
]

#let topicbreak(n) = [
  #for i in range(n) {
    linebreak()
  }
  #line(length: 100%, stroke: 0.3pt)
  #for i in range(n) {
    linebreak()
  }
]

#let lecturebreak(n) = [
  #for i in range(n) {
    linebreak()
  }
  #line(length: 100%, stroke: 1pt)
  #for i in range(n) {
    linebreak()
  }
]

#let linebreakn(n) = [
  #for i in range(n){
    linebreak()
  }
]

#lecturebreak(0)

#align(center)[
= Специальные разделы высшей математики
]

#linebreak()

До марта изучаем линейные пространства и дифференциальные уравнения

#linebreakn(3)

= Лекция 01. 04-02-2026. 2-й семестр

== Евклидовы пространства. Метрические пространства

*Метрические пр-ва* - это множество $M$, на котором задана функция - *метрика* - $rho: M times M arrow.r R$ (расстояние), удовлетворяющая свойствам: $wide forall x, y, z in M$\

#titleless_block([
  #columns(2)[
    1). $rho(x, y) gt.eq 0,
    quad rho(x,y) = 0 arrow.l.r.double x = y$

    2). $rho(x,y) = rho(x, y)$

    3). $rho(x, z) lt.eq rho(x, y) + rho(y, z)$

    #colbreak()

    #align(right)[(неотрицательность положительная окружность)]

    #align(right)[(симметричность)]

    #align(right)[(нер-во треугольника)]
  ]
])

Примеры:

1) $x in R$, $rho(x, y) = abs(x - y)$

2) $x, y in R^n$, $rho(x, y) = sqrt(sumtb((x_i - y_i)^2, n, i=1))$, $x = (x_1, x_2, x_3, ..., x_n)^T$, $y = (y_1, y_2, y_3, ... y_n)^T$

3). $C_([a, b])$ - множество определенных и непрерывных на $[a, b]$ функций, $f(t), g(t) in C_([a,b]), t in [a, b]$\
$rho(f, g) = exprtb(max, abs(f(t) - g(t)), quad, t in [a,b])$\

#topicbreak(1)

*Нормированное пространство* - это линейное пр-во $V$, в котором задано отображение - *норма* - $dabs(x) : V arrow.r RR$\
1). $forall x in V, dabs(x) = 0, x = 0$ (положительная окружность)\
2). $forall x in V, forall x in RR, dabs(lambda x) = abs(lambda) dot dabs(x)$ (линейность)\
3). $forall x, y in V, dabs(x + y) lt.eq dabs(x) + dabs(y)$ (неравенство треугольника)\

Примеры:\

1). $dabs(x)_P = root(P, sumtb(abs(x_i)^P, n, i=1)), quad x in RR^n, quad x = mat(x_1; dots.v ; x_n)$\

2). $dabs(x)_max = exprtb(max, abs(x_i), quad, i=overline("1," n)), quad x in RR^n, quad x = mat(x_1; dots.v ; x_n)$


#topicbreak(1)

#align(center)[=== Евклидова пространства. Скалярное произведение]

Скалярное произведение - функция, определенная на вещественном линейно пространстве $V$, которая $x, y in V$, $(x, y): V times V arrow.r RR$, удовлетворяет свойствам:\
#titleless_block([
  1). $(x, y) = (y, x)$ (симметричность)\
  2). $(lambda x, y) = lambda(x, y)$ - линейность относительно первого множителя\
  $ wide (x, lambda y) = lambda(x, y)$ - линейность относительно второго множителя $arrow.r.double$ билинейность\
  
  3). $(x, y) gt.eq 0, (x, x) = 0 arrow.r.l.double x = 0$ (положительная окружность)\
])

#linebreakn(2)

Линейное пространство $V$, на котором определено скалярное произведение, называется евклидовым пространством и обозначается $cal(E)$, $dim cal(E) = dim V$\

Пример:\
1). $V$ - линейное пространство геометрических векторов: $(x, y) = abs(x) dot abs(y) dot cos(x accent(", ", hat) y)$;\ 
#move(dx: 30pt)[$R^3 : {i, j, k}, $ \ $x = x_1 i + x_2 j + x_3 k,$ \ $ y = y_1 i + y_2 j + y_3 k$\
$ (x, y) = x_1 y_1 + x_2 y_2 + x_3 y_3$]

2). $V$ - линейное пространство $R^n$, $x = (x_1, dots, x_n)^T$, $y = (y_1, dots , y_n)^T$\
$(x, y) = sumtb(x_i dot y_i, n, i=1 )$

3). $C_([a, b]): f(t), g(t) in C_([a, b]) : (f, g) = integral^e_a f(t) dot g(t) d t$\

#topicbreak(1)

#align(center)[=== Теорема (Неравенство Коши-Буняковский)]\
Для $forall x, y in cal(E)$ выполняется неравенство:\
$ abs((x, y)) lt.eq sqrt((x, x)) dot sqrt((y, y)) $
Причем, равенство достигается, тогда и только тогда, когда векторы $x$ и $y$ линейного пространства\

Доказательство:\

1). $y = 0, (x, overline(0)) = (x, 0 dot overline(0)) = 0 dot (x, overline(0)) = 0$;\

2). $y = 0, f(t) = (x + t y, x + t y), wide t in RR$,\

#move(dx: 30pt)[
  $f(t) = (x, x) + t(x, y) + t(y, x) + (y, y)t^2, wide t(t) gt.eq 0$ (по определению)\

  $f(t) = t^2(y, y) + 2t(x, y) + (x, x) wide cal(D)/4 = (x, y)^2 - (x,x)(y,y) lt.eq 0$\

  $(x, y)^2 lt.eq (x,x)(y,y) arrow.r.double abs((x, y)) lt.eq sqrt((x, x)) dot sqrt((y, y)) wide cal(D)/4, quad t_0$ - единственный\

  $f(t) = 0, quad (x + t_0 y, x + t_0 y) = 0 quad x + t_0 y = 0 wide x = t_0 y,$ то есть $x, y$ в линейном пространстве, чтд
]

#topicbreak(1)

#align(center)[=== Евклидово нормированное пространство]\

Определение: \

Пусть $cal(E)$ - евклидово пространство, нормой (длиной) вектора $x in cal(E)$ называется число $dabs(x) = sqrt((x, x))$\

#move(dx:350pt)[
  $dabs(x) = sqrt(sum^n_(i=1) x_i^2), quad x in RR^n$\
]

Норма обладает следующими свойствами:\
#titleless_block([
  1). $dabs(x) gt.eq 0, quad dabs(x) = 0,$ тогда и только тогда, когда $x = 0$;\

  2). $dabs(lambda x) = abs(lambda) dot dabs(x)$,\

  3). $dabs(x + y) lt.eq dabs(x) + dabs(y), forall x, y in cal(E)$\
])
Доказательство:\
1). по определению

2). $x, lambda x, wide (lambda x, lambda x) = sum^n_(i=1) lambda^2 sum^n_(i=1) x^2_i$

$dabs(lambda x) = sqrt(lambda^2 sum^n_(i=1) x^2_i) = abs(lambda) sqrt(sum x^2_i) = lambda dabs(x)$\

3). $dabs(x + y) lt.gt dabs(x) + dabs(y) quad arrow.r quad (dabs(x + y))^2 lt.eq (dabs(x) + dabs(y))^2 quad arrow.r quad dabs(x + y))^2 = (x + y; x + y) =$\
$= (x, x) + (x, y) + (y, x) + (y, y) = dabs(x)^2 + 2(x, y) + dabs(y)^2$\

По неравенству К-Б:\

$(x, y) lt.eq abs((x, y)) lt.gt dabs(x) dot dabs(y) lt.gt dabs(x)^2 + 2dabs(x) dot dabs(y) + dabs(y)^2 = dabs(x)$

#topicbreak(1)

#align(center)[=== Евклидовы пространства]


1). $dabs(x)_cal(E), quad dabs(x)_2 = sqrt(sumtb(x_i^2, n, i=1)) wide -$ стандартная/евклидова/шаровая/сферическая норма\

2). $dabs(x)_1 = sumtb(abs(x_i), n, i=1) wide -$ октаэдрическая/манхэтанская/норма - сумма

$dabs(x)_1 lt.gt 1 quad arrow.l$ множество точек $RR^3$\

3). $dabs(x)_infinity = exprtb(max, (abs(x_i)), quad, i=overline("1,4")) wide -$ кубическая/чебышевская/ норма - бесконечность\

$dabs(x)_infinity lt.eq r, quad r = 1$\

4). $C_([a, b]) wide dabs(f) = sqrt(exprtb(integral, f^2(t)d t, b, a))$

5). Норма матриц: $A$ - матрица: неотрицательное число, характирезующее "размер" или "величину" матрицы, норма матрицы удовлетворяет всем свойствам нормы\

#columns(2)[
Операторные нормы:\
- столбцовая норма $quad dabs(A)_1 = exprtb(max, sumtb(abs(a_(i j)), m, j=1), quad, i="1,n")$


- строчная норма $quad dabs(A)_infinity = exprtb(max, sumtb(abs(a_(i j)), n, i=1), quad, j="1,m")$

- спектральная норма $quad dabs(A)_2,$ квадратная матрица\

$dabs(A)_2 = sqrt(lambda_max (A^T dot A))$, где $lambda_max$ - максимальное собственное значение матрицы $(A^T dot A)$\


#colbreak()

Неоператорные нормы:\
- норма Фробениуса

$dabs(A)_F = sqrt(sumtb(a^2_(i j), n, "i, j" = 1)) = sqrt(t r (A^T dot A)), A$ - кв. матрица 

]

#align(center)[=== Угол между векторами. Ортогональность.]

Неравенство К-Б: $abs((x, y)) lt.eq dabs(x) dot dabs(y), quad x, y in cal(E) wide abs((x, y)) / (dabs(x) dot dabs(y)) lt.eq 1 wide abs(cos(phi)) lt.eq 1, quad 0 lt.eq cos(phi) lt.eq 1, phi in [0;, pi]$

Вектор $x, y$ - ортогональны, если $phi = pi/2,$ если $(x, y) = 0$

Ортогональные системы векторов:\
$(a_1, a_2, dots, a_k) in cal(E)$ называется ортогональной, если все векторы попарно ортогональны, т.е. $(a_i, a_j) = 0,$ при $i eq.not j$\

Система векторов $(a_1, a_2, dots, a_k) in cal(E)$ называется ортонормированной, если все векторы попарно ортогональны:\
$a dabs(a_i) = 1, forall i = overline("1, k")$

#lecturebreak(2)