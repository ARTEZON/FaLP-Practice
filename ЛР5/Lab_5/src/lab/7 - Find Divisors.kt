package lab

import java.util.Scanner

// Вариант 5

// Найти количество делителей числа, не делящихся на 3.

tailrec fun countDivs(n: Int, predicate: (Int) -> Boolean, curDiv: Int = 1, curCount: Int = 0): Int =
    if (curDiv > n / 2) curCount + (if (predicate(n)) 1 else 0)
    else countDivs(n, predicate, curDiv + 1, curCount + (if (isDiv(n, curDiv) && predicate(curDiv)) 1 else 0))

fun isDiv(n: Int, div: Int) = n % div == 0

// Найти сумму всех делителей числа, взаимно простых с суммой цифр числа
// и не взаимно простых с произведением цифр числа.

tailrec fun sumDivs(n: Int, predicate: (Int, Int) -> Boolean, curDiv: Int = 1, curSum: Int = 0): Int =
    if (curDiv > n / 2) curSum + (if (predicate(n, n)) n else 0)
    else sumDivs(n, predicate, curDiv + 1, curSum + (if (isDiv(n, curDiv) && predicate(n, curDiv)) curDiv else 0))

fun areCoprime(n1: Int, n2: Int) = gcd(n1, n2) == 1

fun sumDivsPredicate(n: Int, div: Int) =
    areCoprime(div, numberTraversal(n, { a, b -> a + b })) &&
            !areCoprime(div, numberTraversal(n, { a, b -> a * b }, 1))

fun main() {
    print("Введите натуральное число: ")
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    print("Количество делителей числа, не делящихся на 3: ")
    println(countDivs(n, {div -> div % 3 != 0}))
    print("Сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: ")
    println(sumDivs(n, ::sumDivsPredicate))
}