from sage.plot.circle import Circle
def abacus(w):
    print w
    G = Graphics()
    G += line([(0,1.5), (0, -0.5)], thickness=5)
    G += line([(0,0), (0,len(w)+0.5)])
    for i, x in enumerate(w):
        G += text('$%s$'%(i), (i,1))
        if x > 0:
            G += Circle(i,0, 0.3, {'zorder':2}) + text('$%s$'%(x), (i,0)
    return G
