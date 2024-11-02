library(httr)
library(rvest)
library(purrr)
library(glue)
library(readr)

otodom <- read_csv("data/full_urls.csv")
otodom <- otodom$full_url

get_node_text <- function(nodes) {
  if (length(nodes) == 0) {
    return("None")
  } else {
    return(nodes %>% html_text())
  }
}

# Initialize lists to store data
link_list <- address_list <- desc_list <- title_list <- price_list <- count_photos_list <- area_list <- rent_list <- room_no_list <- deposit_list <- floor_list <- building_type_list <- outdoor_list <- construction_status_list <- advertiser_type_list <- rent_to_students_list <- equipment_list <- media_list <- heating_list <- security_list <- windows_list <- lift_list <- parking_list <- build_year_list <- building_material_list <- additional_info_list <- list()

make_request <- function(url) {
  url <- glue::glue(url)
  otodom <- GET(url, user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"))
  
  if (otodom$status_code >= 200 && otodom$status_code < 400) {
    print(glue::glue("Request for URL {url} successful!"))
    
    html_content <- content(otodom, "text", encoding = "UTF-8")
    html_doc <- read_html(html_content)
    body_content <- html_nodes(html_doc, "body")
    
    #Mandatory fields in OtoDom, never empty string, because an offer cannot be uploaded in OtoDom when these fields are incompleted
    link <- otodom$url
    
    address <- html_elements(body_content, xpath = '//a[starts-with(@aria-label, "Adres")]') %>%
      html_text()
    
    desc <- html_nodes(body_content, xpath = '//div[@data-cy="adPageAdDescription"]/p') %>%
      html_text() %>%
      toString()
    
    price <- html_nodes(body_content, xpath = '//strong[@aria-label="Cena"]') %>%
      html_text()
    
    count_photos <- stri_extract(body_content, regex = '(?<="ad_photo":)\\d+')
    
    area <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-area"]') %>%
      html_text()
    
    advertiser_type <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-advertiser_type"]') %>%
      html_text()
    
    
    #Additional information part - in this part if somebody did not fill these fields - we have "brak informacji" filled automatically by OtoDom, so never empty string
    rent_to_students <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-rent_to_students"]') %>%
      html_text()
    
    equipment <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-equipment_types"]') %>%
      html_text()
    
    media <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-media_types"]') %>%
      html_text()
    
    heating <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-heating"]') %>%
      html_text()
    
    security <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-security_types"]') %>%
      html_text()
    
    windows <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-windows_type"]') %>%
      html_text()
    
    lift <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-lift"]') %>%
      html_text()
    
    parking <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-car"]') %>%
      html_text()
    
    build_year <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-build_year"]') %>%
      html_text()
    
    building_material <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-building_material"]') %>%
      html_text()
    
    additional_info <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-extras_types"]') %>%
      html_text()
    
  
    # Non-mandatory fields, always check if the string is empty
    title_nodes <- html_nodes(body_content, xpath = '//h1[@data-cy="adPageAdTitle"]')
    title <- get_node_text(title_nodes)
    
    rent_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-rent"]') 
    rent <- get_node_text(rent_nodes)
    
    room_no_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-rooms_num"]/a')
    room_no <- get_node_text(room_no_nodes)
    
    deposit_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-deposit"]') 
    deposit <- get_node_text(deposit_nodes)
    
    floor_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-floor"]') 
    floor <- get_node_text(floor_nodes)
    
    building_type_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-building_type"]') 
    building_type <- get_node_text(building_type_nodes)
    
    outdoor_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-outdoor"]') 
    outdoor <- get_node_text(outdoor_nodes)
    
    construction_status_nodes <- html_nodes(body_content, xpath = '//div[@data-testid="table-value-construction_status"]') 
    construction_status <- get_node_text(construction_status_nodes)
    
    
    # Append data to lists
    link_list <<- append(link_list, link)
    address_list <<- append(address_list, address)
    desc_list <<- append(desc_list, desc)
    title_list <<- append(title_list, title)
    price_list <<- append(price_list, price)
    count_photos_list <<- append(count_photos_list, count_photos)
    area_list <<- append(area_list, area)
    rent_list <<- append(rent_list, rent)
    room_no_list <<- append(room_no_list, room_no)
    deposit_list <<- append(deposit_list, deposit)
    floor_list <<- append(floor_list, floor)
    building_type_list <<- append(building_type_list, building_type)
    outdoor_list <<- append(outdoor_list, outdoor)
    construction_status_list <<- append(construction_status_list, construction_status)
    advertiser_type_list <<- append(advertiser_type_list, advertiser_type)
    rent_to_students_list <<- append(rent_to_students_list, rent_to_students)
    equipment_list <<- append(equipment_list, equipment)
    media_list <<- append(media_list, media)
    heating_list <<- append(heating_list, heating)
    security_list <<- append(security_list, security)
    windows_list <<- append(windows_list, windows)
    lift_list <<- append(lift_list, lift)
    parking_list <<- append(parking_list, parking)
    build_year_list <<- append(build_year_list, build_year)
    building_material_list <<- append(building_material_list, building_material)
    additional_info_list <<- append(additional_info_list, additional_info)
    
  } else {
    warning(paste("Request for URL {url} failed with status code:", otodom$status_code))
  }
  
  Sys.sleep(2)
}

tryCatch({
  map(otodom, make_request)
  
  # Combine lists into a data frame
  df <- data.frame(
    Link = unlist(link_list),
    Address = unlist(address_list),
    Description = unlist(desc_list),
    Title = unlist(title_list),
    Price = unlist(price_list),
    CountPhotos = unlist(count_photos_list),
    Area = unlist(area_list),
    Rent = unlist(rent_list),
    RoomNumber = unlist(room_no_list),
    Deposit = unlist(deposit_list),
    Floor = unlist(floor_list),
    BuildingType = unlist(building_type_list),
    Outdoor = unlist(outdoor_list),
    ConstructionStatus = unlist(construction_status_list),
    AdvertiserType = unlist(advertiser_type_list),
    RentToStudents = unlist(rent_to_students_list),
    Equipment = unlist(equipment_list),
    Media = unlist(media_list),
    Heating = unlist(heating_list),
    Security = unlist(security_list),
    Windows = unlist(windows_list),
    Lift = unlist(lift_list),
    Parking = unlist(parking_list),
    BuildYear = unlist(build_year_list),
    BuildingMaterial = unlist(building_material_list),
    AdditionalInfo = unlist(additional_info_list)
  )
  
  #print(df)
}, error = function(e) {
  cat("Error: ", conditionMessage(e), "\n")
})

write_csv(df, file = "data/OtoDom_data.csv")
print("DONE")