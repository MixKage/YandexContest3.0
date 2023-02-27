subsequence = [1]

def f(n):
    cache = [0] * (n + 1)
    for i in range(2, n + 1):
        v = cache[i - 1]
        if i % 2 == 0:
            v = min(v, cache[i // 2])
        if i % 3 == 0:
            v = min(v, cache[i // 3])
        cache[i] = v + 1
        if(cache[i-1]<cache[i]):
            subsequence.append(i)
    return cache[-1]

print(f(int(input())))
print(*subsequence, sep = ' ')
