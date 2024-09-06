
'''Testing File for HW2'''
from hw2_debugging import merge_sort

def test_pass():
    '''Passing Small (5) Test'''
    assert merge_sort([2, 4, 1, 3, 5]) == [1, 2, 3, 4, 5]

def test_pass_larger():
    '''Passing Large (8) Test'''
    assert merge_sort([12, 24, 24, 34, 32, 65, 54, 70]) == [12, 24, 24, 32, 34, 54, 65, 70]

def test_fail():
    '''Failing Small Test'''
    assert merge_sort([15, 13, 12, 21]) != [12, 21, 15, 13]
