#' htmlwidget to create Venn diagrams with d3.js and venn.js
#'
#' <Add Description>
#'
#' @importFrom htmlwidgets createWidget JS sizingPolicy
#'
#' @export
d3vennR <- function(
  data = NULL
  , padding = NULL, colours = NULL, fontSize = NULL
    , duration = NULL, layoutFunction = NULL
  , tasks = NULL
  , width = NULL, height = NULL
) {

  # try to be smart about insuring that layoutFunction is a JavaScript function
  #    so use htmlwidgets::JS if not already applied
  if(!is.null(layoutFunction) &&
     !inherits(layoutFunction,"JS_EVAL")
  ){
    layoutFunction = htmlwidgets::JS(layoutFunction)
  }

  # forward options using x
  x = list(
    data = data
    , options = list(
      padding = padding
      , colours = colours
      , fontSize = fontSize
      , duration = duration
      , layoutFunction = layoutFunction
      #  add height and width as options also
      , width = width
      , height = height
    )
    , tasks = tasks
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'd3vennR',
    x,
    width = width,
    height = height,
    package = 'd3vennR',
    sizingPolicy = sizingPolicy(browser.padding = 0)
  )
}

#' Widget output function for use in Shiny
#'
#' @export
#' @importFrom htmlwidgets shinyWidgetOutput
d3vennROutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'd3vennR', width, height, package = 'd3vennR')
}

#' Widget render function for use in Shiny
#'
#' @export
#' @importFrom htmlwidgets shinyRenderWidget
renderD3vennR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, d3vennROutput, env, quoted = TRUE)
}
