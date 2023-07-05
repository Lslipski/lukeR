#' Run a SQL string on a database
#'
#' @param con A database connection
#' @param sql_string  A sql string to run on the database
#'
#' @importFrom dplyr  %>%
#' @importFrom glue glue_sql
#'
#' @return a tibble
#' @export
#'
#' @examples
#' \dontrun{}
#' pats <- run_sql_string(con,
#'                 "SELECT * FROM patient_table;")}
run_sql_string <- function(con,
                           sql_string) {
  # format
  glue::glue_sql(.con = con,
                 sql_string) %>%
    # run
    DBI::dbGetQuery(conn = con) %>%
    # format
    dplyr::as_tibble()
}
