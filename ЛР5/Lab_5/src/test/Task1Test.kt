package test

import lab.*

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class Task1Test {

    @Test
    fun maxTest() {
        val expected = 10
        assertEquals(expected, max(3,10,5))

        assertEquals(3, max(3, 2, 1))
        assertEquals(-5, max(-17, -5, -24))
        assertEquals(4, max(-2, 0, 4))
    }

    @Test
    fun factUpTest() {
        assertEquals(6, factUp(3))
        assertEquals(3628800, factUp(10))
        assertEquals(2432902008176640000, factUp(20))
    }

    @Test
    fun factDownTest() {
        assertEquals(6, factDown(3))
        assertEquals(3628800, factDown(10))
        assertEquals(2432902008176640000, factDown(20))
    }

    @Test
    fun digitSumUpTest() {
        assertEquals(14, digitSumUp(1337))
        assertEquals(33, digitSumUp(654219213))
    }

    @Test
    fun digitSumDownTest() {
        assertEquals(14, digitSumDown(1337))
        assertEquals(33, digitSumDown(654219213))
    }

    @Test
    fun getFunctionTest() {
        assertEquals(1, getFunction(false)(1))
        assertEquals(6, getFunction(false)(3))
        assertEquals(120, getFunction(false)(5))

        assertEquals(5, getFunction(true)(5))
        assertEquals(1, getFunction(true)(10))
        assertEquals(6, getFunction(true)(15))
    }

    @Test
    fun numberTraversalTest() {
        assertEquals(10, numberTraversal(1234, { a, b -> a + b })) // сумма цифр
        assertEquals(24, numberTraversal(1234, { a, b -> a * b }, 1)) // произведение цифр
        assertEquals(4, numberTraversal(1234, { a, b -> if (a > b) a else b }, 0)) // макс. цифра
        assertEquals(1, numberTraversal(1234, { a, b -> if (a < b) a else b }, 9)) // мин. цифра
    }
}