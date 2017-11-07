def jacobi1(n, k):
    G = Graphics()
    for i in range(k):
        for j in range(1, n+1):
            G += circle((i, j), 0.05, fill=True, color="lightgrey")
            if i < k-1:
                G += arrow(tailpoint=(i, j), headpoint=(i+1, j), color="lightgrey")
                G += text('$x_%s$'%(j), (i+0.5, j+0.2), color="lightgrey", fontsize=14)
            if j > 1:
                G += arrow(headpoint=(i, j), tailpoint=(i, j-1), color="lightgrey")
    for i in range(k):
        G += text("(%s,5)"%(i), (i, 5.2), color="lightgrey") + text("(%s,1)"%(i), (i, 0.8), color="lightgrey")
    return G

def path(n, startj, steps):
    G = Graphics()
    now = (startj, 1)
    for s in steps:
        if s == 'r':
            nxt = (now[0]+1, now[1])
        else:
            nxt = (now[0], now[1]+1)
        G += arrow(tailpoint=now, headpoint=nxt)
        if s == 'r':
            G += text('$x_%s$'%(now[1]), (now[0]+0.5, now[1]+0.2), fontsize=14)
        now = nxt
    return G

# for the tableau [[1, 1, 3], [2, 4], [3,5], [5]]
# G = jacobi1(5, 7) + path(5, 3, 'rruuruu') + path(5, 2, 'uruuru') + path(5, 1, 'uuruur') + path(5, 0, 'uuuur')
# for u, i in enumerate([6, 4, 3, 1]):
#     G += circle((i, 5), 0.05, fill=True, color = "blue") + text('$B_%s$'%(u+1), (i, 5.4), color="blue", fontsize=14) + text('$A_%s$'%(u+1), (3-u, 0.6), color='blue', fontsize=14) + circle((3-u, 1), 0.05, fill=True, color="blue") 

def jacobi2(n, k):
    G = Graphics()
    for i in range(k):
        for j in range(n+1):
            if j < n and i < k-1:
                G += circle((i, j), 0.05, fill=True, color="lightgrey")
                G += arrow(tailpoint=(i, j), headpoint=(i+1, j+1), color="lightgrey")
                G += text('$x_%s$'%(j+1), (i+0.4, j+0.6), color="lightgrey", fontsize=14)
            if j>0:
                G += arrow(headpoint=(i, j), tailpoint=(i, j-1), color="lightgrey")
    for i in range(k):
        G += text("(%s,5)"%(i), (i, 5.2), color="lightgrey") + text("(%s,0)"%(i), (i, -0.2), color="lightgrey")
    return G

def path2(starti, path):
    G = Graphics()
    now = (starti,0)
    for a in path:
        if a == 'r':
            nxt = (now[0]+1, now[1]+1)
        else:
            nxt = (now[0], now[1]+1)
        G += arrow(tailpoint=now, headpoint=nxt)
        G += text('$x_%s$'%(now[1]+1), (now[0] + 0.4, now[1] + 0.6), fontsize=14)
        now = nxt
    return G

G = jacobi2(5, 7) + path2(2, 'rrrur') + path2(1, 'ruurr') + path2(0, 'uuruu')
for u, i in enumerate([6, 4, 1]):
    G += circle((i, 5), 0.05, fill=True, color = "blue") + text('$B_%s$'%(u+1), (i, 5.4), color="blue", fontsize=14) + text('$A_%s$'%(u+1), (2-u, -0.4), color='blue', fontsize=14) + circle((2-u, 0), 0.05, fill=True, color="blue") 


def giambelli(n,k):
    G = Graphics()
    for i in range(k):
        for j in range(1, n+1):
            G += circle((i, j), 0.05, fill=True, color="lightgrey")
            if i < k-1:
                G += arrow(tailpoint=(i, j), headpoint=(i+1, j), color="lightgrey")
                G += text('$x_%s$'%(j), (i+0.5, j+0.2), color="grey", fontsize=14)
            if j > 1:
                G += arrow(headpoint=(i, j), tailpoint=(i, j-1), color="lightgrey")
    for i in range(k):
        G += text("(%s,5)"%(i), (i, 5.2), color="grey") + text("(%s,1)"%(i), (i, 0.8), color="grey")

    for i in range(k):
        for j in range(1,n+2):
            if j>1 and i>0:
                G += circle((-i,j), 0.05, fill=True, color="lightgrey")
                G += arrow(tailpoint=(-i,j), headpoint=(-(i-1),j-1), color="lightgrey")
                G += text('$x_%s$'%(j-1), (-i+0.4, j-1+0.4), color="grey", fontsize=14)
            if j>1:
                G += arrow(tailpoint=(-i,j), headpoint=(-i,j-1), color="lightgrey")
    for i in range(k):
        G += text("(%s,6)"%(-i), (-i,6.2), color="grey") + text("(%s,1)"%(-i),(-i,0.8), color="grey")


    return G

def giambelli_path(starti, leg, arm):
    G = Graphics()
    j = 6
    for l in leg:
        if l == 'd':
            G += arrow(tailpoint=(starti,j), headpoint=(starti,j-1), color="blue")
        else:
            G += arrow(tailpoint=(starti,j), headpoint=(starti+1,j-1), color="blue")
            G += text('$x_%s$'%(j-1), (starti+0.4, j-0.6), color="blue", fontsize=14)
            starti += 1
        j -= 1
    for a in arm:
        if a == 'u':
            G += arrow(tailpoint=(starti,j), headpoint=(starti,j+1), color="blue")
            j += 1
        else:
            G += arrow(tailpoint=(starti,j), headpoint=(starti+1,j), color="blue")
            G += text('$x_%s$'%(j), (starti+0.5, j+0.2), color="blue", fontsize=14)
            starti += 1
    return G
def fig():
    return giambelli(5,5) + giambelli_path(-4, 'rrdrr', 'rruuruu') + giambelli_path(-2, 'drr', 'ruru') + giambelli_path(-1, 'dr', 'u') + text('$A_1$',(-4,6.5),fontsize=14) + text('$A_2$', (-2,6.5), fontsize=14) + text('$A_3$', (-1,6.5), fontsize=14) + text('$B_1$',(3,5.5),fontsize=14) + text('$B_2$', (2,5.5), fontsize=14) + text('$B_3$', (0,5.5), fontsize=14)
