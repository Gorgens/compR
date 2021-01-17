require(ggplot2)
require(scales)
require(gmodels)
require(Hmisc)
require(corrgram)
require(quantreg)
require(rcompanion)

windowsFonts(Times=windowsFont("Times New Roman"))
dds=read.csv("ddsr.csv", sep = ";",dec=",")

# gráfico histograma
ggplot(dds, aes(idade)) + geom_histogram(aes(y = (..count..)/sum(..count..)), binwidth = 1, fill= "grey50", col="white") +
  scale_x_continuous(lim = (c(13,82))) +
  xlab("Idade em anos") + ylab("Porcentagem de pacientes") +
  scale_y_continuous(labels=percent) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"),
        text=element_text(family = "Times", size = 11))

# gráfico de barras
ggplot(dds, aes(g_etario)) + geom_bar(aes(y = (..count..)/sum(..count..)), width = 0.5, fill = "grey50") +
  xlab("grupo etario (anos)") + ylab("Porcentagem de individuos") +
  scale_y_continuous(labels=percent) + 
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(colour = "black"),
        text=element_text(family = "Times", size = 11))


# boxplot e teste de hipótese
boxplot (dds$idade ~ dds$ideal, xlab = "Desfecho ideal", ylab = "Idade (anos)")
shapiro.test(dds$idade)
hist(dds$idade)
wilcox.test(dds$idade ~dds$ideal)
t.test(dds$consultas_ano ~dds$ideal)

# tabela de frequência e qui-quadrado
f= table(dds$ideal, dds$g_etario)
f
xsqf= chisq.test(f)
xsqf

