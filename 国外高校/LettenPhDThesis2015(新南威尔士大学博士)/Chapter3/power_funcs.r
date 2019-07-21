# Functions called in power analysis (Fig 4 in ms)

trait.evolve<-function(tree,num.reps=10,mode.of.evolution="OU",alpha){
  num.taxa<-length(tree$tip.label)
  data.temp<-data.frame(tree$tip.label,rep(1,num.taxa),rep(1,num.taxa))
  #now have to set up something that can multicore nicely different alphas
  
  ou.sim<-function(alpha,tree=tree,data.temp=data.temp,num.reps=2){
    trait.data.out<-NULL  #a bit hacky but it works
    for (i in 1:num.reps){
      library("OUwie")
      trait.data.out[[i]]<-OUwie.sim(tree,data.temp,alpha=alpha, sigma.sq=0.45, theta0=0, theta=0)
    }  
    return(trait.data.out)
  }
  #ou.sim(alpha=1,tree=tree,data.temp=data.temp,num.reps=2) #testing line 
  
  if (mode.of.evolution=="OU"){
    out.mc <- lapply(alpha,tree=tree,FUN=ou.sim,data.temp=data.temp,num.reps=num.reps)
    return(out.mc)
  }
  if (mode.of.evolution=="BM"){
    out.mc.bm<-fastBM(tree,mu=0,sig2=0.45,nsim=num.reps) 
    return(out.mc.bm)
  }
}

tree.evolve<-function(tree.choice="sim",pool.size=200){
  #real tree 
  if (tree.choice=="real") tree <- tanktree
  #or sim tree
  if (tree.choice=="sim") tree<-pbtree(b=1,n=pool.size,scale=422.6181,extant.only=TRUE) #estimating depth on the big tree takes a long time for some 
  
  if (length(tree$tip.label)>pool.size) {
    big.tree<-tree
    tree<-drop.tip.fixed(big.tree,sample(length(big.tree$tip.label),length(big.tree$tip.label)-pool.size)) #drop tips randomly to get down to a workable   tree
  }
  
  store.node.labels<-tree$node.label
  tree$node.label<-rep(1,(length(tree$tip.label)-1))
  return(tree)
}  

make.picante.format.bm <- function(out.mc.bm = out.mc.bm,ca){
  comm.phy.list <- list() 
  if (ca == "filter") species.list <- multi.filter.bm(out.mc.bm)
  if (ca == "neutral") species.list <- multi.neutral.bm(out.mc.bm)
  nspecies <- length(unique(unlist(species.list)))
  m <- matrix(data = 0, ncol = nspecies, nrow = dim(out.mc.bm)[2])
  colnames(m) <- unique(unlist(species.list))
  for (i in 1:length(species.list)){ #hacky!
    m[i, which(colnames(m)%in%species.list[[i]])] <- 1
  }
  return(m)
}

# filtering approaches
filter.derived <- function(species, trait, sr.community = 40) {
  print("habitat filter")
  opt <- max(trait) # NB. max = most derived
  return(species[(order(abs(opt - trait)))[0:sr.community]])
}

neutral.filter <- function(species, trait, sr.community = 40){
  print("neutral")
  return(species[trait %in% sample(trait, sr.community)])
}


multi.filter.bm<-function(out.mc.bm=out.mc.bm){
  comm.list<-list() 
  for (i in 1:dim(out.mc.bm)[2]){
    comm.list[[i]]<-filter.derived(row.names(out.mc.bm), out.mc.bm[,i])
  }
  return(comm.list)
}


multi.neutral.bm<-function(out.mc.bm=out.mc.bm){
  comm.list<-list() 
  for (i in 1:dim(out.mc.bm)[2]){
    comm.list[[i]]<-neutral.filter(row.names(out.mc.bm), out.mc.bm[,i])
  }
  return(comm.list)
}

