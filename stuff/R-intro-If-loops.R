


p <- c(rep(0,700),rep(1,300))

nexperiences <- 100000
nsuccesses <- 0

for(i in 1:nexperiences){
  
  psum <- 0
  vtrials <- c()
  
  for(j in 1:10){
    psum <- psum + sample(p, 1)
    vtrials[j] <- psum
  }
  
  # Count if the 10th trial was the fith time with success
  if(vtrials[10]==5 & (sum(vtrials==5)==1)){
    nsuccesses <- nsuccesses + 1
  }
}

print(nsuccesses / nexperiences)

# P = 0.051