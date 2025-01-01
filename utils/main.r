
#' Function to read data from MySQL and return a dataframe
#' @param host MySQL host address
#' @param dbname Database name
#' @param username MySQL username
#' @param password MySQL password 
#' @param query SQL query to execute
#' @return Dataframe containing query results
#' @import RMySQL
read_mysql_data <- function(host, dbname, username, password, query) {
  
  # Create database connection
  con <- dbConnect(MySQL(), 
                  host = host,
                  dbname = dbname, 
                  user = username,
                  password = password)
  
  # Execute query and fetch results
  result <- dbGetQuery(con, query)
  
  # Close connection
  dbDisconnect(con)
  
  # Return results as dataframe
  return(result)
}

# Example usage
host <- "your_mysql_host"
dbname <- "your_database_name"
username <- "your_username"
password <- "your_password"
query <- "SELECT * FROM users LIMIT 10"

data <- read_mysql_data(host, dbname, username, password, query)

print(data)