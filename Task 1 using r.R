set.seed(123)
dir.create("Output",showWarnings=FALSE)

# Part 1 : Generate Dataset
n1<-100000;n2<-100000
c1<-cbind(rnorm(n1,1.5,1),rnorm(n1,3,1))
c2<-cbind(rnorm(n2,8,1),rnorm(n2,9,1))
X<-rbind(c1,c2)
colnames(X)<-c("X1","X2")
write.csv(as.data.frame(X),"synthetic_data.csv",row.names=FALSE)
print(head(X))
png("Output/dataset.png")
plot(X,col="grey",pch=16,main="Synthetic Dataset",xlab="X1",ylab="X2")
dev.off()

# Part 2 : Initialize Parameters
K<-2;n<-nrow(X);d<-ncol(X)
weights<-rep(1/K,K)
means<-X[sample(1:n,K),]
covs<-array(0,c(d,d,K))
for(k in 1:K) covs[,,k]<-diag(d)
print(weights);print(means);print(covs)

# Part 3 : Gaussian Density Function
gaussian_pdf<-function(data,mu,Sigma){
 Sigma<-Sigma+diag(1e-6,nrow(Sigma))
 invS<-solve(Sigma);detS<-det(Sigma)
 diff<-sweep(data,2,mu)
 expo<-rowSums((diff%*%invS)*diff)
 exp(-0.5*expo)/sqrt(((2*pi)^ncol(data))*detS)
}

max_iter<-20;tol<-1e-6
loglik_hist<-c();oldLL<--Inf

for(iter in 1:max_iter){
  # Part 4 : E-Step
  resp<-matrix(0,n,K)
  for(k in 1:K)
    resp[,k]<-weights[k]*gaussian_pdf(X,means[k,],covs[,,k])
  resp<-resp/rowSums(resp)

  # Part 5 : M-Step
  Nk<-colSums(resp)
  weights<-Nk/n
  for(k in 1:K){
    means[k,]<-colSums(resp[,k]*X)/Nk[k]
    diff<-sweep(X,2,means[k,])
    covs[,,k]<-t(diff)%*%(diff*resp[,k])/Nk[k]+diag(1e-6,d)
  }

  # Part 6 : Log Likelihood
  dens<-matrix(0,n,K)
  for(k in 1:K)
    dens[,k]<-weights[k]*gaussian_pdf(X,means[k,],covs[,,k])
  ll<-sum(log(rowSums(dens)))
  loglik_hist<-c(loglik_hist,ll)
  cat("Iteration",iter,"LogLik =",ll,"\n")
  print(weights);print(means)
  if(abs(ll-oldLL)<tol) break
  oldLL<-ll
}

clusters<-apply(resp,1,which.max)

png("Output/final_clusters.png")
plot(X,col=clusters,pch=16,main="Final Cluster Assignment",xlab="X1",ylab="X2")
points(means,col="red",pch=8,cex=2,lwd=2)
dev.off()

png("Output/log_likelihood.png")
plot(loglik_hist,type="b",xlab="Iteration",ylab="Log-Likelihood",
main="Log-Likelihood vs Iteration")
dev.off()

cat("\nFinal Weights\n");print(weights)
cat("\nFinal Means\n");print(means)
cat("\nFinal Covariance Matrices\n");print(covs)
