BenchmarkClasses <- function (AttachedWorkspace = "cayenne",
                              Threshold=0.9)
{
  
  load(paste(AttachedWorkspace,"RData",sep="."))
  dataRSS <- data.RSS[1:9,c(1,3)]
  dataRSS[,2] <- round(dataRSS[,2],2)
  colnames(dataRSS) <- c("Archetypes","Reduction")
  
  RSSplot <- ggplot(data=dataRSS, aes(x=Archetypes, y=Reduction)) +
    
    geom_line(colour = "white")+
    geom_point(colour = "white",size=6)+
    scale_x_continuous(breaks=c(1,2,3,4,5,6,7,8,9,10))+
    xlab("Archetypes") +
    ylab("Percentage reduction of RSS") +
    theme_solarized(light = FALSE)+
    removeGrid(x=TRUE, y=TRUE)+
    
    theme(
      axis.title.x = element_text(
        face = "bold",
        color = "white",
        size = 12
      ),
      axis.title.y = element_text(
        face = "bold",
        color = "white",
        size = 12
      ),
      
      axis.text.x = element_text(
        size = 11,
        hjust = 0.5,
        vjust = 0.5,
        face = 'bold',
        color = "white"
        
        
      ),
      axis.text.y = element_text(
        size = 11,
        hjust = 0.5,
        vjust = 0.5,
        face = 'bold',
        color = "white"
      ),
      legend.position="bottom",
      legend.title=element_blank()
      
      
    )
  
  #####################################
  NumAA <- 8
  abest <- bestModel(as[[NumAA]])
  
  which <- apply(coef(abest, "alphas"), 2, which.max)
  
  Classes <- function(which) {
    Classes <- list()
    Classes$which <- which
    Classes$mat <- mat[which, ]
    Classes$coef <- coef(abest, "alphas")[which, ]
    Classes$dat <- dat[which, ]
    
    Classes
  }
  
  atypes <- Classes(which)
  colnames(atypes$dat)[1] <- c("Class")
  NamesAA <- vector("numeric", NumAA)
  
  
  AACoefficients <- data.frame(round(atypes$coef,3))
  
  for (i in 1:NumAA){
    NamesAA[i] <- paste("Archetype", i, sep = " ")
  }
  
  Archetypes <- data.frame(cbind(atypes$dat[,1],round(atypes$dat[,-1],3),AACoefficients))
  
  colnames(Archetypes) <- c(colnames(atypes$dat),NamesAA)
  
  FinalModels  <- NULL
  FinalCoeff <- NULL
  for (i in 1:NumAA){
    which <- which(coef(abest, "alphas")[, i] >=Threshold)
    atypes1 <- Classes(which)
    TempModels <- atypes1$dat
    FinalModels<- rbind(FinalModels,TempModels)
    
    TempCoeff <- atypes1$coef
    FinalCoeff<- rbind(FinalCoeff,TempCoeff)
    
  }
  
  matArchetypes <- rbind(mat,
                         parameters(abest))
  Method <- c(rep("Models",nrow(dataset)),rep("Archetypes", NumAA))
  
  pcplotdataset <- data.frame(Method,matArchetypes)
  
  
  PCplot <- ggparcoord(data=pcplotdataset, columns=c(2:ncol(pcplotdataset)),scale="uniminmax",groupColumn=1)+
    
    scale_colour_manual(values = c("red","white"),
                        name="",
                        labels=c("Archetypes","Models"))+
    
    geom_line(size=2)+
    scale_alpha_continuous(range  = c(0.01, 0.9))+
    
    xlab("Measures") +
    ylab("Standardized Values") +
    theme_solarized(light = FALSE)+
    removeGrid(x=TRUE, y=TRUE)+
    
    theme(
      axis.title.x = element_text(
        face = "bold",
        color = "white",
        size = 16
      ),
      axis.title.y = element_text(
        face = "bold",
        color = "white",
        size = 16
      ),
      plot.title = element_text(
        face = "bold",
        color = "white",
        size = 36
      ),
      axis.text.x = element_text(
        size = 12,
        hjust = 0.5,
        vjust = 0.5,
        face = 'bold',
        color = "white"
        
        
      ),
      axis.text.y = element_text(
        size = 12,
        hjust = 0.5,
        vjust = 0.5,
        face = 'bold',
        color = "white"
      ),
      legend.position="bottom",
      legend.title=element_blank(),
      legend.text = element_text(size=20,
                                 face = 'bold',
                                 color = "white")
      
    )
  
  
  ArchetypesSolution <- round(as.data.frame(parameters(abest)),3)
  
  Archetype <- NamesAA
  ArchetypesSolution <- data.frame(Archetype,ArchetypesSolution)
  
  Ranking <- order(rowMeans(ArchetypesSolution[,-1]))
  ArchetypesSolution <- ArchetypesSolution[Ranking,]
  ArchetypesSolution$Archetype <- c("The Min-Ruler",
                                    "The Rebel 1",
                                    "The Rebel 2", 
                                    "The Rebel 3",
                                    "The Partner 1",
                                    "The Partner 2",
                                    "The Partner 3",
                                    "The Max-Ruler")
  
  NearArchetypes <- data.frame(cbind(FinalModels[,1],round(FinalModels[,-1],3),round(FinalCoeff[,Ranking],3)))
  colnames(NearArchetypes) <- c(colnames(atypes$dat),NamesAA)
  
  row.names(NearArchetypes) <- NULL
  
  colnames(NearArchetypes)[c(5:12)] <- ArchetypesSolution$Archetype
  
  WorstArchetype <- as.character(ArchetypesSolution[8,c("Archetype")])
  
  
  NearWorst <- NearArchetypes[NearArchetypes[,paste(WorstArchetype)]>=Threshold,
                              c("Class","Sonar","Squore","Cast",paste(WorstArchetype))]
  
  NoClassesWorst <- nrow(NearWorst)
  
  
  data.ArchBarPlot.Long <- melt(ArchetypesSolution, id.vars=c("Archetype"))
  
  data.ArchBarPlot.Long$Archetype <- factor(data.ArchBarPlot.Long$Archetype, 
                                            levels= c("The Rebel 1",
                                                      "The Rebel 2", 
                                                      "The Rebel 3",
                                                      "The Partner 1",
                                                      "The Partner 2",
                                                      "The Partner 3",
                                                      "The Min-Ruler",
                                                      "The Max-Ruler"))
  
  colnames(data.ArchBarPlot.Long) <- c("Archetype","Tool","Rank") 
  
  AchetypeProfilePlot <- ggplot(data=data.ArchBarPlot.Long, aes(x=Tool, y=Rank)) +
    facet_wrap(.~Archetype , nrow=3)+
    geom_bar(stat="identity", fill="white")+
    xlab("Tool") +
    ylab("Rank") +
    theme_solarized(light = FALSE)+
    removeGrid(x=TRUE, y=TRUE)+
    
    theme(
      strip.text.x = element_text(size = 12, hjust = 0.5, vjust = 0.5, face = 'bold'),
      axis.title.x = element_blank(),
      
      axis.title.y = element_blank(),
      
      
      axis.text.x = element_text(
        size = 11,
        hjust = 0.5,
        vjust = 0.5,
        face = 'bold',
        color = "white"
        
        
      ),
      axis.text.y = element_text(
        size = 11,
        hjust = 0.5,
        vjust = 0.5,
        face = 'bold',
        color = "white"
      ),
      legend.position="bottom",
      legend.title=element_blank(),
      legend.text = element_text(size=20,
                                 face = 'bold',
                                 color = "white"))
  
  NoClasses <- nrow(dataset)
  
  
  
  KendallResults <-  KendallW(mat, correct = T, test = T, na.rm = T)
  KendallEstimate <- round(KendallResults$estimate,3)
  KendallPValue <- round(KendallResults$p.value,3)
  
  if(KendallPValue<0.001)
  {
    KendallPValue <- c("< 0.001")
  }
  
  
  RSSplot <- ggplotly(RSSplot)
  AchetypeProfilePlot <- ggplotly(AchetypeProfilePlot)
  
  
  
  ProbNearWorst <- NoClassesWorst/NoClasses
  
  PercNearWorst<- round(ProbNearWorst*100,2)
  
  PercNearWorst <- paste(PercNearWorst,"%")
  
  list(NoClasses=NoClasses,
       NoClassesWorst=NoClassesWorst,
       PercNearWorst=PercNearWorst,
       KendallEstimate=KendallEstimate,
       KendallPValue=KendallPValue,
       RSSplot=RSSplot,
       PCplot=PCplot,
       AchetypeProfilePlot=AchetypeProfilePlot,
       Archetypes=Archetypes,
       NearArchetypes=NearArchetypes,
       ArchetypesSolution=ArchetypesSolution,
       NearWorst=NearWorst)
  
}


