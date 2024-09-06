'''Module for importing external file rand.py'''
import rand
import pdb


def merge_sort(arr):
    '''Parent Function for Merge Sort'''
    if len(arr) == 1:
        return arr

    half = len(arr)//2
    return recombine(merge_sort(arr[:half]), merge_sort(arr[half:]))


def recombine(left_arr, right_arr):
    '''Child Function to Combine Seperated Arrays'''
    left_index = 0
    right_index = 0
    merge_arr = [None] * (len(left_arr) + len(right_arr))
    while left_index < len(left_arr) and right_index < len(right_arr):
        if left_arr[left_index] < right_arr[right_index]:
            merge_arr[left_index + right_index] = left_arr[left_index]
            left_index += 1
        else:
            merge_arr[left_index + right_index] = right_arr[right_index]
            right_index += 1

    for i in range(right_index, len(right_arr)):
        merge_arr[left_index + i] = right_arr[i]

    for i in range(left_index, len(left_arr)):
        merge_arr[right_index + i] = left_arr[i]

    return merge_arr


random_arr = rand.random_array([None] * 20)
arr_out = merge_sort(random_arr)

print(arr_out)
