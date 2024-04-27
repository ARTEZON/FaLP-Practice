// Вариант 5

fun pow(n: Int, p: Int): Int = if (p == 1) n else n * pow(n, p - 1)

fun checkNumber(n: Int, power: Int): Boolean = n == numberTraversal(n, { a, b -> a + pow(b, power) })

tailrec fun solve(power: Int, curN: Int = 10, curSum: Int = 0): Int =
    if (pow(9, power) * numberTraversal(curN, { a, _ -> a + 1 }) < curN) curSum
    else solve(power, curN + 1, if (checkNumber(curN, power)) (curSum + curN).also { println(curN) } else curSum)


fun main() {
    println("Числа, удовлетворяющие условию:")
    println("Их сумма (ответ): ${solve(5)}")
}
