##-- Descriptiva bivariant
?state
View(state.x77)
str(state.x77)
str(as.data.frame(state.x77))
state.region
state77 <- cbind(as.data.frame(state.x77), state.region)
head(state77)
summary(state77)
names(state77)[c(4, 6, 9)] <- c("LifeExp", "HSGrade", "Region")
names(state77)

windows()
par(las=1)
pairs(state77[, 1:8], pch=16)




windows(height=5, width=15)
par(mfrow=c(1, 3), las=1, font.lab=2, font.axis=3)
with(state77, plot(Illiteracy, LifeExp, pch=17, col=2))
with(state77, plot(Illiteracy~Income, pch=18, col=3, cex=1.3))
#plot(LifeExp~Murder, data=state77, pch=19, col=4, ylab="Life expectancy", cex=1.5)
plot(LifeExp~Frost, data=state77, pch=19, col=4, ylab="Life expectancy", cex=1.5)


cor(state77) # REGION IS NOT NUMERIC! is.numeric(state77$Region) # summary(state77$Region)
round(cor(state77[, 1:8]), 3)
with(state77, round(cor(Area, Illiteracy), 3))
with(state77, round(cor(LifeExp, Illiteracy), 3))

cut(state77$Income, c(0, 4000, 4500, 5000, 10000))
state77$Income.cat <- cut(state77$Income, c(0, 4000, 4500, 5000, 10000),
                            labels=c("<= 4000", "4001--4500", "4501--5000", ">5000"))

head(state77, 10) # 10 PRIMERES OBSERVACIONS


#5
with(state77, table(Region, Income.cat))
library(descr)
with(state77, CrossTable(Region, Income.cat, prop.c = F, prop.t = F,
                           prop.chisq = F, format='SPSS'))

windows(height=8, width=16)
par(mfrow=c(1, 2), las=1, font.lab=2, font.axis=3)
with(state77, barplot(table(Income.cat, Region), col=1:4, legend=T, xlab="Region"))
mosaicplot(Region~Income.cat, data=state77, col=1:4, ylab="Income",
             main="Income per region")
