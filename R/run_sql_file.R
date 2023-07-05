#' Run SQL From a File
#'
#' @param con A database connection
#' @param sql_file A SQL file to run on the database
#'
#' @importFrom dplyr  %>%
#' @importFrom glue glue_sql
#' @importFrom DBI dbGetQuery
#' @importFrom dplyr as_tibble
#' @importFrom readr read_file
#'
#' @return tibble
#' @export
#'
#' @examples
#' \dontrun{
#' pats <- run_sql_file(my_conn,
#'                      here::here("src/get_patients.sql"))}
run_sql_file <- function(con,
                         sql_file) {
  # Read file
  sql_result <- readr::read_file(file = sql_file) %>%
    #Format
    glue::glue_sql(.con = con) %>%
    # Run
    DBI::dbGetQuery(conn = con) %>%
    # As tibble
    dplyr::as_tibble()

  return(sql_result)
}
