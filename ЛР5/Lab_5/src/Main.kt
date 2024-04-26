fun max(x: Int, y: Int, z: Int): Int = if (x > y && x > z) x else if (y > z) y else z

fun factUp(n: Long): Long = if (n <= 1) 1 else n * factUp(n - 1)

tailrec fun factDown(n: Long, curRes: Long = 1): Long {
    val newRes = curRes * n
    return if (n <= 1) newRes else factDown(n - 1, newRes)
}

fun digitSumUp(number: Long): Long = if (number != 0L) digitSumUp(number / 10) + (number % 10) else 0

fun digitSumDown(number: Long, curSum: Long = 0): Long {
    val newSum = curSum + number % 10
    return if (number == 0L) newSum else digitSumDown(number / 10, newSum)
}

fun main() {
    println(max(3, 2, 1))
    println(max(-17, -5, -24))
    println(max(-2, 0, 4))
    println()
    println(factUp(3))
    println(factDown(3))
    println(factUp(10))
    println(factDown(10))
    println(factUp(20))
    println(factDown(20))
    println()
    println(digitSumUp(1337)) // 14
    println(digitSumDown(1337)) // 14
    println(digitSumUp(654219213)) // 33
    println(digitSumDown(654219213)) // 33

}