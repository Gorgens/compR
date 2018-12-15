arvores = read.csv('arvores.csv', sep = ',', dec = '.')
head(arvores)

plot(arvores$dap, arvores$alt)

plot(alt~dap, data = arvores)

plot(alt~dap, data = arvores, xlab = 'dap (cm)', ylab = 'Altura (m)', 
     xlim = c(0, 90), ylim = c(0, 60), main = 'Altura = f(dap)', pch = 20)

plot(alt~dap, data = arvores)
abline(lm(alt~dap, data = arvores))

boxplot(dap~vert, data = arvores)
boxplot(alt~vert, data = arvores)

hist(arvores$dap)
hist(arvores$alt, freq = FALSE)
hist(arvores$alt, breaks = 3)

cor(arvores$dap, arvores$alt)
cor(arvores$dap, arvores$alt, method = 'spearman')

install.packages('Hmisc')
require(Hmisc)
library(Hmisc)

rcorr(arvores$dap, arvores$alt)

cov(arvores$dap, arvores$alt)

mean(arvores$dap)
median(arvores$dap)

quantile(arvores$dap, 0.75)
quantile(arvores$dap)

var(arvores$dap)
sd(arvores$dap)

shapiro.test(arvores$dap)

anova = aov(dap~vert, data = arvores)
summary(anova)

kruskal.test(dap~vert, data = arvores)

grupoE = subset(arvores$dap, arvores$vert == "E")
grupoC = subset(arvores$dap, arvores$vert == "C")
t.test(grupoE, grupoC)

grupoE = subset(arvores$dap, arvores$vert == "E")
grupoC = subset(arvores$dap, arvores$vert == "C")
wilcox.test(grupoE, grupoC)

reg = lm(alt~dap, data = arvores)
summary(reg)
