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

// Найти НОД двух чисел.
fun gcd(n1: Int, n2: Int): Int {
    var a = n1
    var b = n2
    var tmp: Int
    while (b != 0) {
        tmp = b
        b = a % b
        a = tmp
    }
    return a
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
    println("Найти НОД двух чисел")
    println(gcd(3, 5))
    println(gcd(45, 30))
    println(gcd(35, 7))
    println(gcd(36, 60))
}
