# Set the directory path to the folder containing the text files
folderPath <- "/Users/arihangupta/Downloads/csvFiles"

# Get a list of all text files in the folder
fileList <- list.files(folderPath, pattern = ".txt", full.names = TRUE)

# Initialize an empty list to store data frames
dataFramesList <- list()

# Iterate through each text file
for (filePath in fileList) {
  # Read the text file and store it as a data frame
  data <- read.csv(filePath, header = TRUE, sep = ",")
  colnames(data) <- c("totInt", "cellArea", "cellnum", "bkgrdInt", "frame", "cond", "time", "strain")
  # Append the data frame to the list
  dataFramesList <- c(dataFramesList, list(data))
}

# Combine all data frames into one large data frame
combinedDataFrame <- do.call(rbind, dataFramesList)
