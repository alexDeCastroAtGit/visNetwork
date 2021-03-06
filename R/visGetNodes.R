#' Function to get nodes data, with shiny only.
#'
#' Function to get nodes data, with shiny only. 
#' 
#' @param graph : a \code{\link{visNetworkProxy}}  object
#' @param input : name of shiny input created. Default to paste0(graph$id, "_nodes")
#' @param addCoordinates : Boolean. Add coordinates to nodes data ? Default to TRUE.
#' 
#'@seealso \link{visNodes} for nodes options, \link{visEdges} for edges options, \link{visGroups} for groups options, 
#'\link{visLegend} for adding legend, \link{visOptions} for custom option, \link{visLayout} & \link{visHierarchicalLayout} for layout, 
#'\link{visPhysics} for control physics, \link{visInteraction} for interaction, \link{visNetworkProxy} & \link{visFocus} & \link{visFit} for animation within shiny,
#'\link{visDocumentation}, \link{visEvents}, \link{visConfigure} ...
#' 
#' @examples
#'\dontrun{
#'
#'# have a look to : 
#'shiny::runApp(system.file("shiny", package = "visNetwork"))
#'
#'}
#'
#'@export
#'@references See online documentation \url{http://datastorm-open.github.io/visNetwork/}
visGetNodes <- function(graph, input = paste0(graph$id, "_nodes"), addCoordinates = T){
  
  if(!any(class(graph) %in% "visNetwork_Proxy")){
    stop("Can't use visGetNodes with visNetwork object. Only within shiny & using visNetworkProxy")
  }
  
  data <- list(id = graph$id, input = input, addCoordinates = addCoordinates)
  
  graph$session$sendCustomMessage("visShinyGetNodes", data)
  
  graph
}
