global n,m,matrix,pathmatrix
 
#Возвращает минимальный путь от (0,0) до (x,y)
def rec(x, y):
    try:
        return pathmatrix[x,y]
    except:
        if x > 0:
            left = rec(x - 1, y)
        else:
            left = (-1,[])
        if y > 0:
            up = rec(x, y - 1)
        else:
            up = (-1,[])
        maxdist = max(left[0], up[0]) + matrix[x][y]
        if left[0] > up[0]:
            path = pathmatrix[x - 1,y][1].copy()
            path.append('D')
        else:
            path = pathmatrix[x,y - 1][1].copy()
            path.append('R')
        pathmatrix[x,y] = (maxdist,path)
        return pathmatrix[x,y]
 
n,m = [int(i) for i in input().split()]
matrix = [[int(i) for i in input().split()] for j in range(n)]
#Тут будем хранить минимальную дистанцию и путь до каждой клетки от (0,0)
pathmatrix = {(0,0) : (matrix[0][0], [])}
res = rec(n-1,m-1)
print(res[0])
print(' '.join(res[1]))
