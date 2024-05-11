package lab

import kotlin.math.abs

// Вариант 5


// Часть 1 - минимум и максимум

tailrec fun numberTraversalAdvanced(n: Int, operation: (Int, Int) -> Int, condition: (Int) -> Boolean, curRes: Int = 0): Int =
    if (n == 0) curRes
    else numberTraversalAdvanced(n / 10, operation, condition, (if (condition(abs(n) % 10)) operation(abs(n) % 10, curRes) else curRes))

fun maxDigitOperation(newValue: Int, accumulator: Int) = if (newValue > accumulator) newValue else accumulator

fun minDigitOperation(newValue: Int, accumulator: Int) = if (newValue < accumulator) newValue else accumulator

fun isOdd(newValue: Int) = newValue % 2 == 1


// Часть 2 - наибольший общий делитель

fun gcdHighOrder(a: Int, b: Int, acceptNewGCDCondition: (Int, Int, Int) -> Boolean, stopCondition: (Int, Int, Int) -> Boolean, newPossibleGCD: Int = 1, curGCD: Int = 1): Int =
    if (stopCondition(a, b, newPossibleGCD)) curGCD
    else gcdHighOrder(a, b, acceptNewGCDCondition, stopCondition, newPossibleGCD + 1, if (acceptNewGCDCondition(a, b, newPossibleGCD)) newPossibleGCD else curGCD)

fun gcdStop(a: Int, b: Int, newGCD: Int) = newGCD > a || newGCD > b

fun gcdAccept(a: Int, b: Int, newGCD: Int) =  a % newGCD == 0 && b % newGCD == 0


// Main

fun main() {
    println("Найти максимальную цифру числа")
    println(numberTraversalAdvanced(8192, ::maxDigitOperation, { true }))
    println(numberTraversalAdvanced(0, ::maxDigitOperation, { true }))
    println(numberTraversalAdvanced(123, ::maxDigitOperation, { true }))
    println()
    println("Найти минимальную нечётную цифру числа")
    println(numberTraversalAdvanced(238, ::minDigitOperation, ::isOdd, 9))
    println(numberTraversalAdvanced(17, ::minDigitOperation, ::isOdd, 9))
    println(numberTraversalAdvanced(583, ::minDigitOperation, ::isOdd, 9))
    println()
    println("Найти НОД двух чисел")
    println(gcdHighOrder(3, 5, ::gcdAccept, ::gcdStop))
    println(gcdHighOrder(45, 30, ::gcdAccept, ::gcdStop))
    println(gcdHighOrder(35, 7, ::gcdAccept, ::gcdStop))
    println(gcdHighOrder(36, 60, ::gcdAccept, ::gcdStop))
}
