package lab

fun getFunctionByName(fname: String): ((Int, Int) -> Int)? {
    // maxDigitUp и minOddDigitUp принимают 1 аргумент, а gcdTail 2 аргумента,
    // поэтому первые две функции здесь приводятся к функциям двух аргументов,
    // второй аргумент которых игнорируется.
    val fmap: Map<String, (Int, Int) -> Int> = mapOf(
        "maxDigit" to { number: Int, _: Int -> maxDigitUp(number) },
        "minOddDigit" to { number: Int, _: Int -> minOddDigitUp(number) },
        "gcd" to ::gcdTail
    )
    return fmap[fname]
}

fun executeFunction(fname: String, arg1: Int, arg2: Int = 0): Int {
    val func = getFunctionByName(fname)
    if (func != null) return func(arg1, arg2)
    else throw NoSuchElementException("Название функции введено неверно")
}

fun main() {
    executeFunction("maxDigit", 8192)
}
