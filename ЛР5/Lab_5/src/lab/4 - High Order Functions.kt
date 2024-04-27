package lab

// Вариант 5

fun invokeFunc(n: Int, f: (Int) -> Int) = f(n)
fun invokeFunc(n1: Int, n2: Int, f: (Int, Int) -> Int) = f(n1, n2)

fun main() {
    println("Найти максимальную цифру числа")
    println(invokeFunc(8192, ::maxDigitUp))
    println(invokeFunc(0, ::maxDigitUp))
    println(invokeFunc(123, ::maxDigitUp))
    println(invokeFunc(8192, ::maxDigitTail))
    println(invokeFunc(0, ::maxDigitTail))
    println(invokeFunc(123, ::maxDigitTail))
    println()
    println("Найти минимальную нечётную цифру числа")
    println(invokeFunc(238, ::minOddDigitUp))
    println(invokeFunc(17, ::minOddDigitUp))
    println(invokeFunc(583, ::minOddDigitUp))
    println(invokeFunc(238, ::minOddDigitTail))
    println(invokeFunc(17, ::minOddDigitTail))
    println(invokeFunc(583, ::minOddDigitTail))
    println()
    println("Найти НОД двух чисел")
    println(invokeFunc(3, 5, ::gcdUp))
    println(invokeFunc(45, 30, ::gcdUp))
    println(invokeFunc(35, 7, ::gcdUp))
    println(invokeFunc(36, 60, ::gcdUp))
    println(invokeFunc(3, 5, ::gcdTail))
    println(invokeFunc(45, 30, ::gcdTail))
    println(invokeFunc(35, 7, ::gcdTail))
    println(invokeFunc(36, 60, ::gcdTail))
}
