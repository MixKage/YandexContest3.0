_ = input()
A1 = list(map(int, input().split()))
N = len(A1)
 
A1 = A1[::-1]
 
T = [0]
t = []# вспомогательный
A2 = [0]
res = []
 
while 1:
    t.append(A1.pop())
    while t and A1 and t[-1]==A1[-1]+1:
        t.append(A1.pop())
    if A2 and A1 and A2[-1]+1==A1[-1]:
        t.append(A1.pop())
    res.append((1, len(t)))
    T.extend(t)
    t = []
 
    if A2[-1]+1==T[-1]:
        t.append(T.pop())
        while t[-1]+1==T[-1]:
            t.append(T.pop())
 
    if t:
        res.append((2, len(t)))
        A2.extend(t)
        t = []
 
    if not A1:
        if t:
            res.append((2, len(t)))
            A2.extend(t)
        A2.pop(0)
        if A2 != list(range(1,N+1)):
            res = 0
        break
if res==0:
    print('NO')
    # print(0)
else:
    print('YES')
    # for a in res:
        # print(a[0], a[1])
