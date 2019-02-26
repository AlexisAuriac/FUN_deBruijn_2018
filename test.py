#!/bin/python

def de_bruijn(alpha, n):
    lenAlpha = len(alpha)

    a = [0] * lenAlpha * n
    sequence = []

    def db(t, p):
        if t > n:
            if n % p == 0:
                sequence.extend(a[1:p + 1])
        else:
            a[t] = a[t - p]
            db(t + 1, p)
            for j in range(a[t - p] + 1, lenAlpha):
                a[t] = j
                db(t + 1, t)
    db(1, 1)
    return "".join(alpha[i] for i in sequence)

print(de_bruijn("01", 1))
print(de_bruijn("abcd", 2))