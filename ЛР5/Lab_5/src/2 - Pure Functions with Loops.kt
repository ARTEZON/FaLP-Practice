import kotlin.math.abs

// Вариант 5

// Найти максимальную цифру числа.
fun maxDigit(n: Int): Int {
    var max = 0
    var num = abs(n)
    while (num > 0) {
        val d = num % 10
        if (d > max) max = d
        num /= 10
    }
    return max
}

// Найти минимальную нечётную цифру числа.
fun minOddDigit(n: Int): Int {
    var min = 9
    var num = abs(n)
    while (num > 0) {
        val d = num % 10
        if (d < min && d % 2 == 1) min = d
        num /= 10
    }
    return min
}

fun main() {
    println("Найти максимальную цифру числа")
    println(maxDigit(8192))
    println(maxDigit(0))
    println(maxDigit(-123))
    println()
    println("Найти минимальную нечётную цифру числа")
    println(minOddDigit(238))
    println(minOddDigit(17))
    println(minOddDigit(-583))
    println()
}
