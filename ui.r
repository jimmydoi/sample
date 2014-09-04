# --------------------------
#  App Title: Longest Run
#     Author: Jimmy Doi
# --------------------------

library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    tags$title("Longest Run of Heads or Tails"),
    titlePanel("Longest Run of Heads or Tails"),

    div("Note: Please adjust width of browser if only one column is visible.",
        style = "font-size: 9pt;color:teal"),br(),
    
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        
        sliderInput("trials", 
                    label = h5(HTML((paste0("Number of trials (", em("n"),"):")))),
                    min = 10, max = 400, value = 200, step=10),br(),
        
        
        sliderInput("minrun", 
                    label = h5("Mark run lengths of at least ..."),
                    min = 2, max = 15, value = 5, step=1),
        div("Change of specified run length will impact marked runs in current plot", style = "font-size: 9.5pt;color:teal",align="right"),br(),
        
        
        sliderInput("my.cex", 
                    label = h5("Font Size:"),
                    min = 0.5, max = 2.5, value = 1.5, step=.1),br(),
        
        checkboxInput("checkbox", label = "Include predicted longest run and prediction interval", value = TRUE),br(),

        div(actionButton("save", label="Generate"),align="right"),
        div("Click", tags$b("Generate")," to re-randomize outcomes based on current number of trials", style = "font-size: 9.5pt;color:teal",align="right"),br(),
        
        
        
        br(), br(), br(), br(), 
        
        div("Shiny app by", 
            a(href="http://statweb.calpoly.edu/jdoi/",target="_blank", 
              "Jimmy Doi"),align="right", style = "font-size: 8pt"),
        
        div("Base R code by", 
            a(href="http://statweb.calpoly.edu/jdoi/",target="_blank", 
              "Jimmy Doi"),align="right", style = "font-size: 8pt"),
        
        div("Shiny source files:",
            a(href="https://gist.github.com/jimmydoi/dc513e9b8c47d0f4daf0",
              target="_blank","GitHub Gist"),align="right", style = "font-size: 8pt")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        
        plotOutput("coinPlot", width="100%"), hr(),
        
        p("If a fair coin is flipped 100 times and a streak of 7 heads (or tails) in a row is observed, is that an unusual result? To answer this we can simulate tosses of a fair coin and keep track of runs of heads or tails.",style="margin-top:-10px"),
        p("This Shiny app allows you to simulate the outcomes of a fair coin flipped", HTML(paste(em("n"),sep="")), "times. Any runs of at least the length you specify will be marked in color, and the length of the longest run will be given. You may also choose to display the predicted approximate length of the longest run and an approximate 95% prediction interval for the length of the longest run. Details on these two estimators can be found in the first reference below.") ,
          
        
        p("More information on the length of the longest run can be found in the following journal 
       articles:"),
        
        div("Schilling, M. 'The Longest Run of Heads'",
            em("The College Mathematics Journal"),", 21(3), 196--207", style="padding-left: 20px; display:block; border-left: 5px solid #faebbc;margin-left:0px"),
        div("Schilling, M. 'The Surprising Predictability of Long Runs'",
            em("Mathematics Magazine"),", 85(2), 141--149", style="padding-left: 20px; display:block; border-left: 5px solid #faebbc;margin-left:0px")
      )
      
    )
  )
)
