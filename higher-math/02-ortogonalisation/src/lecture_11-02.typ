#set page(margin: 20pt)
#import "@preview/cetz:0.4.2" as cetz
#import "@preview/cetz-plot:0.1.3" as cetz_plot
#import "@preview/fletcher:0.5.8" as fletcher


// макросы
#let dabs(x) = $abs(abs(#x))$

#let sumtb(x, top, bottom) = $display(sum^(#top)_(#bottom) #x)$

#let exprtb(func, x, top, bottom) = $display(#func^(#top)_(#bottom) #x)$

#let titleless_block(body) = [
  #rect(
    radius: 5pt,
    outset: 5pt,
    fill: rgb("#c2dec17f"),
    stroke: 1pt + rgb("#0101018a"),

    [#body]
  )
]

#let title_block(title, body) = [
  #rect(
    radius: 5pt,
    outset: 5pt,
    fill: rgb("#c2dec17f"),
    stroke: 1pt + rgb("#0101018a"),

    [
      *#title* \
      #body
    ]
  )
]

#let theorem_block(title, body, proof) = [
  #rect(
    radius: 5pt,
    outset: 5pt,
    fill: rgb("#c2dec17f"),
    stroke: 1pt + rgb("#0101018a"),

    [    
      *#title* \
      #body \ 
      #proof
    ]
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

#linebreakn(1)

#topicbreak(0)

= Лекция 02. 10-02-2026. 2-й семестр

== Ортогональные системы векторов. Матрица Грама

#title_block(
  [Определение:],
  [$a_1, a_2, a_3, dots, a_k$ называется ортогональной, если $(a_i, a_j) = 0, quad forall i eq.not j$],
)\

#title_block(
  [Определение:],
  [$a_1, a_2, a_3, dots, a_n$ называется ортонормированной, если $dabs(a_j)$],
)\

#theorem_block(
  [Теорема о линейной независимости ортогональной системы векторов:],
  [Любая ортогональная система, не содержащая нулевой вектор, линейно независима],
  [
    *Доказательство:*\

    #set math.mat(delim: "|")

    $a_1, a_2, dots, a_k$ - ортогональная система\
    $y = lambda_1 a_1 + lambda_2 a_2 + dots + lambda_k a_k = 0$\
    Найдем $(y, a_i) = (lambda_1 a_1 + lambda_2 a_2 + dots + lambda_k a_k a_j) = lambda_1 (a_1, a_i) + lambda_2 (a_2, a_i) + dots + lambda_ i ( a_i, a_j) + dots + lambda_k (a_k, a_i) =$\

    $= display(mat((a_i, a_j) = 0; i eq.not j)) =lambda_i (a_i, a_i)$\

    $(y, a_i) = (overline(0), a_i) = 0$\
    $lambda_i (a_i, a_i) = 0$, так как $(a_i, a_i) eq.not$, то $lambda_i = 0$
    Аналогично можно проверить все $a_j, j = overline("1, k")$ и показать, что $forall lambda_i = 0, i = overline("1, k")$, то есть $(a_1, a_2, dots, a_k)$ - линейно независима, чтд
  ]
)\


#theorem_block(
  [
    Теорема Пифагора (обобщеная)\
  ],
  [
    Для любой ортогональной системы $a_1, a_2, dots, a_k quad display(dabs(sumtb(a_i, k, i=1))^2) = display(sumtb(dabs(a_i)^2, k, i=1))$
  ],
  [
    *Доказательство:*\
    Пусть $a_1_, a_2, dots, a_k$ - ортогональная система векторов, $a_i eq.not 0$\
    $display(dabs(sumtb(a_i, k, i=1))^2 = (sumtb(a_i, k, i=1), quad sumtb(a_i, k, i=1))) = (a_1, + a_2 + dots + a_k, a_1 + a_2 + dots + a_k) =$\

    #set math.mat(delim: "|")

    $(a_1, a_1) + (a_1, a_2) + dots +(a_1, a_k) + (a_2, a_1) + (a_2, a_2) + dots + (a_k, a_k) = display(mat((a_i, a_j) = 0; i eq.not 0; "при i = j"; (a_i, a_i) = dabs(a_i)^2))=$\
    $= dabs(a_1)^2 + dabs(a_2)^2 + dots + dabs(a_k)^2 = display(sumtb(dabs(a_i)^2, k, i=1))$\

    чтд
  ]
)
#pagebreak()

