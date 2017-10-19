def jacobi1(n, k):
    G = Graphics()
    for i in range(k):
        for j in range(1, n+1):
            G += circle((i, j), 0.05, fill=True, color="grey")
            if i < k-1:
                G += arrow(tailpoint=(i, j), headpoint=(i+1, j), color="grey")
                G += text('$x_%s$'%(j), (i+0.5, j+0.2), color="grey", fontsize=14)
            if j > 1:
                G += arrow(tailpoint=(i, j), headpoint=(i, j-1), color="grey")
    for i in range(k):
        G += text("(%s,5)"%(i), (i, 5.2), color="grey") + text("(%s,1)"%(i), (i, 0.8), color="grey")
    return G

def path(n, startj, steps):
    G = Graphics()
    now = (startj, n)
    for s in steps:
        if s == 'r':
            nxt = (now[0]+1, now[1])
        else:
            nxt = (now[0], now[1]-1)
        G += arrow(tailpoint=now, headpoint=nxt)
        if s == 'r':
            G += text('$x_%s$'%(now[1]), (now[0]+0.5, now[1]+0.2), fontsize=14)
        now = nxt
    return G
