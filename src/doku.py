def demo_sub_function():
    print ('This is sub funtion')

def demo_sub_with_loop():
    print ('This function loop things...')
    for number in range(13, 29):
        print(number)

def main():
    print('This is main function')
    demo_sub_function()
    demo_sub_with_loop()
main()