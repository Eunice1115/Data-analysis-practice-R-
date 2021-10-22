#Matrix(행렬 형)데이터 유형
mat1 <- matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4),nrow=2)
mat2
mat3 <- matrix(c(1,2,3,4),nrow=2,byrow=T)
mat3

mat3[1,] #1행의 모든 값출력
mat3[,1] #모든 행의 1열 값 출력
mat3[1,1]

mat4 <- matrix(c(1:12),nrow=3)
mat4
mat4[c(1:2),c(2:3)]
