# Load the necessary package
# Install and load the necessary package

install.packages("jsonlite")
# Install the base64enc package if you haven't already
install.packages("base64enc")

# Load the package
library(base64enc)
library(jsonlite)
library(readr)


# Load the semicolon-delimited CSV file
df <- read_delim("C:\\Users\\datlo\\Desktop\\Website Design\\market-report-longtu290.csv", delim = ";")

# Rename the columns manually
colnames(df) <- c("Name", "Customer_price_USD", "Agent_commission_percent", "Agent_commission_USD", 
                  "Seller_reward_percent", "Seller_reward_USD", "Date")

# Clean up the 'Name' column by removing leading/trailing whitespaces
df$Name <- trimws(df$Name)

# Export the cleaned dataframe to a CSV file
write_csv(df, "C:/Users/datlo/Desktop/Website Design/cleaned_market_report.csv")


# Get the count of each unique name in the "Name" column
name_counts <- table(df$Name)

# Display the name counts
print(name_counts)

# Convert the name_counts table to a named list
name_counts_list <- as.list(name_counts)

# Use a full file path with the filename included and use forward slashes
write_json(name_counts_list, "C:/Users/datlo/Desktop/Website Design/name_counts.json")

# Read the CSV file as raw binary data
csv_path <- "C:/Users/datlo/Desktop/Website Design/cleaned_market_report.csv"
csv_binary <- readBin(csv_path, what = "raw", n = file.info(csv_path)$size)

# Encode the binary content to Base64
csv_base64 <- base64encode(csv_binary)

# Print the Base64 encoded string
print(csv_base64)

# Optionally, save the Base64 string to a file (if needed)
writeLines(csv_base64, "C:/Users/datlo/Desktop/Website Design/encoded_csv.txt")



