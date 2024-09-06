'''Module to use subprocesses for other Python files.'''
import subprocess


def random_array(arr):
    '''Generates random array with provided length'''
    shuffled_num = None
    for i in enumerate(arr):
        shuffled_num = subprocess.run(
            ["shuf", "-i1-20", "-n1"], capture_output=True, check=True)
        arr[i[0]] = int(shuffled_num.stdout)
    return arr
