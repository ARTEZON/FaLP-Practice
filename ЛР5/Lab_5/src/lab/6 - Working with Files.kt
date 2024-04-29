package lab

import java.io.File

// Так как количество аргументов у функций из 3-го задания разное,
// будем использовать функции-адаптеры с массивом в качестве аргумента:
fun maxDigitAdapter(numbers: IntArray): Int = maxDigitUp(numbers[0])
fun minOddDigitUpAdapter(numbers: IntArray): Int = minOddDigitUp(numbers[0])
fun gcdAdapter(numbers: IntArray): Int = gcdTail(numbers[0], numbers[1])

fun getFunctionByName(fname: String): ((IntArray) -> Int)? {
    val fmap: Map<String, (IntArray) -> Int> = mapOf(
        "maxDigit" to ::maxDigitAdapter,
        "minOddDigit" to ::minOddDigitUpAdapter,
        "gcd" to ::gcdAdapter
    )
    return fmap[fname]
}

// Исключения:
// NullPointerException - неверное название функции (функция не найдена)
// ArrayIndexOutOfBoundsException - недостаточное количество аргументов
fun executeFunction(fname: String, args: IntArray): Int = getFunctionByName(fname)!!(args)

fun main(args: Array<String>) {
    val args = arrayOf(""""in.txt"""")
    if (args.isEmpty()) {
        println("Пожалуйста, укажите полный путь к файлу в командной строке")
        return
    }
    val path = (if (args.size == 1) args[0] else args.joinToString(" ")).trim('"', '\'', ' ')
    val file = File(path).canonicalFile
    if (!file.exists()) {
        println("Файл $file не существует")
        return
    }

//    println(file)
//    val out = File(file.parent.plus("/out.txt"))
//    println(out)

    println("Чтение файла $file")
    var curLine = 0
    try {
        file.forEachLine {
            curLine++
            val line = it.trim().split("\\s+".toRegex())
            val func = line.last()
            if (func.isNotEmpty()) {
                val nums = line.slice(0..line.count() - 2).map { it.toInt() }.toIntArray()
                try {
                    val result = executeFunction(func, nums)
                    println("${nums.joinToString(" ")} $func $result")
                }
                catch (ex: NullPointerException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): неверное название функции: $func")
                }
                catch (ex: ArrayIndexOutOfBoundsException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): недостаточно аргументов для функции $func")
                }
            }
        }
    }
    catch (ex: Exception) {
        println(ex.localizedMessage)
    }
}
