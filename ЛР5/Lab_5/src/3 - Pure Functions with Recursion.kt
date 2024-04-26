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
}
