package test

import lab.*

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class Task5Test {

    @Test
    fun maxDigitLoopTest() {
        assertEquals(9, maxDigit(8192))
        assertEquals(0, maxDigit(0))
        assertEquals(3, maxDigit(123))
        assertEquals(4, maxDigit(420))
        assertEquals(5, maxDigit(-25))
    }

    @Test
    fun maxDigitUpTest() {
        assertEquals(9, maxDigitUp(8192))
        assertEquals(0, maxDigitUp(0))
        assertEquals(3, maxDigitUp(123))
        assertEquals(4, maxDigitUp(420))
        assertEquals(5, maxDigitUp(-25))
    }

    @Test
    fun maxDigitTailTest() {
        assertEquals(9, maxDigitTail(8192))
        assertEquals(0, maxDigitTail(0))
        assertEquals(3, maxDigitTail(123))
        assertEquals(4, maxDigitTail(420))
        assertEquals(5, maxDigitTail(-25))
    }

    @Test
    fun minOddDigitLoopTest() {
        assertEquals(3, minOddDigit(238))
        assertEquals(1, minOddDigit(17))
        assertEquals(3, minOddDigit(583))
        assertEquals(9, minOddDigit(0))
        assertEquals(9, minOddDigit(420))
        assertEquals(5, minOddDigit(-25))
    }

    @Test
    fun minOddDigitUpTest() {
        assertEquals(3, minOddDigitUp(238))
        assertEquals(1, minOddDigitUp(17))
        assertEquals(3, minOddDigitUp(583))
        assertEquals(9, minOddDigitUp(0))
        assertEquals(9, minOddDigitUp(420))
        assertEquals(5, minOddDigitUp(-25))
    }

    @Test
    fun minOddDigitTailTest() {
        assertEquals(3, minOddDigitTail(238))
        assertEquals(1, minOddDigitTail(17))
        assertEquals(3, minOddDigitTail(583))
        assertEquals(9, minOddDigitTail(0))
        assertEquals(9, minOddDigitTail(420))
        assertEquals(5, minOddDigitTail(-25))
    }

    @Test
    fun gcdLoopTest() {
        assertEquals(1, gcd(3, 5))
        assertEquals(15, gcd(45, 30))
        assertEquals(7, gcd(35, 7))
        assertEquals(12, gcd(36, 60))
        assertEquals(1, gcd(1, 10))
        assertEquals(4, gcd(4, 4))
    }

    @Test
    fun gcdUpTest() {
        assertEquals(1, gcdUp(3, 5))
        assertEquals(15, gcdUp(45, 30))
        assertEquals(7, gcdUp(35, 7))
        assertEquals(12, gcdUp(36, 60))
        assertEquals(1, gcdUp(1, 10))
        assertEquals(4, gcdUp(4, 4))
    }

    @Test
    fun gcdTailTest() {
        assertEquals(1, gcdTail(3, 5))
        assertEquals(15, gcdTail(45, 30))
        assertEquals(7, gcdTail(35, 7))
        assertEquals(12, gcdTail(36, 60))
        assertEquals(1, gcdTail(1, 10))
        assertEquals(4, gcdTail(4, 4))
    }
}
