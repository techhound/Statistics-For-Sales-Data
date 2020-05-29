# Random records generator
library(Runuran) #random numbers 

n <- 5000 # The number of records to generate

# Generate Products
bestProducts <- 10 # The mean is the best selling product

productIDs <- as.integer(rnorm(n,bestProducts,3))
productIDs <- productIDs[productIDs > 0 & productIDs < 21]
productIDs <- append(productIDs, rep(bestProducts, n - length(productIDs)))

numCustomers <- 234
customerIDMean <- numCustomers / 2
customerIDs <- as.integer(rnorm(n, customerIDMean, 35))
customerIDs <- customerIDs[customerIDs > 0 & customerIDs < numCustomers]
customerIDs <- append(customerIDs, rep(customerIDMean, n - length(customerIDs)))

# Generate quantities, since 1 is the most quantity that will be purchased, that is the mean
threshhold <- 5
quantityMean <- 1 
quantities <- as.integer(rnorm(n, quantityMean, 1.3))
quantities <- append(quantities, rep(1, length(quantities[quantities == 0])))
quantities <- quantities[quantities != 0]
quantities <- append(quantities, quantities[quantities < 0] * -1)
quantities <- quantities[quantities > 0]
length(quantities)

td = as.Date('2020/05/01') - as.Date('2018/10/01')
transactionDate <- as.Date('2018/10/01') + sample(0:td, n, replace = TRUE)

ordersdf <- data.frame(transactionDate, customerIDs, productIDs, quantities)
write.csv(ordersdf, "orders.csv")

#states <- round(rnorm(234, 7, 2.1), 0)

states <- as.integer(urnorm(100,7,2.1,1,12))
