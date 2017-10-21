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

# for the tableau [[2, 3], [4, 5], [5], [6]]
G = jacobi1(5, 7) + path(5, 4, 'ururuu') + path(5, 3, 'uuurur') + path(5, 2, 'uuuur') + path(5, 1, 'uuuu') + path (5, 0, 'uuuu')
for u, i in enumerate([6, 5, 3, 2, 0]):
    G += circle((i, 5), 0.05, fill=True, color = "blue") + text('$B_%s$'%(u+1), (i, 5.4), color="blue", fontsize=14) + text('$A_%s$'%(u+1), (4-u, 0.6), color='blue', fontsize=14) + circle((4-u, 1), 0.05, fill=True, color="blue") 

