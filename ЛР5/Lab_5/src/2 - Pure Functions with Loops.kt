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

fun main() {
    println("Найти максимальную цифру числа")
    println(maxDigit(8192))
    println(maxDigit(0))
    println(maxDigit(-123))
    println()
}
