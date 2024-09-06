import pytest
from hw2_debugging import merge_sort

def test_pass():
    assert merge_sort([5, 2, 4, 1]) == [1, 2, 4, 5]

def test_pass_larger():
    assert merge_sort([12, 24, 24, 34, 32, 65, 54]) == [12, 24, 24, 32, 34, 54, 65]

def test_fail():
    assert merge_sort([15, 13, 12]) != [12, 15, 13]