package test

import lab.*

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class Task4Test {

    @Test
    fun maxDigitTest() {
        assertEquals(9, numberTraversalAdvanced(8192, ::maxDigitOperation, { true }))
        assertEquals(0, numberTraversalAdvanced(0, ::maxDigitOperation, { true }))
        assertEquals(3, numberTraversalAdvanced(123, ::maxDigitOperation, { true }))
        assertEquals(4, numberTraversalAdvanced(420, ::maxDigitOperation, { true }))
        assertEquals(5, numberTraversalAdvanced(-25, ::maxDigitOperation, { true }))
    }

    @Test
    fun minOddDigitTest() {
        assertEquals(3, numberTraversalAdvanced(238, ::minDigitOperation, ::isOdd, 9))
        assertEquals(1, numberTraversalAdvanced(17, ::minDigitOperation, ::isOdd, 9))
        assertEquals(3, numberTraversalAdvanced(583, ::minDigitOperation, ::isOdd, 9))
        assertEquals(9, numberTraversalAdvanced(0, ::minDigitOperation, ::isOdd, 9))
        assertEquals(9, numberTraversalAdvanced(420, ::minDigitOperation, ::isOdd, 9))
        assertEquals(5, numberTraversalAdvanced(-25, ::minDigitOperation, ::isOdd, 9))
    }

    @Test
    fun gcdLoopTest() {
        assertEquals(1, gcdHighOrder(3, 5, ::gcdAccept, ::gcdStop))
        assertEquals(15, gcdHighOrder(45, 30, ::gcdAccept, ::gcdStop))
        assertEquals(7, gcdHighOrder(35, 7, ::gcdAccept, ::gcdStop))
        assertEquals(12, gcdHighOrder(36, 60, ::gcdAccept, ::gcdStop))
        assertEquals(1, gcdHighOrder(1, 10, ::gcdAccept, ::gcdStop))
        assertEquals(4, gcdHighOrder(4, 4, ::gcdAccept, ::gcdStop))
    }
}