## This is a patched version of drop.tip that will keep the nodes in
## the correct order.  Otherwise it is exactly the same as the
## drop.tip in ape version 2.4-1 (right down to the use of dim(x)[1]
## instead of nrow(x)).  See REMOVE/REPLACE/DONE at the end for changes.
drop.tip.fixed <- function(phy, tip, trim.internal = TRUE, subtree =
                             FALSE, root.edge = 0, rooted = is.rooted(phy)) {
  if (!inherits(phy, "phylo")) 
    stop("object \"phy\" is not of class \"phylo\"")
  Ntip <- length(phy$tip.label)
  if (is.character(tip)) 
    tip <- which(phy$tip.label %in% tip)
  if (!rooted && subtree) {
    phy <- root(phy, (1:Ntip)[-tip][1])
    root.edge <- 0
  }
  phy <- reorder(phy)
  NEWROOT <- ROOT <- Ntip + 1
  Nnode <- phy$Nnode
  Nedge <- dim(phy$edge)[1]
  if (subtree) {
    trim.internal <- TRUE
    tr <- reorder(phy, "pruningwise")
    N <- .C("node_depth", as.integer(Ntip), as.integer(Nnode), 
            as.integer(tr$edge[, 1]), as.integer(tr$edge[, 2]), 
            as.integer(Nedge), double(Ntip + Nnode), DUP = FALSE, 
            PACKAGE = "ape")[[6]]
  }
  wbl <- !is.null(phy$edge.length)
  edge1 <- phy$edge[, 1]
  edge2 <- phy$edge[, 2]
  keep <- !logical(Nedge)
  if (is.character(tip)) 
    tip <- which(phy$tip.label %in% tip)
  if (!rooted && subtree) {
    phy <- root(phy, (1:Ntip)[-tip][1])
    root.edge <- 0
  }
  keep[match(tip, edge2)] <- FALSE
  if (trim.internal) {
    ints <- edge2 > Ntip
    repeat {
      sel <- !(edge2 %in% edge1[keep]) & ints & keep
      if (!sum(sel)) 
        break
      keep[sel] <- FALSE
    }
    if (subtree) {
      subt <- edge1 %in% edge1[keep] & edge1 %in% edge1[!keep]
      keep[subt] <- TRUE
    }
    if (root.edge && wbl) {
      degree <- tabulate(edge1[keep])
      if (degree[ROOT] == 1) {
        j <- integer(0)
        repeat {
          i <- which(edge1 == NEWROOT & keep)
          j <- c(i, j)
          NEWROOT <- edge2[i]
          degree <- tabulate(edge1[keep])
          if (degree[NEWROOT] > 1) 
            break
        }
        keep[j] <- FALSE
        if (length(j) > root.edge) 
          j <- 1:root.edge
        NewRootEdge <- sum(phy$edge.length[j])
        if (length(j) < root.edge && !is.null(phy$root.edge)) 
          NewRootEdge <- NewRootEdge + phy$root.edge
        phy$root.edge <- NewRootEdge
      }
    }
  }
  if (!root.edge) 
    phy$root.edge <- NULL
  phy$edge <- phy$edge[keep, ]
  if (wbl) 
    phy$edge.length <- phy$edge.length[keep]
  TERMS <- !(phy$edge[, 2] %in% phy$edge[, 1])
  oldNo.ofNewTips <- phy$edge[TERMS, 2]
  n <- length(oldNo.ofNewTips)
  phy$edge[TERMS, 2] <- rank(phy$edge[TERMS, 2])
  if (subtree || !trim.internal) {
    tips.kept <- oldNo.ofNewTips <= Ntip & !(oldNo.ofNewTips %in% 
                                               tip)
    new.tip.label <- character(n)
    new.tip.label[tips.kept] <- phy$tip.label[-tip]
    node2tip <- oldNo.ofNewTips[!tips.kept]
    new.tip.label[!tips.kept] <- if (subtree) {
      paste("[", N[node2tip], "_tips]", sep = "")
    }
    else {
      if (is.null(phy$node.label)) 
        rep("NA", length(node2tip))
      else phy$node.label[node2tip - Ntip]
    }
    if (!is.null(phy$node.label)) 
      phy$node.label <- phy$node.label[-(node2tip - Ntip)]
    phy$tip.label <- new.tip.label
  }
  else phy$tip.label <- phy$tip.label[-tip]
  if (!is.null(phy$node.label)) 
    phy$node.label <- phy$node.label[sort(unique(phy$edge[, 
                                                          1])) - Ntip]
  phy$Nnode <- dim(phy$edge)[1] - n + 1L
  
  ## REMOVE:
  ##     newNb <- integer(n + phy$Nnode)
  ##     newNb[NEWROOT] <- n + 1L
  ##     sndcol <- phy$edge[, 2] > n
  ##     phy$edge[sndcol, 2] <- newNb[phy$edge[sndcol, 2]] <- (n + 
  ##         2):(n + phy$Nnode)
  ##     phy$edge[, 1] <- newNb[phy$edge[, 1]]
  ## REPLACE:
  i <- phy$edge > n
  phy$edge[i] <- match(phy$edge[i], sort(unique(phy$edge[i]))) + n
  ## DONE:
  
  storage.mode(phy$edge) <- "integer"
  collapse.singles(phy)
}