Рассмотрим $S = (e_1, e_2, dots, e_n)$ векторов $cal(E)^n$, линейно независимую и проиизвольную\

$x = x_1 e_2, x_2 e_2 dots x_n e_n = display(sumtb(x_i e_i, n, i=1)), wide x=(x_1, x_2, dots, x_n)$\

$y = y_1 e_1 + y_2 e_2 + dots + y_n e_n = sumtb(y_j e_j, n, j = 1) wide y=(y_1, y_2, dots, y_n)$\

$(x, y) = (sumtb(x_i e_i, n, i=1), quad sumtb(y_j e_j, n, j = 1)) = (x_1 e_1 + x_2 e_2 + dots + x_n e_n, y_1 y_1 + dots + y_n e_n) = x_1 y_1 (e_1, e_1) + x_1 y_2 (e_1, e_2) + dots + x_1 y_n (e_1, e_n) + x_2 y_1 (e_2, e_1) + x_2 y_2 (e_2, e_2) + dots + x_2 y_n (e_2, e_n) + x_n y_1 (e_n, e_1) + x_n y_2 (e_n, e_2) + dots + x_n y_n (e_n, e_n) =$\

$= sumtb(sumtb(x_i y_j (e_i, e_j), n, j=1), n, i=1) = display(|(e_i, e_j) = g_(i j)|) = sumtb(sumtb(x_i y_j g_(i j), n, j=1), n, i=1)$


#topicbreak(0)
#align(center)[=== Матрица Грама]
$ display(G_S=mat(
  (e_1, e_1), (e_1, e_2), dots, (e_1, e_n);
  (e_2, e_1), (e_2, e_2), dots, (e_2, e_n);
  dots.v,       dots.v,       , dots.v;
  (e_n, e_1), (e_n, e_2), dots, (e_n, e_n);
)) $


#theorem_block(
  [Теорема],
  [
    Пусть $S = (e_1, e_2, dots, e_n)$ - базис евклидова пространства $cal(E)^n$ и $x = sumtb(x_i e_i, n, i=1), quad y = sumtb(y_i e_i, n, i=1)$\
    $x_i$ - координаты $x$ в $S$, $quad y_i$ - координаты $y$ в $S$\
    Разположение векторов $x$ и $y$ по базису, $(e_1, e_2, dots, e_n)$\

    $G_S$ - матрица Грама системы $S$, тогда $(x, y) = X^T G_S Y$, где\
    $X = (x_1, x_2, dots, x_n)^T wide Y = (y_1, y_2, dots, y_n)^T$ - координатные столбцы векторов\

    $(x, y) = (x_1, x_2, dots, x_n) G_S mat(y_1; y_2; dots.v; y_n)$
  ],
  [
    *Доказательство:*\
    $sumtb(sumtb(x_i y_j g_(i j), n, j=1), n, i=1) = (x_1, x_2, dots, x_n) mat(g_11, g_12, dots, g_(1 n); g_21, g_22, dots, g_(2 n); dots.v; g_(n 1), g_(n 2), dots, g_(n n))$\
    Доказать самостоятельно (свое доказательство закину позже)
  ],
)

#linebreakn(1)

#title_block(
  [Определение:],
  [
    Матрицей Грама системы векторов $S = (e_1, dots, e_k)$ назвается квадратная матрица $G_S$ размера $k times k$, элементы которой являются скалярными произведениями векторов системы
  ]
)\

#title_block(
  [Свойства  матрицы Грама],
  [
    1. Симметрична, $G = G^T$\
    2. Положительная определенность всех главных угловых миноров\
    #set math.mat(delim: "|")
    $abs((e_1, e_1)) gt.eq 0, quad display(mat((e_1, e_1), (e_1, e_2); (e_2, e_1), (e_2, e_2))) gt.eq 0$
    3. Если $S$ линейно независима, то $det G_S eq.not 0$\
    4. Если $S$ ортогональная, то $G_S$ - диагональная\
    5. Если $S$ ортогонормированная система, то $G_S = E$\
      5.1 $(x, y) = sumtb((x_i, y_i), n, i=1), dabs(x) = sqrt(sumtb(x_i^2, quad, i=1))$
  ]
)

