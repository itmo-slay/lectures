#set page(margin: 20pt)
#import "@preview/cetz:0.4.2" as cetz
#import "@preview/cetz-plot:0.1.3" as cetz_plot
#import "@preview/fletcher:0.5.8" as fletcher


// макросы
#let dabs(expression) = $abs(abs(#expression))$

#let sumtb(expression, sum_top, sum_bottom) = $display(sum^(#sum_top)_(#sum_bottom) #expression)$

#let exprtb(symbol, expression, symbol_top, symbol_bottom) = $display(#symbol^(#symbol_top)_(#symbol_bottom) #expression)$

#let fullintegral(expression) = $display(integral #expression)$

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
= Математический анализ
]

#linebreak()

Изучаем интегралы

#linebreakn(1)

= Лекция 01. 10-02-2026. 2-й семестр

#linebreakn(1)

== Первообразная. Неопределенный интегралы

#linebreakn(1)

#title_block([Определение], 
  [Пусть на $(a, b)$ определена и непрерывна функция $f(x)$. Функция $F(x)$б дифференцируемая на $(a, b)$, называется первообразной функции $f(x)$, если $F'(x) = f(x)$ или $dif F(x) = f(x) dif x$]
)
#linebreakn(1)
#theorem_block([Теорема], 
  [
    Если $F_1(x)$ и $F_2(x)$ - первообразные функции $f(x)$ на $(a, b)$, то они отличаются на постоянную величину.
    #linebreakn(1)
  ],
  [
    *Доказательство:*\
    Пусть $F_1(x)$ и $F_2(x)$ первообразные $f(x)$\
    $phi(x) = F_1(x) - F_2(x)$\
    $phi ' (x) = F_1 '(x) - F_2 '(x) = f(x) - f(x) = 0$, то есть $phi '(x) = 0$ на $(a, b)$\
    Значит $phi(x) = C, wide F_1(x) - F_2(x) = C, quad F_1(x) = F_2(x) + C$\
    По теореме Лагранжа: $[x_0, x]$, $x_0$ - фиксированная, $x$ - произвольная, $[x_0, x] subset (a, b)$\
    Для $phi(x): wide xi in [x_0, x]$\
    $phi(x) - phi(x_0) = phi '(xi)(x - x_0), phi(xi) = 0$\
    $phi(x) - phi(x_0) = 0, phi(x) = phi(x_0), wide$ чтд
  ]
)

График первообразной называется *интегральной кривой*. Совокупность (множество) всех первообразных $f(a)$ на $(a, b)$ называется неопределенным интегралом\
$ F(x) + C = integral f(x) dif x $
#move([
$dif x - x$ - переменная (выражение) интегрирования\
$f(x)$ - подынтегральная функция\
$f(x) dif x$ - подынтегральное выражение
], dx: 150pt)

Процесс нахождения неопределенного интеграла называется интегрированием (правильность проверяется дифференцированием)\

#title_block(
  [Основные свойства неопределенного интеграла],
  [
    1. $(integral f(x) dif x)' = f(x) wide ((integral f(x) dif x)' = (F(x) + C)' = F'(x) + 0 = f(x))$ 
    2. $dif integral f(x) dif x = f(x) dif x wide (dif integral f(x) dif x = dif(F(x) + C) = dif F(x) = f(x) dif x)$
    3. $integral dif F(x) = F(x) + C wide$ (по определению)
    4. $integral a f(x) dif x = a integral f(x) dif x, quad a eq.not 0, a in RR$
    5. $integral (f_1(x) plus.minus f_2(x) dif x = integral f_1(x) dif x + integral f_2(x) dif x$
    
    6. Инвариантность формул интегрирования\
    #move([$phi '(x) = dif x = dif phi(x)$], dx: 100pt)
    Если $integral f(x) dif x = F(x) + C$, то $integral f(u) dif u = F(u) + C, wide$ где $phi(x)$ - произвольная дифференцируемая функция
  ]
)

