#######################################################
######## 외부요인 famd ################################
#######################################################

out_market = read.csv("C:/Users/win10/Desktop/data/out_market.csv", fileEncoding = "euc-kr")

head(out_market)
str(out_market)

out_market_X = out_market[,2:8]
head(out_market_X)


out_market_X[,2] = as.factor(out_market_X[,2])
out_market_X[,3] = as.factor(out_market_X[,3])

str(out_market_X)

library(FactoMineR)
out_market_res = FAMD(out_market_X, 2)

out_market_res$eig
out_market_res$var$contrib
# xx <- out_market_res$ind$coord
# write.csv(xx, "C:/Users/win10/Desktop/data/out_market변환.csv")
out_market_res$quali.var
out_market_res$quanti.var
out_market_res$call


#######################################################
######## 고객요인 famd ################################
#######################################################

customer_data = read.csv("C:/Users/win10/Desktop/data/customer_data.csv", fileEncoding = 'euc-kr')

customer_X = customer_data[,3:7]
head(customer_data)
head(customer_X)

library(FactoMineR)
customer_res = PCA(customer_X, ncp=2) # PCA

customer_res$eig # 분산비율
customer_res$var$contrib # contribution

#######################################################
######## 시장요인 famd ################################
#######################################################


market_data <- read.csv("H:/공유 드라이브/통분방+공모전/데이터/데이터정리 최종/시장요인.csv", header = T, fileEncoding = "euc-kr") # data불러오기


X = market_data[,2:10]
dim(X)
install.packages("FactoMineR")

library(FactoMineR)

result <- FAMD(X, 3) # famd실행

# 아래는 결과들
result$eig # 분산비율
result$var # contribution

result$quali.var # quality변수들만의 결과
result$quanti.var # quantity변수들만의 결과
result$call
result$ind[1]
result$ind[2]
