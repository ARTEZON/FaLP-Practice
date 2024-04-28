package lab

// Вариант 5

// В качестве функции высшего порядка для нахождения мин. и макс. цифры
// используется numberTraversal из задания 1.

fun maxDigitRule(a: Int, b: Int) = if (a > b) a else b

fun minOddDigitRule(a: Int, b: Int) = if (b < a && b % 2 == 1) b else a

fun gcdHighOrder(a: Int, b: Int, acceptNewGCDCondition: (Int, Int, Int) -> Boolean, stopCondition: (Int, Int, Int) -> Boolean, newPossibleGCD: Int = 1, curGCD: Int = 1): Int =
    if (stopCondition(a, b, newPossibleGCD)) curGCD
    else gcdHighOrder(a, b, acceptNewGCDCondition, stopCondition, newPossibleGCD + 1, if (acceptNewGCDCondition(a, b, newPossibleGCD)) newPossibleGCD else curGCD)

fun gcdStop(a: Int, b: Int, newGCD: Int) = newGCD > a || newGCD > b

fun gcdAccept(a: Int, b: Int, newGCD: Int) =  a % newGCD == 0 && b % newGCD == 0

fun main() {
    println("Найти максимальную цифру числа")
    println(numberTraversal(8192, ::maxDigitRule))
    println(numberTraversal(0, ::maxDigitRule))
    println(numberTraversal(123, ::maxDigitRule))
    println()
    println("Найти минимальную нечётную цифру числа")
    println(numberTraversal(238, ::minOddDigitRule, 9))
    println(numberTraversal(17, ::minOddDigitRule, 9))
    println(numberTraversal(583, ::minOddDigitRule, 9))
    println()
    println("Найти НОД двух чисел")
    println(gcdHighOrder(3, 5, ::gcdAccept, ::gcdStop))
    println(gcdHighOrder(45, 30, ::gcdAccept, ::gcdStop))
    println(gcdHighOrder(35, 7, ::gcdAccept, ::gcdStop))
    println(gcdHighOrder(36, 60, ::gcdAccept, ::gcdStop))
}
