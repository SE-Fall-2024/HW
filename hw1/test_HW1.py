import pytest
from myfile import func, multiply

def test_pass():
    assert func(2,3) == 38

def test_fail():
    assert func(2,3) == 39 