#title_block(
  [Дополнительные свойства и доказательства],
  [
    4-5. Линейность определенного интеграла\
    $quad display(integral (a_1 f_1(x) + a_2 f_2(x) + dots + a_n f_n(x)) dif x = a_1 integral f_1(x) dif x + dots + a_n integral f_n(x) dif x), wide a_i eq.not 0, a_i in RR, i = overline("1, n")$\

    *Док-во:*\
    Пусть $F_1(x), F_2(x), dots, F_n(x)$ первообразная для $f_1(x), f_2(x), dots, f_n(x)$ соответственно\
    Тогда $Phi(x) = a_1 F_1(x) + a_2 F_2(x) + dots + a_n F_n(x)$\

    $display(integral(a_1 f_1(x) + a_2 f_2(x) + dots + a_n f_n(x)) dif x = a_1 integral f_1(x) dif x + a_2 integral f_2(x) dif x + dots + a_n integral f_n(x) dif x)$\

    $wide Phi(x) + C wide wide = a_1 (F_1(x) + C_1) + dots + a_n (F_n(x) + C_n)$\

    Отсюда $wide wide C = a_1 C_1 + a_2 C_2 + dots + a_n C_n$, то есть по $C$ можем вырадать $C_1, C_2, C_3, dots, C_n$ и наоборот, чтд

    *Доказательство свойства №6*\

    #set math.mat(delim: "|")
    $integral f(phi(x)) phi'(x) dif x = display(mat(u = phi(x); dif u = phi ' (x) dif x)) = integral f(u) dif u = F(u) + C$\

    $integral e^(sin x) cos x dif x = integral e^(sin x) d sin x = e^(sin x) + C)$

    *Доп-свойства из №6*\
    6.1 $integral f(x + b) dif x = F(x + b) + C wide (integral f(x + b) dif (x + b) = F(x + b) + C)$\

    6.2 $integral f(a x) dif x = display(1/a) F(a x) + C wide (integral f(a x) dot display(1/a) dif (a x) = display(1/a) F(a x) + C)$\

    6.3 $integral f(a x + b) dif x = display(1/a) F(a x + b) + C$
  ]
)

#topicbreak(1)

=== Методы интегрирования
1. Непосредственное интегрирование преобразование подынтегральной функции (выражения) для сведения интеграла с использованием свойств 1-6 к одному из нескольких таких интегралов:
$display(integral (dif x)/(x^2 + x^4)) = display(integral ((1 + x^2) - x^2)/(x^2 (1 + x^2)) dif x) = display(integral (1/x^2) - 1/(1 + x^2) dif x) = display(integral (dif x)/x^2 - integral (dif x)/(1 + x^2)) = display(-1/x + arctan x + C)$


