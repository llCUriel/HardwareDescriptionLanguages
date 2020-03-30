m = 20

for n in range(m):
  Cin = 1
  A = B = [9]*n
  Z,T = [0]*n,[0]*n
  C,S = [0]*(n+1),[0]*(n+1)
  i = 0
  C[i] = Cin
  while(i<n):
    T[i] = A[i]+B[i]+C[i]
    if(T[i]>9):
      Z[i]=10
      C[i+1]=1
    S[i]=T[i]-Z[i]
    i = i + 1
  S[n]=C[n]
  S.reverse()
  print(str(S))


