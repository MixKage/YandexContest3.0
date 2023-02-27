n, m = map(int, input().split())
lst = [[int(it) for it in input().split()] for _ in range(n)]
 
for cln in range(m-2, -1, -1):
    lst[-1][cln] += lst[-1][cln+1]
for row in range(n-2, -1, -1):
    lst[row][-1] += lst[row+1][-1]
for row in range(n-2, -1, -1):
    for cln in range(m-2, -1, -1):
        lst[row][cln] += min(lst[row+1][cln], lst[row][cln+1])
 
print(lst[0][0])