2. Замена переменной или подстановка\
  2.1 Подстановка
    $integral f(x) dif x = |x = phi(t), dif x = lr(phi '(t) dif t|, size: #150%) = integral f(phi(t)) phi '(t)dif t = Phi(t) + C = F(x) + C$

  2.2 Замена переменной (подстановка подбирается)\
    $phi(x) = t$\

    $display(integral f(phi(x)) phi ' (x) dif x = integral f(t) dif t)$

3. Интегрирование по частям\
#theorem_block(
  [Теорема],
  [
    Пусть $u(x)$ и $delta(x)$ определены и на $(a, b)$ и функции $u'(x) dot delta(x)$ и $u(x) dot delta ' (x)$ имеюют первообразные. Тогда $integral u dif delta = u dot delta - integral delta dif u wide$ (форма интегрирования по частям)\
  ],
  [

    #columns(2)[
      *Доказательство:*\
      $dif (u dot delta) = delta dif u + u dif delta$\
      $integral dif (u dot delta) = integral delta dif u + integral u dif delta$\
      $u dot delta = integral delta dot dif u + integral u dif delta$\
      $integral u dif delta = u dot delta - integral delta dif u$ \
      $wide wide wide wide wide $чтд
    
      #colbreak()
      $integral P_n(x) dot f(x) dif x$\
      $P_n(x) -$ многочлен n-ой степени\
      #columns(2)[
        $#numbering("I", 1)$ тип\
        #columns(2)[
          $e^x$\
          $a^x$\
          $tan x$\
          $dots.v$
          #colbreak()
          $u = P_n(x)$\
          $dif delta = f(x) dif x$\
        ]
        #colbreak()
        $#numbering("I", 2)$ тип\
        #columns(2)[
          $ln x$\
          $log_a x$\
          $arctan x$\
          $dots.v$
          #colbreak()
          $u = f(x)$\
          $dif delta = P_n(x) dif x$\
        ]
      ]
    ]
    
  ],
)
#pagebreak()
#title_block(
  [#numbering("I", 3) тип: возвратные интегралы],
  [
    Это интегралы, которые после применения метода интегрирования по частям (включая несколько применений) приводят интеграл в изначальный вид.\

    Решается как ращ приведением к изначальному интегралу, переброске его (с каким то коеффициэнтом) в левую часть, что дает нам значение искомого интеграла с коеффициэнтом (его просто перебрасываем в правую часть).\

    Часто применяется для функций вида:\
    $integral e^(k x) sin (m x) dif x$\
  ]
)
*Пример:*\
#set math.mat(delim: "[")
$display(integral e^(2 x) dot sin (3 x) dif x = mat(u = e^(2 x); dif u = 2 e^(2 x) dif x; dif v = sin (3 x) dif x; v = - (cos (3 x))/3) = -1/3 e^(2 x) cos (3 x) - integral -(cos (3 x))/3 dot 2 e^(2 x) dif x =)$\
$display(= -1/3 e^(2 x) cos (3 x) + 2/3 integral e^(2 x) cos (3 x) dif x = mat(u = e ^ (2 x); dif u = 2 e^(2 x) dif x; dif v = cos (3 x) dif x; v = 1/3 sin (3 x);) = 2/9 e^(2 x) sin (3 x) -1/3 e^(2 x) cos (3 x)  -4/9 integral e^(2 x) sin (3 x) dif x) = $\
$display(= 13/9 integral e^(2 x) sin (3 x) dif x = -9/39 e^(2 x) cos (3 x) + 18/(13 dot 9) e^2 sin (3 x) +C)$\

Мы избавились от интеграла, то есть нашли значение исходного интеграла\


#topicbreak(1)

#align(center)[== Таблица интегралов]
\
#titleless_block(
  [
  #columns(2)[
    1. $fullintegral(x^n dif x) = display((x^(n+1))/(n+1) + C), quad n eq.not -1$ 

    2. $fullintegral(a^x dif x) = display(a^x/(ln a) + C)$
    3. $fullintegral(e^x dif x) = e^x + C$
    4. $fullintegral(sin x dif x) = - cos x + C$
    5. $fullintegral(cos x dif x) = sin x + C$
    6. $fullintegral((dif x)/(cos^2 x)) = tg x + C$
    7. $fullintegral((dif x)/(sin^2 x)) = -ctg x + C$
    8. $fullintegral((dif x)/(sqrt(1 - x^2))) = arcsin x + C$
    9. $fullintegral((dif x)/(1 + x^2)) = arctan x + C$
    10. $fullintegral(sinh x dif x) = cosh x + C$
    11. $fullintegral(cosh x dif x) = sinh x + C$
    #colbreak()
    12. $fullintegral((dif x)/(sin^2 x)) = -coth x + C$

    13. $fullintegral((dif x)/(cosh^2 x)) = tanh x + C$
    14. $fullintegral((dif x)/x) = ln abs(x) + C$
    15. $fullintegral(tan x dif x) = -ln abs(cos x) + C$
    16. $fullintegral(ctg dif x) = ln abs(sin x) + C$
    17. $fullintegral((x dif x)/(x^2 plus.minus a^2)) = display(1/3 ln abs(x^2 plus.minus a^2)) + C$
    18. $fullintegral((x dif x)/(sqrt(a^2 plus.minus x^2))) = display(plus.minus sqrt(a^2 plus.minus x^2)) + C$
    19. $fullintegral((dif x)/(x^2 - a^2)) = display(1/(2a) ln abs((x-a)/(x+a))) + C$\
    $quad$"высокий" логарифм $ arrow.t.curve$\

    20. $fullintegral((dif x)/(sqrt(x^2 plus.minus a^2))) = display(ln abs(x + sqrt(x^2 plus.minus a^2))) + C$
  ]
  ]
)