#topicbreak(1)

#theorem_block(
  [Теорема:],
  [Любую линейно независимую систему векторов или пространств, можно ортонормализировать],
  [
    *Доказательство*\
    Пусть $S = (a_1, a_2, dots, a_k)$ - линейно независимая система векторов евклидового пространства $cal(E)^n$\

    *сюда вставить график с доски*\
    Построим систему ортогональных векторов к системе $S$\
    $S_1 = (e_1, e_2, dots, e_k)$\
    1. $e_1 = a_1$\
    2. $e_2 = a_2 - alpha_2 e+1, quad (e_1, e_2) = 0$\
    $(a_2 + alpha_21 e_1, e_1) = 0, quad (a_2, e_1) + alpha_21 (e_1, e_1) = 0, wide alpha_21 = display(-((a_2,e_1))/((e_1,e_1)) = - ((a_2, e_1))/(dabs(e_1)^2))$\
    *сюда еще один график с доски*\

    $e_3 = a_3 + alpha_32 e_2 + alpha_31 e_1$\
    $(e_3, e_1) = 0, quad (e_3, e_2) = 0$\

    $(e_3, e_1) = (a_3 + alpha_32 e_2 + alpha_31 e_1, e_1) = (a_3, e_1) + alpha_32 (e_2, e_1) + alpha_31 (e_1, e_1) = (a_3, e_1) + alpha_31 (e_1, e_1) = 0$\

    $alpha_31 = display(-((a_3, e_1))/(dabs(e_1)^2)) wide alpha_32 = display(-((a_3, e_2))/(dabs(e_2)^2))$\

    $e_k = a_k - sumtb(((a_k, e_i))/dabs(e_i)^2 e_i, k-1, i=1), wide$ то есть $S_1 = (e_1, e_2, dots, e_n)$ - ортогональная система векторов $(a_1, a_2, dots, a_k) = S$ \
    Для получения ортонормированной системы векторов необходимо каждый вектор пронормировать\
    Покажем, что $dabs(e_k) lt.eq dabs(a_k), forall k = overline("1, k")$\

    $dabs(e_k)^2 = (e_k, e_k) = (a_k - sumtb(((a_k, e_i))/dabs(e_i)^2 e_i, k-1, i=1), e_k) = (a_k, e_k) lt.eq dabs(a_i) dot dabs(e_k) quad dabs(e_k) lt.eq dabs(a_n)$, чтд
  ]
)

#topicbreak(0)

#align(center)[$Q R$ - разложение $A_n$]\
1. Считая каждый столбец $A_n$ вектором $a_i, quad i = 1,n quad$, необходимо ортогонормировать систему векторов с последующим нормированием, получить матрицу $Q_n display(mat(a_i arrow.r e_i arrow.r q_i,; "i=1,n"))$

2. $A = Q R, R$ - матрица проекций, получавшихся в процессе ортогонализации (верхнетреугольная)\
$R = Q^(-1) A, quad Q^T = Q^(-1) quad R = Q^T A$\
*тут тоже график вставлю* 

#topicbreak(0)

=== Ортогональное дополнение

$x, (a_1, a_2, dots, a_k) in cal(E)^n$, такие что\
$x perp (a_1, a_2, dots, a_k)$, т.о. $x perp sumtb(lambda_i a_i, k, i=1)$\
$x perp$ подпространству $cal(E)^n$\

#set math.mat(delim: "|")
Проверим: $(x, sumtb(lambda_i a_i, k, k=1)) = sumtb(lambda_i (x_1, a_i), k, i=1) = display(mat(x perp a_i, i = overline("1, k"); (x, a_i) = 0)) = 0, wide$ чтд

#title_block(
  [Определение:],
  [Множество векторов $L^perp = {x in cal(E)^k | (x, a) = 0, forall a in L}$ называется ортогональным дополнением к подпространству $L$]
)\

#theorem_block(
  [Теорема (свойства ортогонального дополнения)],
  [
    1. $L^perp$ является подпространство $cal(E)^n$ (проверьте сами, она так сказала)
    2. $cal(E) = L xor L^perp wide$ (прямая сумма)
    3. $dim cal(E) = dim L + dim L^perp$
  ],
  [
    *Док-во свойства №2 на следующей лекции*
  ]
)