# Shiny Dashboard (No SQL). 
# Written by : Theodora Putrina Gea
# Department of Business statistics, Matana University
# Notes: Please don't share this code anywhere (just for my lecturer and my friends)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# A. Libraries 
library(shiny)
library(shinydashboard)
library(dplyr)
library(readxl)
library(plotly)
library(rworldmap)

# B. Import Data

Complete <- read.csv2("Complete.csv", header = TRUE, sep = ";")

# C. User Interface
shinyUI(
    dashboardPage(
        skin = "purple",
        dashboardHeader(title = "Factory Dashboard",
                        dropdownMenu(type = "messages"),
                        dropdownMenu(type = "notifications"),
                        dropdownMenu(type = "tasks"),
                        tags$li(class = "dropdown",tags$img(src = "Matana.png", height = 48, width = 48))
                        ),
        dashboardSidebar(
            sidebarMenu(
                sidebarSearchForm("searchText",
                                  "buttonSearch",
                                  "Search"),
                menuItem("Dashboard",
                         tabName = "dashboard",
                         icon = icon("dashboard")),
                menuItem("Table",
                         tabName = "table",
                         icon = icon("table")),
                menuItem("Summary",
                         tabName = "summary",
                         icon = icon("clipboard-list")),
                menuItem("Raw Data & Source Code",
                         icon = icon("download"),
                         href = ""),
                menuItem("About Me",
                         icon = icon("id-card"),
                         menuSubItem("Linked in",
                                     icon = icon("linkedin"),
                                     href = "https://www.linkedin.com/in/theodora-putrina-0927141a2/"),
                         menuSubItem("Facebook",
                                     icon = icon("facebook-square"),
                                     href = "https://web.facebook.com/theodora.putrinagea.9/"))
            )
        ),
        dashboardBody(
            tabItems(
                tabItem(
                    tabName = "dashboard",
                    fluidRow(
                        infoBox("Top Sales (Country)",
                                628,"USA",
                                width = 3,
                                icon = icon("globe-americas"),
                                color = "olive"),
                        infoBox("Top Sales (City)",
                                205, "London",
                                width = 3,
                                icon = icon("city"),
                                color = "teal"),
                        infoBox("Top Product",
                                108, "Raclette Courdavault",
                                width = 3,
                                icon = icon("heart"),
                                color = "olive"),
                        infoBox("Top Quantity",
                                130,
                                width = 3,
                                icon = icon("thumbs-up"),
                                color = "teal")
                    ),
                    fixedRow(
                        valueBoxOutput("value1", width = 4),
                        valueBoxOutput("value2", width = 4),
                        valueBoxOutput("value3", width = 4)
                    ),
                    fluidRow(
                        box(title = "Histogram",
                            status = "primary",
                            solidHeader = T,
                            plotlyOutput("histogram")),
                        box(title = "Bar Plot",
                            status = "danger",
                            solidHeader = T,
                            plotlyOutput("bar_plot"))
                    ),
                    fluidRow(
                        box(title = "Box Plot",
                            width = 12,
                            status = "success",
                            solidHeader = T,
                            plotlyOutput("box_plot")))
                ),
                tabItem(tabName = "table",
                        fluidRow(
                            DT::dataTableOutput("data_table"))
                ),
                tabItem(tabName = "summary",
                        fluidRow(
                            verbatimTextOutput("summary")
                        ),
                        
                )
            )
        )
    )
)

