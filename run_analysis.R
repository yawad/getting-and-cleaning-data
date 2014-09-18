run_analysis <- function() {
 
    # Create directory if it doesn't exist and set it as working dir
    wd <- paste( getwd() , "/courseproject3" , sep = "")

    if ( ! file.exists( wd ) )
    {
        dir.create( file.path( wd ) )
    }
    
    # Download and extract data set
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "data.zip", method = "curl")
    unzip(zipfile = "data.zip", overwrite = TRUE )

    dirData <- paste( wd ,"/UCI HAR Dataset/" , sep = "")
    
    fileTestSet <- paste( dirData , "/test/X_test.txt" , sep = "")
    fileTrainingSet <- paste( dirData , "/train/X_train.txt" , sep = "")
    
    # Activity labels
    fileActivityLabels <- paste( dirData , "/activity_labels.txt" , sep = "")
    tableActivityLabels <- read.table(file = fileActivityLabels , header = FALSE, sep = "")
    
    # Features
    fileFeatures <- paste( dirData , "/features.txt" , sep = "")
    tableFeatures <- read.table(file = fileFeatures , header = FALSE, sep = "")
    
    # Test Data
    fileTestSubjects <- paste( dirData , "/test/subject_test.txt" , sep = "")
    tableTestSubjects <- read.table(file = fileTestSubjects , header = FALSE, sep = "")
    
    fileTestActivity <- paste( dirData , "/test/y_test.txt" , sep = "")
    tableTestActivity <- read.table(file = fileTestActivity , header = FALSE, sep = "")
    
    tableTest <- read.table(file = fileTestSet , header = FALSE, sep = "")

    # add columns names
    names( tableTest ) <- tableFeatures[,2]
    names( tableTestSubjects ) <- "Subjects"
    names( tableTestActivity ) <- "Activity"
 
    # Replace by descriptive activity names
    tableTestActivity$Activity <- as.factor(tableTestActivity$Activity)
    levels(tableTestActivity$Activity) <- tableActivityLabels$V2
    
    # combine columns: subjects, data set and data type
    dsTest <- cbind( tableTestSubjects , tableTestActivity, tableTest )
    
    # Train Data    
    fileTrainSubjects <- paste( dirData , "/train/subject_train.txt" , sep = "")
    tableTrainSubjects <- read.table(file = fileTrainSubjects , header = FALSE, sep = "")
    
    fileTrainActivity <- paste( dirData , "/train/y_train.txt" , sep = "")
    tableTrainActivity <- read.table(file = fileTrainActivity , header = FALSE, sep = "")
    
    tableTrain <- read.table(file = fileTrainingSet , header = FALSE, sep = "")

    # add columns names
    names( tableTrain ) <- tableFeatures[,2]
    names( tableTrainSubjects ) <- "Subjects"
    names( tableTrainActivity ) <- "Activity"

    # Replace by descriptive activity names
    tableTrainActivity$Activity <- as.factor(tableTrainActivity$Activity)
    levels(tableTrainActivity$Activity) <- tableActivityLabels$V2

    # combine columns: subjects, data set and data type
    dsTrain <- cbind( tableTrainSubjects , tableTrainActivity, tableTrain )

    # Combine the Test and Training data sets
    combinedDs <- rbind( dsTest , dsTrain )

    # Extracts only the measurements on the mean and standard deviation for each measurement
    newDS <- combinedDs[,c(1,2,grep("mean|std",ignore.case = FALSE, names(combinedDs)))]

    tbldf <- tbl_df( aggregate( newDS[,3:ncol(newDS)], newDS[,1:2], FUN = mean ))

    outputFile <- "averageBySubjectAndActivity.txt"

    write.table(x = tbldf, file = outputFile, append = FALSE, sep = " ", na = "NA", row.name=FALSE )
    
    tbldf
}