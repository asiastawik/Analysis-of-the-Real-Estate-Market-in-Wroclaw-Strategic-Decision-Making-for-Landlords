library(tidyverse)
library(stringi)
library(rvest)
library(httr)

no_pages <- 1:66

make_request <- function(page) {
  url <- glue::glue("https://www.otodom.pl/pl/wyniki/wynajem/mieszkanie/dolnoslaskie/wroclaw?page={page}")
  otodom <- GET(url, user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"))
  
  if (otodom$status_code >= 200 && otodom$status_code < 400) {
    print(glue::glue("Request for page {page} successful!"))
    
    html_content <- content(otodom, "text", encoding = "UTF-8")
    html_doc <- read_html(html_content)
    body_content <- html_nodes(html_doc, "body")
    
    where_https <- html_elements(body_content, xpath = '//a[starts-with(@href, "/pl/oferta")]') 
    links <- html_attr(where_https, "href") %>% unique()
    
    return(links)
    
  } else {
    warning(paste("Request for page {page} failed with status code:", otodom$status_code))
  }
  
  Sys.sleep(2)
}

tryCatch({
  results <- map(no_pages, make_request)
  print(results)
}, error = function(e) {
  cat("Error: ", conditionMessage(e), "\n")
})

results <- unlist(results) %>%
  unique()

base_url <- "https://www.otodom.pl"

generate_full_url <- function(endpoint) {
  full_url <- stri_c(base_url, endpoint)
  return(full_url)
}

full_urls <- map(results, generate_full_url) 
df_full_urls <- data.frame(full_url = unlist(full_urls))
write_csv(df_full_urls, file = "data/full_urls.csv", row.names = FALSE)


