package test

import lab.*

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class Task7Test {

    @Test
    fun countDivsNotDivisibleBy3Test() {
        val expected = mapOf(1 to 1, 3 to 1, 7 to 2, 12 to 3, 16 to 5, 30 to 4, 33 to 2, 50 to 6, 100 to 9)
        expected.forEach { assertEquals(it.value, traverseDivs(it.key, ::countOperation, ::divNotDivisibleBy3)) }
    }

    @Test
    fun sumDivsCoprimeWithDigitSumAndNotCoprimeWithDigitProductTest() {
        val expected = mapOf(1 to 0, 3 to 0, 7 to 0, 12 to 6, 16 to 30, 30 to 17, 33 to 0, 50 to 2, 100 to 216)
        expected.forEach { assertEquals(it.value, traverseDivs(it.key, ::sumOperation, ::coprimeWithDigitSumAndNotCoprimeWithDigitProduct)) }
    }
}
