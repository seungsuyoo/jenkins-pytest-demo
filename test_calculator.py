import pytest
from calculator import Calculator


class TestCalculator:
    def setup_method(self):
        self.calc = Calculator()

    def test_add(self):
        assert self.calc.add(2, 3) == 5
        assert self.calc.add(-1, 1) == 0

    def test_subtract(self):
        assert self.calc.subtract(5, 3) == 2
        assert self.calc.subtract(0, 5) == -5

    def test_multiply(self):
        assert self.calc.multiply(3, 4) == 12
        assert self.calc.multiply(-2, 3) == -6

    def test_divide(self):
        assert self.calc.divide(10, 2) == 5
        assert self.calc.divide(9, 3) == 3

    def test_divide_by_zero(self):
        with pytest.raises(ValueError):
            self.calc.divide(10, 0)

    def test_power(self):
        assert self.calc.power(2, 3) == 8
        assert self.calc.power(5, 2) == 25

    def test_intentional_fail(self):
        assert self.calc.add(2, 2) == 4
