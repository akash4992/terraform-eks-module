for row in range (7):
    for col in range(5):
        if row == 0 and col in {1,2,3}:
            print("*",end=" ")
        elif row in {1,2,4,5,6} and col in {0,4}:
            print("*", " ")
        elif row == 3:
            print("*", " ")
        else:
            print(" ",end=" ")
    print()