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
//    val args = arrayOf("in.txt", "out.txt")
    if (args.count() < 2) {
        println("Пожалуйста, укажите полный путь к входному и выходному файлам в командной строке")
        return
    }
    val fileIn = File(args[0].trim('"', '\'', ' ')).canonicalFile
    if (!fileIn.exists()) {
        println("Файл $fileIn не существует")
        return
    }
    val fileOut = File(args[1].trim('"', '\'', ' ')).canonicalFile

    try {
        println("Чтение файла $fileIn")
        var curLine = 0
        val results = ArrayList<String>()
        fileIn.forEachLine {
            curLine++
            val line = it.trim().split("\\s+".toRegex())
            val func = line.last()
            if (func.isNotEmpty()) {
                try {
                    val nums = line.slice(0..line.count() - 2).map { it.toInt() }.toIntArray()
                    val result = executeFunction(func, nums)
                    results.add("${nums.joinToString(" ")} $func $result")
                }
                catch (ex: NumberFormatException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): ${ex.message!!.split('"')[1]} не является целым числом")
                }
                catch (ex: NullPointerException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): неверное название функции: $func")
                }
                catch (ex: ArrayIndexOutOfBoundsException) {
                    throw Exception("Ошибка во входных данных (строка $curLine): недостаточно аргументов для функции $func")
                }
            }
        }
        println("Запись в файл $fileIn")
        fileOut.writeText(results.joinToString("\n"))
        println("Готово")
    }
    catch (ex: Exception) {
        println(ex.localizedMessage)
    }
}
