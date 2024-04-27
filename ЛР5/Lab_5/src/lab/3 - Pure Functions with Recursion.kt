package lab

// Вариант 5

// Вспомогательные функции
fun max(x: Int, y: Int): Int = if (x > y) x else y
fun min(x: Int, y: Int): Int = if (x < y) x else y

// Найти максимальную цифру числа.
fun maxDigitUp(number: Int): Int = if (number != 0) max(maxDigitUp(number / 10), number % 10) else 0
tailrec fun maxDigitTail(number: Int, curMax: Int = 0): Int =
    if (number == 0) curMax else maxDigitTail(number / 10, max(curMax, number % 10))

// Найти минимальную нечётную цифру числа.
fun minOddDigitUp(number: Int): Int =
    if (number != 0)
        if (number % 2 == 1) min(minOddDigitUp(number / 10), number % 10)
        else minOddDigitUp(number / 10)
    else 9
tailrec fun minOddDigitTail(number: Int, curMinOdd: Int = 9): Int =
    if (number == 0) curMinOdd
    else if (number % 2 == 1) minOddDigitTail(number / 10, min(curMinOdd, number % 10))
    else minOddDigitTail(number / 10, curMinOdd)

// Найти НОД двух чисел.
fun gcdUp(a: Int, b: Int, toCheck: Int = 1, curGCD: Int = 1): Int =
    if (toCheck > a || toCheck > b) curGCD
    else if (a % toCheck == 0 && b % toCheck == 0) max(curGCD, gcdUp(a, b, toCheck + 1, toCheck))
    else gcdUp(a, b, toCheck + 1, curGCD)
tailrec fun gcdTail(a: Int, b: Int): Int =
    if (a == 0) b else gcdTail(b % a, a)

fun main() {
    println("Найти максимальную цифру числа")
    println(maxDigitUp(8192))
    println(maxDigitUp(0))
    println(maxDigitUp(123))
    println(maxDigitTail(8192))
    println(maxDigitTail(0))
    println(maxDigitTail(123))
    println()
    println("Найти минимальную нечётную цифру числа")
    println(minOddDigitUp(238))
    println(minOddDigitUp(17))
    println(minOddDigitUp(583))
    println(minOddDigitTail(238))
    println(minOddDigitTail(17))
    println(minOddDigitTail(583))
    println()
    println("Найти НОД двух чисел")
    println(gcdUp(3, 5))
    println(gcdUp(45, 30))
    println(gcdUp(35, 7))
    println(gcdUp(36, 60))
    println(gcdTail(3, 5))
    println(gcdTail(45, 30))
    println(gcdTail(35, 7))
    println(gcdTail(36, 60))
}
