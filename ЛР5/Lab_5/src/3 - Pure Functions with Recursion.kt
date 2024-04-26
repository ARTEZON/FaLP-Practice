// Вариант 5

// Вспомогательные функции
fun max(x: Int, y: Int): Int = if (x > y) x else y
fun min(x: Int, y: Int): Int = if (x < y) x else y

// Найти максимальную цифру числа.
fun maxDigitUp(number: Int): Int = if (number != 0) max(maxDigitUp(number / 10), number % 10) else 0
tailrec fun maxDigitTail(number: Int, curMax: Int = 0): Int =
    if (number == 0) curMax else maxDigitTail(number / 10, max(curMax, number % 10))

fun main() {
    println("Найти максимальную цифру числа")
    println(maxDigitUp(8192))
    println(maxDigitUp(0))
    println(maxDigitUp(123))
    println(maxDigitTail(8192))
    println(maxDigitTail(0))
    println(maxDigitTail(123))
}
