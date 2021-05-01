#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Riqueza, Uniformidade e Diversidade"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sp",
                        "Número de espécie:",
                        min = 1,
                        max = 200,
                        value = 4),
            sliderInput("pop",
                        "Númreo de indivíduos:",
                        min = 10,
                        max = 4000,
                        value = 1000),
            selectInput("padrao", 
                        "Padrão de distribuição", 
                        choices = list("Uniforme" = 1, "Desuniforme" = 2), selected = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("comunityPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    createComunity = reactive({
        especie = c()
        coordx = c()
        coordy = c()
        
        for(i in seq(1, input$pop)){
            if(input$padrao == 1){
                especie[i] = sample(1:input$sp, 1)
            } else if(input$padrao == 2){
                especie[i] = sample(1:input$sp, 1, prob = input$sp:1)
            } else {
                break
            }
            coordx[i] = runif(1, 0, 100)
            coordy[i] = runif(1, 0, 100)
        }
        
        data.frame(especie = especie, coordx = coordx, coordy = coordy)
    })
    
    shannon = reactive({
        dfcomunidade = createComunity()
        termo1 = -1 * table(dfcomunidade$especie)/length(dfcomunidade$especie)
        termo2 = log(table(dfcomunidade$especie)/length(dfcomunidade$especie))
        sum(termo1 * termo2)
    })
    
    output$comunityPlot = renderPlotly({
        p = plot_ly(data = createComunity(), x = ~coordx, y = ~coordy, color = ~especie, 
                    type = 'scatter', mode = 'markers')

        p = layout(p, title = paste("H': ", round(shannon(), 2)))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
