package lab

import java.util.Scanner

// Вариант 5

fun isDiv(n: Int, div: Int) = n % div == 0

fun traverseDivs(n: Int, operation: (Int, Int) -> Int, predicate: (Int, Int) -> Boolean, accumInitial: Int = 0) =
    traverseDivs(n, operation, predicate, accumInitial, 1)

tailrec fun traverseDivs(n: Int, operation: (Int, Int) -> Int, predicate: (Int, Int) -> Boolean, accum: Int, curDiv: Int): Int =
    if (curDiv > n / 2) (if (predicate(n, n)) operation(n, accum) else accum)
    else traverseDivs(n, operation, predicate,
        accum=(if (isDiv(n, curDiv) && predicate(curDiv, n)) operation(curDiv, accum) else accum), curDiv + 1)

// Найти количество делителей числа, не делящихся на 3.
fun countOperation(curDiv: Int, accum: Int) = accum + 1
fun divNotDivisibleBy3(div: Int, n: Int) = div % 3 != 0

// Найти сумму всех делителей числа, взаимно простых с суммой цифр числа
// и не взаимно простых с произведением цифр числа.
fun sumOperation(curDiv: Int, accum: Int) = accum + curDiv
fun areCoprime(n1: Int, n2: Int) = gcd(n1, n2) == 1
fun coprimeWithDigitSumAndNotCoprimeWithDigitProduct(div: Int, n: Int,) =
    areCoprime(div, numberTraversal(n, { a, b -> a + b })) && !areCoprime(div, numberTraversal(n, { a, b -> a * b }, 1))

fun main() {
    print("Введите натуральное число: ")
    val input = Scanner(System.`in`)
    val n = input.nextInt()
    print("Количество делителей числа, не делящихся на 3: ")
    println(traverseDivs(n, ::countOperation, ::divNotDivisibleBy3))
    print("Сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: ")
    println(traverseDivs(n, ::sumOperation, ::coprimeWithDigitSumAndNotCoprimeWithDigitProduct))
}
